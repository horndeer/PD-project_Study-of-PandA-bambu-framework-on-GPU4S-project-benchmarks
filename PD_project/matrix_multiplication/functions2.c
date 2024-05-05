// Matrix multiplication: C = A * B
// A [n*m] B [m*w] C [n w]
// C elements are expected to be initially equal to zero
void matrix_multiplication(const double* A, const double* B, double* C, const unsigned int n, const unsigned int m, const unsigned int w ){
	unsigned int i,j,k;
	for ( i = 0; i < n; ++i){
		for ( j = 0; j < w; ++j){
			for ( k = 0; k < m; ++k){
				C[i*n+j] = C[i*n+j] + A[i*n+k] * B[k*w+j];
			}
		}
	}
}


