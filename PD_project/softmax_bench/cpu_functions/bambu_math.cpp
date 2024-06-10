#include "bambu_math.h"
#include "cpu_functions.h"


void softmax(const bench_t *A, bench_t *B, const unsigned int size)
{
	bench_t sum_values = 0;
	bench_t value = 0;
    
	for (unsigned int i = 0; i < size; ++i)
	{
		for (unsigned int j = 0; j < size; ++j)
		{

			value = custom_exp(A[i * size + j],20);
			sum_values += value;
			B[i * size + j] = value;
		}
	}
	for (unsigned int i = 0; i < size; ++i)
	{
		for (unsigned int j = 0; j < size; ++j)
		{
			B[i * size + j] = (B[i * size + j] / sum_values);
		}
	}
}

double custom_exp(double x, int terms)
{
    double result = 1.0; // First term of the series is 1
    double term = 1.0;   // Term to add to the result

    for (int i = 1; i < terms; ++i)
    {
        term *= x / i;  // Compute the next term in the series
        result += term; // Add the term to the result
    }

    return result;
}


