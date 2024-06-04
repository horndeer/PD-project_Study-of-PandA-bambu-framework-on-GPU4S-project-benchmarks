#include "bambu_math.h"

double custom_exp(double x, int terms = 20)
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
