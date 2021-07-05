#include <stdio.h>
#include<math.h>
// implementing cooley tukey (decimation in time) algorithm of fft 
// Bit_Reverse function has n= data samples contrary to the orignal logic which worked on swapping two continous numbers together. Bit reverse uses
// double data type and swap two continous locations together with ldd. 

float * __attribute__ ((noinline)) Bit_Reverse ( register float * arr, register int n) // n= no. of samples because data here is being processed as double not float
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
    float wtemp,wr,wpr,wpi,wi,theta,tempr,tempi;
    n=number_of_complex_samples << 1;
    data=Bit_Reverse(data,number_of_complex_samples);

//Danielson-Lanzcos routine (decimation in time)
mmax=2; // represents the stages
//external loop
while (n > mmax) // represents the whole stage
{
    istep = mmax<<  1;
    theta=isign*(2*3.141592/mmax);
    wtemp=sin(0.5*theta);
    wpr = -2.0*wtemp*wtemp;
    wpi=sin(theta);
    wr=1.0;
    wi=0.0;
    //internal loops
    for (m=1;m<mmax;m+=2)       // these two go though the each group of butterfly
    {
        for (i= m;i<=n;i+=istep) {
            j=i+mmax;
	    asm("nop");
	    asm("nop");
            tempr=(wr*data[j-1])-(wi*data[j]);
            tempi=(wr*data[j])+(wi*data[j-1]);
            data[j-1]=data[i-1]-tempr;
            data[j]=data[i]-tempi;
            data[i-1] += tempr;
	    asm("nop");
	    asm("nop");
	    asm("nop");
            data[i] += tempi;
	
        }

        wr=((wtemp=wr)*wpr)-(wi*wpi)+wr;    // twiddle factor calculation
        wi=(wi*wpr)+(wtemp*wpi)+wi;
    }

    mmax=istep;
}

return data;

}



float * gen(void);
float* main()
{
	float *data;
	data=gen();
	return (FFT(data,16,1));
}
