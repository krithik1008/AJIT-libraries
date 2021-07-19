# Implementation of AI/ML and DSP libraries using AJIT vector instructions
The AJIT processor (designed in IIT Bombay) has vector instructions for
integer (8/16/32/64) bit and 
oating point arithmetic (half/single/double
precision). Vector or SIMD instructions are part of computers architecture
with multiple processing elements that perform the same operation on multi-
ple data points simultaneously. The project involves design of libraries that
exploit these vector instructions.

## Setup
To setup the AJIT toolchain, refer to the official repo of AJIT : [Github repo](https://github.com/adhuliya/ajit-toolchain/tree/marshal)


*These functions were developed using an older commit of the repo : [older commit link](https://github.com/adhuliya/ajit-toolchain/tree/03a6b5357ecd84d301b3481202fb205baebfbb2a)*

## Implementation

### BLAS Level-1

The BLAS (Basic Linear Algebra Subprograms) are routines that provide
standard building blocks for performing optimized linear algebra vector and
matrix operations. Level-1 BLAS perform scalar, vector and vector-vector
operations. The following level-1 BLAS functions were implemented using
vector instructions and optimized for the AJIT processor:
+ Xasum : sum of absolute values of the elements of an array
+ Xscal : scales the elements of the array by constant alpha *x = \*x*
+ Xaxpy : implements the equation *y=\*x+y* on each element of the array
+ Xdot : computes the dot product between two arrays: *ans = sum(xi \* yi)*
+ Isamax : finds the largest element of the array

*Note: Each of the mentioned functions have separate implementations for various data types. The functions are mentioned as X{function_name}. Here X represents different data types (for example: u8asum, u16asum,u32asum, sasum are implemented variants of Xasum)*
+ *u8 - 8 bit unsigned int*
+ *u16 - 16 bit unsigned int*
+ *u32 - 32 bit unsigned int*
+ *s - single precision foating point*

### DSP Routines
Using the optimizations from the BLAS implementations, applications such as DSP and convolution were implemented and optimized for AJIT. These applications were tested on audio and image samples respectively.
+ Fast Fourier Transform (FFT) : Implemented Cooley Turkey FFT algorithm (Decimation in Time) with the help of vector instructions
+ Convolution : Implemented 1-D and 2-D convolution (3x3 kernel) using vector instructions











