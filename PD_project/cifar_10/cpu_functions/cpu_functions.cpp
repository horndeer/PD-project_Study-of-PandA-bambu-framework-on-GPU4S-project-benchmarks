#include "cpu_functions.h"

#define max(a,b) \
   ({ __typeof__ (a) _a = (a); \
       __typeof__ (b) _b = (b); \
     _a > _b ? _a : _b; })

const double K = 2;
const double ALPHA = 10e-4;
const double BETA = 0.75;

double ln20(double x) {
    if (x <= 0) return 0; // Logarithm not defined for non-positive values.
    double result = 0;
    // Use a simple series for approximation: ln(x) ≈ sum(((-1)^(n+1))/n * ((x-1)^n)), for n = 1 to infinity.
    // This is a very basic approximation.
    for (int n = 1; n <= 20; ++n) {
        double term = 1.0;
        for (int i = 1; i <= n; ++i) {
            term *= (x - 1) / i;
        }
        if (n % 2 == 0) {
            result -= term;
        } else {
            result += term;
        }
    }
    return result;
}

double exp20(double x) {
    double result = 1; // e^0 = 1
    double term = 1;
    for (int n = 1; n <= 20; ++n) {
        term *= x / n;
        result += term;
    }
    return result;
}

double pow20(double base, double exponent) {
    // Check if exponent is an integer
    if (exponent == static_cast<int>(exponent)) {
        double result = 1;
        int intExponent = static_cast<int>(exponent);
        if (intExponent < 0) {
            base = 1 / base;
            intExponent = -intExponent;
        }
        for (int i = 0; i < intExponent; ++i) {
            result *= base;
        }
        return result;
    } else {
        // Use the existing implementation for non-integer exponents
        if (base == 0) return 0; // 0 raised to any power is 0.
        if (exponent == 0) return 1; // Any number raised to the power of 0 is 1.
        // Use the identity a^b = e^(ln(a) * b)
        return exp20(ln20(base) * exponent);
    }
}

void convolution(const bench_t *A, bench_t *B, const bench_t *kernel,const int n, const int m, const int w, const int kernel_size)
{
	const int kernel_rad = kernel_size / 2;
	int x, y, kx, ky = 0;
	bench_t sum = 0;
	bench_t value = 0;

	const unsigned int squared_kernel_size = kernel_size * kernel_size;
	
	for (unsigned int block = 0; block < n*n; ++block)
	{
		x = block/n;
		y = block%n;
		sum = 0;
		for(unsigned int k = 0; k < squared_kernel_size; ++k)
		{
			value = 0;
			kx = (k/kernel_size) - kernel_rad; 
			ky = (k%kernel_size) - kernel_rad;
			if(!(kx + x < 0 || ky + y < 0) && !( kx + x > n - 1 || ky + y > n - 1))
			{
				value = A[(x + kx)*n+(y + ky)];
			}
			sum += value * kernel[(kx+kernel_rad)* kernel_size + (ky+kernel_rad)];
		}
		B[x*n+y] = sum;
	}
}

long int get_timestamp(){
	struct timeval time_now{};
    gettimeofday(&time_now, nullptr);
    time_t msecs_time = (time_now.tv_sec * 1000) + (time_now.tv_usec / 1000);
	return (long int) msecs_time;
}

void relu(const bench_t *A, bench_t *B, const int size)
{
	// Compute traditional relu approach 
	for (unsigned int i = 0; i < size; ++i)
	{
		for (unsigned int j = 0; j < size; ++j)
		{
			if (A[i*size+j] > 0)
			{
				B[i*size+j] = A[i*size+j];
			}
			else 
			{
				B[i*size+j] = 0;
			}
		}
	}
}


void relu_linear(const bench_t *A, bench_t *B, const int size)
{
	// Compute traditional relu approach 
	for (unsigned int i = 0; i < size; ++i)
	{
		if (A[i] > 0)
		{
			B[i] = A[i];
		}
		else 
		{
			B[i] = 0;
		}
	}
}


void max_pooling(const bench_t *A, bench_t *B, const int size, const unsigned int stride,  const unsigned int lateral_stride)
{	
	bench_t max_value = 0;
	for (unsigned int i = 0; i < size; i+= stride)
	{
		for (unsigned int j = 0; j < size; j+= stride)
		{
			max_value = A[i*size+j];
			for(unsigned int x = 0; x < stride; ++x)
			{
				for(unsigned int y = 0; y < stride; ++y)
				{
					max_value = max(max_value, A[(i + x) * size + (j +y)]);
				}
			}
			B[(i / stride)* lateral_stride + (j/stride)] = max_value;
		}
	}
}


void lrn(const bench_t *A, bench_t *B, const int size)
{
	for (unsigned int i = 0; i < size; ++i)
	{
		for (unsigned int j = 0; j < size; ++j)
		{
			B[i*size+j] = A[i*size+j]/pow20((K+ALPHA*pow20(A[i*size+j],2)),BETA);
		}
	}
}


void matrix_multiplication(const bench_t *A,const bench_t *B,  bench_t *C, const int n, const int m, const int w)
{
	for (unsigned int i = 0; i < n; i++)
	{
		for (unsigned int j = 0; j < m; j++)
		{
			bench_t acumulated = 0;
			for (unsigned int k = 0; k < w; k++)
			{   
				acumulated += A[i*w+k] * B[k*m+j];
			}
			C[i*m+j] = acumulated;
		}
	}
}


void softmax(const bench_t *A, bench_t *B, const int size)
{	
	bench_t sum_values = 0;
	bench_t value = 0;
	
	for (unsigned int i = 0; i < size; i++)
	{
		value = exp20 (A[i]);
		sum_values += value;
		B[i] = value;
	}
	
	for (unsigned int i = 0; i < size; i++)
	{
		B[i] = (B[i]/sum_values);
	}
}


void cifar10(bench_t* output_data, bench_t* conv_1_output, bench_t* pooling_1_output, bench_t* conv_2_output, bench_t* pooling_2_output, bench_t* dense_layer_1_output, bench_t* dense_layer_2_output, bench_t* input_data, bench_t* kernel_1_data, bench_t* kernel_2_data, bench_t* weights_1 ,bench_t* weights_2, 
unsigned int input_data_size, unsigned int output_data_size, unsigned int kernel_1_size, unsigned int kernel_2_size, unsigned int stride_1_size, unsigned int stride_2_size, unsigned int neurons_dense_1_size, unsigned int neurons_dense_2_size)
{
	// 1-1 Step convolution
	convolution(input_data, conv_1_output, kernel_1_data, input_data_size, input_data_size, input_data_size, kernel_1_size);

	// 1-2 Step activation
	relu(conv_1_output, conv_1_output, input_data_size);
	
	// 1-3 Step pooling
    const unsigned int size_lateral_1 = input_data_size / stride_1_size;
	max_pooling(conv_1_output, pooling_1_output, input_data_size, stride_1_size, size_lateral_1);

	// 1-4 Normalization
	lrn(pooling_1_output, pooling_1_output, size_lateral_1);

	// 2-1 Step convolution
    convolution(pooling_1_output, conv_2_output, kernel_2_data, size_lateral_1, size_lateral_1, size_lateral_1, kernel_2_size);

	// 2-2 Step activation
	relu(conv_2_output, conv_2_output, size_lateral_1);

	// 2-3 Normalization
	lrn(conv_2_output, conv_2_output, size_lateral_1);

	// 2-4 Step pooling
	const unsigned int size_lateral_2 = size_lateral_1 / stride_2_size;
    max_pooling(conv_2_output, pooling_2_output, size_lateral_1, stride_2_size, size_lateral_2);
	
	// Dense layer 1
	matrix_multiplication(weights_1, pooling_2_output,dense_layer_1_output,neurons_dense_1_size, 1, size_lateral_2*size_lateral_2);
	
	// Activation layer dense 1
    relu_linear(dense_layer_1_output, dense_layer_1_output, neurons_dense_1_size);
	
	// Dense layer 2
	matrix_multiplication(weights_2, dense_layer_1_output, dense_layer_2_output, neurons_dense_2_size, 1, neurons_dense_1_size);
	
	// Activation layer dense 2
	relu_linear(dense_layer_2_output, dense_layer_2_output, neurons_dense_2_size);
	
	// Softmax - Output
	softmax(dense_layer_2_output, output_data, neurons_dense_2_size);

}


bool compare_vectors(const bench_t* host,const bench_t* device, const int size){
	#ifdef INT
	for (int i = 0; i < size; ++i){
		if (host[i] != device[i]){
			printf("Error in element %d is %d but was %d\n", i,device[i], host[i]);
			return false;
		}
	}
	return true;
	#else 
		for (int i = 0; i < size; ++i){
			if (fabs(host[i] - device[i]) > 1e-4){
				printf("Error in element %d is %f but was %f\n", i,device[i], host[i]);
				return false;
			}
		}
		return true;
	#endif
}

void print_double_hexadecimal_values(const char* filename, bench_t* float_vector, unsigned int size){
	FILE *output_file = fopen(filename, "w");
  	// file created
  	for (unsigned int i = 0; i < size; ++i){
  		binary_float.f = float_vector[i];
		fprintf(output_file, "%02x", binary_float.binary_values.a );
		fprintf(output_file, "%02x", binary_float.binary_values.b );
		fprintf(output_file, "%02x", binary_float.binary_values.c );
		fprintf(output_file, "%02x", binary_float.binary_values.d );
		fprintf(output_file, "%02x", binary_float.binary_values.e );
		fprintf(output_file, "%02x", binary_float.binary_values.f );
		fprintf(output_file, "%02x", binary_float.binary_values.g );
		fprintf(output_file, "%02x", binary_float.binary_values.h );
		fprintf(output_file, "\n"); 
  	}
  	fclose(output_file);	

}

void get_double_hexadecimal_values(const char* filename, bench_t* float_vector, unsigned int size){
	// open file
	FILE *file = fopen(filename, "r");
	// read line by line
	char * line = NULL;
    size_t len = 0;
    

	for (unsigned int i = 0; i < size; ++i){
		getline(&line, &len, file);
		// delete /n
		line[strlen(line)-1] = 0;
		// strip for each char
		char *temp = (char*) malloc(sizeof(char) * 2);
		char *ptr;
    	temp[0] = line[0];
		temp[1] = line[1];
    	binary_float.binary_values.a = (char)strtol(temp, &ptr, 16);
		temp[0] = line[2];
		temp[1] = line[3];
		binary_float.binary_values.b = (char)strtol(temp, &ptr, 16);
		temp[0] = line[4];
		temp[1] = line[5];
		binary_float.binary_values.c = (char)strtol(temp, &ptr, 16);
		temp[0] = line[6];
		temp[1] = line[7];
		binary_float.binary_values.d = (char)strtol(temp, &ptr, 16);
		temp[0] = line[8];
		temp[1] = line[9];
		binary_float.binary_values.e = (char)strtol(temp, &ptr, 16);
		temp[0] = line[10];
		temp[1] = line[11];
		binary_float.binary_values.f = (char)strtol(temp, &ptr, 16);
		temp[0] = line[12];
		temp[1] = line[13];
		binary_float.binary_values.g = (char)strtol(temp, &ptr, 16);
		temp[0] = line[14];
		temp[1] = line[15];
		binary_float.binary_values.h = (char)strtol(temp, &ptr, 16);

		float_vector[i] = binary_float.f;
	}
  	fclose(file);	

}
