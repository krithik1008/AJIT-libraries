#include <stdio.h>
#include <math.h>
int isamax(int N,float *X,int incX);
/*int isamax_1(int N,float *X,int incX)
{
	float max=0.0;
	int ix=0,result=0,i=0;
	if (incX <= 0)
    		return 0;

  	for (; i < N; i++){
    		if (fabs(X[ix]) > max){
      			max = fabs(X[ix]);
      			result = i;
    		}
    		ix += incX;
  	}

	return result+1;
}*/
float* genx();
int main()
{
	int n=100,incx=1;
	float* x=genx();	
	//float x[100];
	/*int i=0;
	for(;i<n;i++)
		x[i]=i;
	*/
	return isamax(n,&x[0],incx);
}
