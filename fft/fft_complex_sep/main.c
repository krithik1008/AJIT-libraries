#include <stdio.h>
#include<math.h>
//#include<fft.h>
// implementing cooley tukey (decimation in time) algorithm of fft 
// Bit_Reverse function has n= data samples contrary to the orignal logic which worked on swapping two continous numbers together. Bit reverse uses
// double data type and swap two continous locations together with ldd. 
// when we do ldd for floating register , no interchange of data happens 

// twiddle factor optimization will tend to become significatnt as we move towards lower order FFTs as no. of instruction req to calculate the factors become significant with 
// instructions req to calculate the actual fft routine  


extern float * Bit_Reverse ( register float * arr, register int n) // n= no. of samples because data here is being processed as double not float
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


float* FFT (register float *data, register int number_of_complex_samples, float * twid) //Danielson-Lanzcos routine (decimation in time)
{

    register int n,mmax,m,j,istep,i;
    float wr,wi,tempr,tempi,wir;
    n=number_of_complex_samples << 1;
    int h=0;	// index to traverse through the twiddle array
    
    mmax=2; 
    //external loop

    wr=1.0;
    wi=0.0;
    wir=-wi;

while (n > mmax) 
{
    istep = mmax<<  1;
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

	h=h+2;
        wr=twid[h+1];
        wi=twid[h];   
	wir=-wi;
    }

    mmax=istep;
}

return data;

}




void calc_twiddle ( int number_of_complex_samples,float *twiddle,float isign)
{

    // both the coefficients are stored in one array (twiddle)
    // at even location wr is stored and at odd location wi is stored
    // this helps to implement ldd in the main fft routine.

    int h=0; 
    int n,mmax,m,j,istep,i;
    float wtemp,wpr,wpi,theta,tempr,tempi;
    n=number_of_complex_samples << 1;


mmax=2; 

while (n > mmax) 
{
    istep = mmax<<  1;
    theta=isign*(2*3.141592/mmax);
    wtemp=sin(0.5*theta);
    wpr = -2.0*wtemp*wtemp;
    wpi=sin(theta);
    twiddle[h+1]=1.0;	// wr
    twiddle[h]=0.0;	//wi

    for (m=1;m<mmax;m+=2)      
    {
        h=h+2;
        wtemp=twiddle[h-1];
        twiddle[h+1]=((wtemp)*wpr)-(twiddle[h-2]*wpi)+twiddle[h-1];  // wr  
        twiddle[h]=(twiddle[h-2]*wpr)+(wtemp*wpi)+twiddle[h-2];	// wi

	//h++;
	//wtemp=wr[h-1];
        //wr[h]=((wtemp)*wpr)-(wi[h-1]*wpi)+wr[h-1];    
        //wi[h+1]=(wi[h-1]*wpr)+(wtemp*wpi)+wi[h-1];

    }
    mmax=istep;
}


}



float * gen(void);
float * datax(void);

float* main()
{
	float *data;
	float *twid;
	
	int samples=1024;
	float sign=-1;

	data=gen();
	twid=datax();
	// call to bit reverse
    	data=Bit_Reverse(data,samples);
	calc_twiddle(samples,twid,sign);
	data=FFT(data,samples,twid);
	return data;
}
