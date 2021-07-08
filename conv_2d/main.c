#include <stdio.h>
//unsigned char u8dot(int nx, int ny, unsigned char *X,unsigned char *Y, unsigned char *res);
unsigned char* conv(int nx, int ny, unsigned char *x, unsigned char *y, unsigned char *res)
{
	int i=0,j=0,h,w;
	for (i=0 ; i<nx-4 ; i++)
            for (j=0 ; j<ny-4 ; j++)
                for (h=i ; h<i+5 ; h++)
                    for (w=j ; w<j+5 ; w++)
                        image[i][j] += y[h-i][w-j]*x[h][w];

	return &res[0][0];
}
unsigned char* genx();
unsigned char* main()
{
	int nx=8,ny=2;	
	unsigned char y[5][5]={ {1,0,0,0,1},
				{1,0,0,0,1},
				{1,0,0,0,1},
				{1,0,0,0,1},
				{1,0,0,0,1}
				};
	
	unsigned char res[395][395];
	
	return conv(nx,ny,genx(),&y[0][0],&res[0][0]);
}


