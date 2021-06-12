#include <stdio.h>
#include "astring.h"
int matmul(int* g);
int main()
{	
	int arr[][2]={{10,9},{8,7}};
	return matmul(&arr[0][0]);
}

