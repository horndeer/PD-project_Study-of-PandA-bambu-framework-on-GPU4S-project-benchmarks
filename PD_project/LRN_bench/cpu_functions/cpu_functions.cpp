#include "cpu_functions.h"

typedef int bench_t;

void matrix_multiplication(const bench_t* A, const bench_t* B, bench_t* C,const unsigned int n, const unsigned int m, const unsigned int w ){
	for (unsigned int i = 0; i < n; ++i)
	{
		for (unsigned int j = 0; j < w; ++j)
		{
			for (unsigned int k = 0; k < m; ++k)
			{   
				C[i*n+j] = C[i*n+j] + A[i*n+k] * B[k*w+j];
			}
		}
	}

}

// void relu(const bench_t* A, bench_t* B, const unsigned int size)
// {
// 	for (unsigned int i = 0; i < size; ++i)
// 	{
// 		for (unsigned int j = 0; j < size; ++j)
// 		{
// 			if (A[i*size+j] > 0)
// 			{
// 				B[i*size+j] = A[i*size+j];
// 			}
// 			else
// 			{
// 				B[i*size+j];
// 			}
// 		}
// 	}
// }

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


void lrn(const bench_t* A, bench_t* B, const unsigned int size)
{
	#ifdef FLOAT
	const float K = 2;
	const float ALPHA = 10e-4;
	const float BETA = 0.75;
	#else 
	const double K = 2;
	const double ALPHA = 10e-4;
	const double BETA = 0.75;
	#endif

	for (unsigned int i = 0; i < size; ++i)
	{
		for (unsigned int j = 0; j < size; ++j)
		{
			B[i*size+j] = A[i*size+j]/pow20((K+ALPHA*pow20(A[i*size+j],2)),BETA);
		}
	}

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

long int get_timestamp(){
	struct timeval time_now{};
    gettimeofday(&time_now, nullptr);
    time_t msecs_time = (time_now.tv_sec * 1000) + (time_now.tv_usec / 1000);
	return (long int) msecs_time;
}

bool compare_vectors(const bench_t* host,const bench_t* device, const int size, const double precision){
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
			if (fabs(host[i] - device[i]) > precision){
				printf("Error in element %d is %f but was %f\n", i,device[i], host[i]);
				return false;
			}
		}
		return true;
	#endif
}


void writeDouble(double *_d, FILE* _f){
	double locD;
	int res;

#ifdef BIGENDIAN
	unsigned char *r, *w;
	int i;
	r = (unsigned char*)_d;
	w = (unsigned char*)&locD;
	for(i=0; i<8; i++){
		w[i] = r[7-i];
	}
#else
	locD = *_d;
#endif
	res =fwrite((void*)&locD, sizeof(double), 1, _f);
	if(res != 1){
		printf("writeDouble error (%d)\n", res);
		exit(1);
	}
}

void readDouble(double *_d, FILE* _f){
	double locD;
	int res;
	res = fread(&locD, sizeof(double), 1, _f);
	if(res != 1){
		printf("readDouble error\n");
		exit(1);
	}
#ifdef BIGENDIAN
	unsigned char *r, *w;
	int i;
	r = (unsigned char*)&locD;
	w = (unsigned char*)_d;
	for(i=0; i<8; i++){
		w[i] = r[7-i];
	}
#else
	*_d = locD;
#endif
}


void get_values_file (char *input_file, double *in_A, double *in_B){
	FILE *f;
	double D;
	int N, i;
	f=fopen(input_file, "r+b");
	if(f == NULL)
	{
		printf("Error opening file: %s\n", input_file);
	}
	readDouble(&D, f);
	N = (int)D;
	printf("N = %d\n", N);
	in_A    = (double*)malloc(N*N*sizeof(double));
	in_B    = (double*)malloc(N*N*sizeof(double));
	for(i=0; i<N*N; i++){
		readDouble(&D, f);
		in_A[i] = D;
	}
	for(i=0; i<N*N; i++){
		readDouble(&D, f);
		in_B[i] = D;
	}
	fclose(f);
}

void set_values_file(char *input_file, double *out_C, unsigned int N){
	FILE *f;
	f=fopen(input_file, "w");
	double D;
	int i;
	if(f == NULL)
	{
		printf("Error opening file: %s\n", input_file);
	}
	for(i=0; i<N*N; i++){
		writeDouble(&D, f);
		out_C[i] = D;
	}
	fclose(f);
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
