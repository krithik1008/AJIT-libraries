#include <stdio.h>
extern float* __attribute__ ((noinline)) FFT (register float *data, register int number_of_complex_samples, register int isign);
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
