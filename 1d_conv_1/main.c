#include <stdio.h>
unsigned char u8dot(int nx,unsigned char *X,int ny,unsigned char *Y,int load,int shift);
unsigned char* conv(int sx, unsigned char *x, int sy, unsigned char *y, unsigned char *res)
{
	//unsigned char* res[100];
	int load=0, shift=0;
	int i=0;
	for(;i<(sx-sy+1);i++)
	{
		
		load=i>>3;
		load=load<<3;
		shift=i-load;
		res[i]=u8dot(sx,&x[0],sy,&y[0],load,shift);
	}
	return &res[i];
}
unsigned char* genx();
unsigned char* geny();
unsigned char* main()
{
	int nx=8,ny=2;
	//incx=1,incy=1;	
	unsigned char x[16]={2,2,3,3,4,4,7};
	x[7]=8;
	x[8]=3;
	x[9]=2;
	x[10]=8;
	x[11]=3;
	x[12]=2;
	x[13]=8;
	x[14]=3;
	x[15]=2;
	unsigned char y[16]={1,2,2,3,4,4,7};
	y[7]=8;
	y[8]=3;
	y[9]=2;
	y[10]=8;
	y[11]=3;
	y[12]=2;
	y[13]=8;
	y[14]=3;
	y[15]=2;
	unsigned char res[16];
	
	//unsigned char* x = genx();
	//unsigned char* y = geny();
	/*int i=0;
	for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}*/
	return conv(nx,&x[0],ny,&y[0],&res[0]);
}


