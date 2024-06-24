#include "cpu_functions.h"

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

result_bench_t get_mean_value_matrix(const bench_t* A,const int size){
double suma_valores = 0;
double final_value = 0;
	
	// Be aware of precision errors.

	for (int i=0; i<size; i++){
		for (int j=0; j<size; j++){
			suma_valores += A[i*size+j];
		}
	}

final_value = result_bench_t(suma_valores) / result_bench_t(size*size);
return final_value;
}


void correlation_2D(const bench_t* A, const bench_t* B, result_bench_t* R ,const int size){
	result_bench_t mean_a_matrix =  get_mean_value_matrix(A, size);
	result_bench_t mean_b_matrix =  get_mean_value_matrix(B, size);

	// first get the final value  in A (A - mean(a)) and in B (B - mean(b))
	result_bench_t acumulate_value_a_b = 0;
	result_bench_t acumulate_value_a_a = 0;
	result_bench_t acumulate_value_b_b = 0;

	result_bench_t result_mean_a = 0;
	result_bench_t result_mean_b = 0;
	for (int i=0; i<size; i++){
		for (int j=0; j<size; j++){
			result_mean_a = A[i*size+j] - mean_a_matrix;
			result_mean_b = B[i*size+j] - mean_b_matrix;
			acumulate_value_a_b += result_mean_a * result_mean_b;
			acumulate_value_a_a += result_mean_a * result_mean_a;
			acumulate_value_b_b += result_mean_b * result_mean_b;
		}
	}
	// final calculation
	*R = (result_bench_t)(acumulate_value_a_b / (result_bench_t)(pow20(acumulate_value_a_a * acumulate_value_b_b, 0.5)));


}

bool compare_values(const result_bench_t* host,const result_bench_t* device){
	if (fabs(*host - *device) > 1e-4){
		printf("Error in element %d is %f but was %f\n", 0,*device, *host);
		return false;
	}
	return true;
	
}

bool compare_vectors(const bench_t* host,const bench_t* device, const int size){
	#ifdef INT
	for (int i = 0; i < size; ++i){
		if (host[i] != device[i]){
			if (host[i] - 1 != device[i] || host[i] +1 != device[i] ){
				printf("Error in element %d is %d but was %d\n", i,device[i], host[i]);
			}
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

void print_double_hexadecimal_values(const char* filename, result_bench_t* float_vector, unsigned int size){
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

long int get_timestamp(){
	struct timeval time_now{};
    gettimeofday(&time_now, nullptr);
    time_t msecs_time = (time_now.tv_sec * 1000) + (time_now.tv_usec / 1000);
	return (long int) msecs_time;
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
