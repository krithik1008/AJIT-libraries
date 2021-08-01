#include <stdio.h>
#include<math.h>
//#include<fft.h>
// implementing cooley tukey (decimation in time) algorithm of fft 
// Bit_Reverse function has n= data samples contrary to the orignal logic which worked on swapping two continous numbers together. Bit reverse uses
// double data type and swap two continous locations together with ldd. 
// when we do ldd for floating register , no interchange of data happens 

// twiddle factor optimization will tend to become significatnt as we move towards lower order FFTs as no. of instruction req to calculate the factors become significant with 
// instructions req to calculate the actual fft routine  
// register float * twid wont be stored in float register but will be stored in normal register.
// operand out of range = bare registers used in extended assembly should be %%

// loaing the twiddle factor from array to variables
#define twidload(twid,h,wi,wr,wru,wir){\
	asm volatile (  "ldd [ %[ro] + %[r1] ] , %[r2]  \n\t" \
			"fmovs %[r3], %[r4]  \n\t" \
			"fnegs %[r2], %[r5]  \n\t" \
			:[r2] "+f"(wi), [r3] "+f"(wr), [r4] "+f"(wru), [r5] "+f"(wir) \
			:[ro] "r"(twid), [r1] "r"(h) \
			:"cc");\
	}


// vectorizing the main loop 
#define loopvec( data, j , i , wru , wir , wi , wr , tempr , tempi , x , z , d1 , d3 ){\
	asm volatile (  "sll %[j] , 2 , %[x]  \n\t" \
			"add %[x] , %[data] , %[x]  \n\t" \
			"sll %[i] , 2 , %[z]  \n\t" \
			"add %[z] , %[data] , %[z]  \n\t" \
			"ldd [%[x] + -4 ], %[d1] \n\t " \
			"ldd [%[z] + -4 ], %[d3] \n\t " \
			"vfmul32 %[d1], %[wru] , %%f24 \n\t " \
			"fadds %%f24, %%f25 , %[tempr] \n\t " \
			"vfmul32 %[d1], %[wi] , %%f24 \n\t " \
			"fadds %%f24, %%f25 , %[tempi] \n\t " \
			"vfsub32 %[d3], %[tempr], %[d1] \n\t " \
			"std %[d1] , [ %[x] + -4 ] \n\t "\
			"vfadd32 %[d3], %[tempr], %[d3] \n\t "\
			"std %[d3] , [ %[z] + -4 ] \n\t "\
			:[tempr] "+f"(tempr), [tempi] "+f"(tempi), [x] "+r"(x), [z] "+r"(z),  [d1] "+f"(d1),  [d3] "+f"(d3) \
			:[data] "r"(data), [j] "r"(j) ,  [i] "r"(i), [wru] "f"(wru), [wir] "f"(wir), [wi] "f"(wi), [wr] "f"(wr)  \
			:"%f24","%f25","%f11","%f9","cc");\
	}



float* FFT (register float *data, register int number_of_complex_samples, register float * twid) //Danielson-Lanzcos routine (decimation in time)
{

    register int n,mmax,m,j,istep,i;
    register int x,z;

    register float wi asm("%f20");  // these statements wont force the compilers to use these variables 
    register float wr asm("%f21");  // in normal calculations
    register float wru asm("%f22");
    register float wir asm("%f23");
    register float tempr asm("%f12");
    register float tempi asm ("%f13");
    register float d1 asm ("%f10"); // data[j-1] f11 data[j]
    register float d3 asm ("%f8");  // data [i-1] f9 data[i]

	
    n=number_of_complex_samples << 1;
    int h=0;	// index to traverse through the twiddle array
    mmax=2; 
    wr=1.0;
    wi=0.0;
    wir=-wi;
    wru =wr;

while (n > mmax) 
{
    istep = mmax<<  1;
    for (m=1;m<mmax;m+=2)
    {
        for (i= m;i<=n;i+=istep) {
            j=i+mmax;  

	    loopvec( data, j , i , wru , wir , wi , wr , tempr , tempi , x , z , d1 , d3 );

	    /* // loop vec implements these equations
	    // ldd [ j-1], %f10
	    // ldd [ i-1], %f8
	    // vfmul32 %f10, %f22 , %f24
	    // fadds %f24, %f25, %f12
	    // vfmul32 %f10, %f20 , %f24
	    // fadds %f24, %f25, %f13 

            tempr=(wru*data[j-1])+(wir*data[j]);// vector add the two 
            tempi=(wi*data[j-1])+(wr*data[j]);

	    // vfsub32 %f8, %f12, %f10
	    // std %f10 , [%i0 j-1]

            data[j-1]=data[i-1]-tempr; // vector sub 
            data[j]=data[i]-tempi;

	    // vfadd32 %f8, %f12, %f8
	    // std %f8 , [%i0 i-1]

            data[i-1] += tempr; //vector addition 
            data[i] += tempi;
	    */
	
        }

	h=h+8; // will be directly used in load instruction , no need for sll instruction 
	twidload(twid,h,wi,wr,wru,wir);

	/* twidload implements these instructions
	wi=twid[h];	// f20 //ldd [%i0 + h] , %wi
        wr=twid[h+1];   // f21
	wru=wr;   // fmovs f22
	wir=-wi;  // fmovs f23
	*/
 
	
    }

    mmax=istep;
}

return data;

}

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
    	data=Bit_Reverse(data,samples);	// bit reverse the data
	calc_twiddle(samples,twid,sign);// calculates the twiddle factor twiddle factor length should be 2*n
	data=FFT(data,samples,twid);	// core fft routine 
	return data;
}
