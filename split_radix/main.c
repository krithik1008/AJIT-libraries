#include <stdio.h>
#include <math.h>

// spit radix decimation in time even elements with radix 2 FFT and odd elements with radix 4
void fft_compute_split_twiddle(float twiddle[][2], int size)
{
    /* pre-compute split-radix twiddle factors in 2d array of length [4][size>>3] */
    int j;
    int n8 = size >> 3;
    float e = 6.283185 / size;
    float a = e;
    float a3;

    for (j = 2; j <= n8; j++)
    {
        a3 = 3 * a;
        twiddle[0][j - 1] = cos(a);
        twiddle[1][j - 1] = sin(a);
        twiddle[2][j - 1] = cos(a3);
        twiddle[3][j - 1] = sin(a3);
        a = j * e;
    }



}

void realfft_split(float *data, int n, float twiddle[][2])
{

    int i, j, k, i5, i6, i7, i8, i0, id, i1, i2, i3, i4, n2, n4, n8;
    int pas, pos;
    float t1, t2, t3, t4, t5, t6, ss1, ss3, cc1, cc3, sqrt2;

    sqrt2 = 1.414213; /* sqrt(2.0) */
    n4 = n - 1;

    /* data shuffling */
    for (i = 0, j = 0, n2 = n / 2; i < n4 ; i++)
    {
        if (i < j)
        {
            t1 = data[j];
            data[j] = data[i];
            data[i] = t1;
        }

        k = n2;

        while (k <= j)
        {
            j -= k;
            k >>= 1;
        }

        j += k;
    }

    /* length two butterflies */
    i0 = 0;
    id = 4;

    do
    {
        for (; i0 < n4; i0 += id)
        {
            i1 = i0 + 1;
            t1 = data[i0];
            data[i0] = t1 + data[i1];
            data[i1] = t1 - data[i1];
        }

        id <<= 1;
        i0 = id - 2;
        id <<= 1;
    }

    while ( i0 < n4 );

    /* L shaped butterflies */
    n2 = 2;

    for (k = n; k > 2; k >>= 1)
    {
        n2 <<= 1; /* power of two from 4 to n */
        n4 = n2 >> 2;
        n8 = n2 >> 3;
        pas = n / n2;
        i1 = 0;
        id = n2 << 1;

        do
        {
            for (; i1 < n; i1 += id)
            {
                i2 = i1 + n4;
                i3 = i2 + n4;
                i4 = i3 + n4;
                t1 = data[i4] + data[i3];
                data[i4] -= data[i3];
                data[i3] = data[i1] - t1;
                data[i1] += t1;

                if (n4 != 1)
                {
                    i0 = i1 + n8;
                    i2 += n8;
                    i3 += n8;
                    i4 += n8;
                    t1 = (data[i3] + data[i4]) / sqrt2;
                    t2 = (data[i3] - data[i4]) / sqrt2;
                    data[i4] = data[i2] - t1;
                    data[i3] = -data[i2] - t1;
                    data[i2] = data[i0] - t2;
                    data[i0] += t2;
                }
            }

            id <<= 1;
            i1 = id - n2;
            id <<= 1;
        }
        while ( i1 < n );

        for (j = 2; j <= n8; j++)
        {
            pos = (j - 1) * pas;
            cc1 = twiddle[0][pos];
            ss1 = twiddle[1][pos];
            cc3 = twiddle[2][pos];
            ss3 = twiddle[3][pos];
            i = 0;
            id = n2 << 1;

            do
            {
                for (; i < n; i += id)
                {
                    i1 = i + j - 1;
                    i2 = i1 + n4;
                    i3 = i2 + n4;
                    i4 = i3 + n4;
                    i5 = i + n4 - j + 1;
                    i6 = i5 + n4;
                    i7 = i6 + n4;
                    i8 = i7 + n4;
                    t1 = data[i3] * cc1 + data[i7] * ss1;
                    t2 = data[i7] * cc1 - data[i3] * ss1;
                    t3 = data[i4] * cc3 + data[i8] * ss3;
                    t4 = data[i8] * cc3 - data[i4] * ss3;
                    t5 = t1 + t3;
                    t6 = t2 + t4;
                    t3 = t1 - t3;
                    t4 = t2 - t4;
                    t2 = data[i6] + t6;
                    data[i3] = t6 - data[i6];
                    data[i8] = t2;
                    t2 = data[i2] - t3;
                    data[i7] = -data[i2] - t3;
                    data[i4] = t2;
                    t1 = data[i1] + t5;
                    data[i6] = data[i1] - t5;
                    data[i1] = t1;
                    t1 = data[i5] + t4;
                    data[i5] -= t4;
                    data[i2] = t1;
                }

                id <<= 1;
                i = id - n2;
                id <<= 1;
            }
            while(i < n);
        }
    }

}


float * main()
{
    int n=16;
    float twiddle[4][2];
    fft_compute_split_twiddle(twiddle, 16);
    float data[16]={0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0};
    realfft_split(data,16, twiddle);


   // data processing

    float xx[18];// xx =2*N it requires N+2 elements to fully descrbe the usefull fft. 
    int i=0;
    int k=0;

    xx[0]=data[0];
    xx[1]=0;

    for(i=2,k=1;i<=n;i+=2,k++)
    {
        xx[i]=data[k];
        xx[i+1]=data[n-k];
    }
    


    return xx;
}

