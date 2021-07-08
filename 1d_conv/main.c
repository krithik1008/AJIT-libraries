#include <stdio.h>
//unsigned char u8dot(int N,unsigned char *X,int incX,unsigned char *Y,int incY);
unsigned char* conv(int sx, unsigned char *x, int sy, unsigned char *y, unsigned char *res);
/*{
	//unsigned char* res[100];
	int i=0,tx=0,ty=sy,no=0,temp=sy;
	for(;i<(sx+sy-1);i++)
	{
		if(i<sy)
		{
			ty=ty-1;
			if(no<sx)
				no=no+1;
			res[i]=y[2]*y[4];
			//res[i]=u8dot(no,&x[tx],1,&y[ty],1);
		}
		else
		{
			tx=tx+1;
			if(temp>sx)
				no=no-1;
			temp=temp+1;
			res[i]=x[2]*x[3];
			//res[i]=u8dot(no,&x[tx],1,&y[ty],1);
		}
	}
	return &res[0];
}*/
unsigned char* genx();
unsigned char* geny();
unsigned char* main()
{
	int nx=4,ny=2;
	//incx=1,incy=1;	
	//unsigned char x[8]={1,2,3,4};//,5,6,7};
	//x[7]=8;
	//unsigned char y[8]={2,2,2,2};
	unsigned char res[8];
	
	unsigned char* x = genx();
	unsigned char* y = geny();
	/*int i=0;
	for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}*/
	return conv(nx,&x[0],ny,&y[0],&res[0]);
}


