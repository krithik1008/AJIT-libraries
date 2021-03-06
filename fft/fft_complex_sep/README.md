# Fast Fourier Transform (FFT)
Implemented Cooley Turkey FFT algorithm (Decimation in Time) with twiddle factor calculated sepreately.10% decrease in the no. of instructions <br><br>
Source code files: ```fft.s```, ```main.c```

### Run
***Note**: Environment variables must be set before using the AJIT toolchain. If you want to use math functions like sin and cosine then a totally different type of project must be created where the build file contains the compileToSparcUclibc.py file. Best way to do it is to copy the example of the cosine function and modify it according to our needs*<br><br>
Following commands must be followed in order to build and run the project:
+ Values can either be entered in ```main.c``` and/or generated by creating ```data.s``` by running
```
python3 data.py
```
+ To specify the registers and memory locations whose results are to be displayed, edit the ```main.results``` file\
To generate the main.results file
```
python3 results.py
```
+ To compile and run the program
```
./build.sh 
./run_cmode.sh 
```
+ Error/warnings (if any) will be displayed in ```compile.err```
+ Results will be displayed in ```main.log```\
To read the data from main.log file and display it in human readable format (optional) 
```
python3 read.py
```
*Note: please refer to data.py, results.py and read.py files in order to find their actual use*
