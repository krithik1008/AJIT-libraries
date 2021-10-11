#include <stdio.h>
unsigned char* u8dot(int nx, int ny, unsigned char *X,unsigned char *Y, unsigned char *res);
//im2col approach - rearranging the matrix to optimize accessing of elements
unsigned char* rearrange(int nx, int ny, unsigned char *x,unsigned char *y, unsigned char *res)
{
	
	int i,j,h,w,pos=0,ker=4;
	int rows=(nx-ker+1)*(ny-ker+1);
	int compi=nx-ker+1,compj=ny-ker+1;
	unsigned char col[32400];
	//int k=0;
	for (i=0; i<compi ; i++)
            for (j=0; j<compj ; j++)
            {
		for (h=i ; h<i+ker ; h++)
                    for (w=j ; w<j+ker ; w++)
                    {
			col[pos]=x[ny*h+w];
			pos++;
		    }
		/*for(k=0;k<7;k++)
		{
			col[pos]=0;
			pos++;
		}*/
	    	
	    }
	return u8dot(16,rows,&col[0],&y[0],&res[0]);

}
//naive implementation for testing
/*unsigned char* conv(int nx, int ny, unsigned char *x, unsigned char *y, unsigned char *res)
{
	int k=4,compi=nx-k+1,compj=ny-k+1;
	int temp,temp1,w,h;
	int i,j,pos=0;
	for (i=0; i<compi ; i++)
        {
	    temp=ny*i;
	    for (j=0; j<compj ; j++)
            {	
		temp1=temp+j;
		for (h=0 ; h<k ; h++)
                    for (w=0 ; w<k ; w++)
                        res[pos] = res[pos] + (y[k*h+w])*x[ny*h+temp1+w];		//y[k*(h-i)+(w-j)]
		pos++;
	    }
	}
	return &res[0];
}*/
unsigned char* genx();
unsigned char* geny();
unsigned char* main()
{
	int nx=48,ny=48;	
		
	/*
	unsigned char y[16];
	y[0]=1;y[1]=1;y[2]=1;y[3]=1;
	y[4]=1;y[5]=1;y[6]=1;y[7]=1;
	y[8]=1;y[9]=1;y[10]=1;y[11]=1;
	y[12]=1;y[13]=1;y[14]=1;y[15]=1;
	*/

	
	unsigned char res[2304];	//result will be stores here
	/*
	unsigned char x[64];	//input array
	int i=0;
	for(;i<64;i++)
		x[i]=i;		//assigning value to input array
	*/
	unsigned char *x=genx();		//assigning input from datax.s file
	unsigned char *y=geny();		//assigning kernal values from datay.s file
	
	return rearrange(nx,ny,&x[0],&y[0],&res[0]);
}


