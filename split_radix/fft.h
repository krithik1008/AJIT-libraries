#ifndef FFT_DOT_H    /* This is an "include guard" */
#define FFT_DOT_H 

extern float * __attribute__ ((noinline)) FFT (register float *data, register int number_of_complex_samples, register int isign);
extern float * __attribute__ ((noinline)) Bit_Reverse ( register float * arr, register int n);
#endif /* FOO_DOT_H */
