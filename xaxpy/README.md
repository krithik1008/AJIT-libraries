# Xaxpy
Implements the equation *y=a\*x+y* on each element of the array<br><br>
Source code files: ```xaxpy.s```, ```main.c```\
Here x in x refers to the different data types:
+ *u8axpy - 8 bit unsigned int*
+ *u16axpy - 16 bit unsigned int*
+ *u32axpy - 32 bit unsigned int*
+ *saxpy - single precision foating point*
### Run
***Note**: Environment variables must be set before using the AJIT toolchain*\
Following commands must be followed in order to build and run the project
+ Values can either be entered in ```main.c``` and/or generated by creating ```datax.s``` and ```datay.s``` by running
```
data_genX.py
data_genY.py
```
+ To specify the registers and memory locations whose results are to be displayed, edit the ```main.results``` file
+ To compile and run the program
```
./compile_for_ajit1.sh
./run.sh
```
+ Error/warnings (if any) will be displayed in ```compile.err```
+ Results will be displayed in ```main.log```