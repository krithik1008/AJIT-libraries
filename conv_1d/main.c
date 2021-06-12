#include <stdio.h>
float *conv_1d(float *x,float *h, int n, int m);	//x=>input signal , h=> impulse response, n => length of x, m => length of h
float *main()
{
	float x[] = {1,2,3,4,5};
	float h[] = {2.1};
	int n = 5;
	int m = 1;
	return conv_1d(x,h,n,m);
	//return 0;
}	
