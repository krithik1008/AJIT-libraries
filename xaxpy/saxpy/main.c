#include <stdio.h>
float *saxpy(int N,float alpha,float *X, int incX,float *Y,int incY);
//float *saxpy_1(int N,float alpha,float *X, int incX,float *Y,int incY)
//normal c code for benchmarking against efficient vector implementation
/*{
	if (incX == 1 && incY == 1)
	{
    		const int m = N % 4;
		int i=0;
    		for (; i < m; i++){
      		Y[i] += alpha * X[i];
    		}

    		for (i = m; i + 3 < N; i += 4) {
      			Y[i] += alpha * X[i];
      			Y[i + 1] += alpha * X[i + 1];
      			Y[i + 2] += alpha * X[i + 2];
      			Y[i + 3] += alpha * X[i + 3];
    		}
  	}
	return Y;
}*/
float* genx();
float* geny();
float* main()
{
	int n=100,incx=1,incy=1;	
	
	float* x=genx();
	float* y=geny();
	/*int i=0;
	for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}
	float x[6]={1,2,3,4,5,6};
	float y[6]={1,2,3,4,5,6};*/
	float alpha=2.9;
	return saxpy(n,alpha,&x[0],incx,&y[0],incy);
}
