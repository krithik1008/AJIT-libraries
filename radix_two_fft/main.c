#include <stdio.h>
#include<math.h>
#include<fft.h>
// implementing cooley tukey (decimation in time) algorithm of fft 
// Bit_Reverse function has n= data samples contrary to the orignal logic which worked on swapping two continous numbers together. Bit reverse uses
// double data type and swap two continous locations together with ldd. 

/*
extern float * __attribute__ ((noinline)) Bit_Reverse ( register float * arr, register int n) // n= no. of samples because data here is being processed as double not float
{
	register double temps;
	register double *data=(double *) arr;
	register int j,i,m;
	register int k=n>>1;
	register int f=k>>1;
	register int g,u;
    j=0;    
    for (i=0;i<k;i++)
    {
        if (j > i)
        {
            temps= data[j];	// these statements swap real and
            data[j]=data[i];    // complex no. together as both of them are
            data[i]=temps;	// present in continous locations

            // checks if the changes occurs in the first half
            // and use the mirrored effect on the second half
            if((j/2)<f)
            {
                g=n-(i+1);
                u=n-(j+1);
                temps=data[g];
                data[g]=data[u];
                data[u]=temps;

            }

        }
        m=n>>1;

        while (m >= 2 && j >= m)
        {
            j -= m;
            m = m>>1;
        }

        j += m;
    }
return ((float*)data);

}


float* __attribute__ ((noinline)) FFT (register float *data, register int number_of_complex_samples, register int isign)
{

    register int n,mmax,m,j,istep,i;
    float wtemp,wr,wpr,wpi,wi,theta,tempr,tempi,wir;

    n=number_of_complex_samples << 1;
// call to bit reverse
    data=Bit_Reverse(data,number_of_complex_samples);
// loading constants
    float piconst=6.283185;
    float halfconst=0.5;


//Danielson-Lanzcos routine (decimation in time)
mmax=2; // represents the stages
//external loop
while (n > mmax) // represents the whole stage
{
    istep = mmax<<  1;
    theta=isign*(piconst/mmax); // or the sign bit of theta with isign
    wpi=sin(theta);

    wtemp=sin(halfconst*theta);
    wpr = -2.0*wtemp*wtemp;
    wr=1.0;
    wi=0.0;

    //internal loops
    for (m=1;m<mmax;m+=2)       // these two go though the each group of butterfly
    {
        for (i= m;i<=n;i+=istep) {
            j=i+mmax;  // j=i2
	   
            tempr=(wr*data[j-1])+(wir*data[j]);// vector add the two 
            tempi=(wi*data[j-1])+(wr*data[j]);

            data[j-1]=data[i-1]-tempr; // vector sub 
            data[j]=data[i]-tempi;

            data[i-1] += tempr; //vector addition 
            data[i] += tempi;
	
        }
	wtemp=wr;
        wr=(wtemp*wpr) +  (wir*wpi)+wr;    // twiddle factor calculation
        wi=   (wi*wpr)+(wtemp*wpi)+wi;
	wir=-wi;
    }

    mmax=istep;
}

return data;

}


*/


float * gen(void);
float* main()
{
	float *data;
	int samples=1024;
	int sign=-1;

	data=gen();
	return (FFT(data,samples,sign));
}
