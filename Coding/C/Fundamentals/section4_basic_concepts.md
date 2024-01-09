this is the c
```C 
/* 
Author: Robert DeNovellis
Purpose: This program prints out my name to the screen
Date: November 12, 2023
*/
```
1. the #include statement
   1. This is a preprocessor directive
   2. not PART of .exe, but the program wont run without *
   3. "#" means it is representing a directive
      1. = telling a computer to do somthing before it compiles
      2. many types fo preprocessor directive
      3. can be anywhere but usully put int he beginning
      4. similar tot he import statement in java
2. Header file - defines informaqtion about some of the functrions that are provided by thatr file
   1. "stdio.h" is the standard c library of fucntionalityh to include within the file
   2. includes functionality for dealing wiht input and output
   3. stdio.io = standard , input,output

```C 
//some header

//typedefs
typedef struc names)st names;

//function prototypes
void get_name(names *);
void show_names(const name *);
char * s_gets(char * st, int n);

/*header files includes many different thing
    #define directive
    structure directives
    typedef statements
    function prototypes */
```
1. printf() is a stdnard library function to the command line(std output stream)
   1. this ends with a semicolon!!
   2. use a debugging technique
   3. can show calculations

1. Input FUNCTIONS;
   1. scans according to the format provided
   2. %s, %d, %c, %f, etc. to read strings, integer, character floats.
2. like printf(), scanf() uses a control string followed by a list of arguments
   1. control string indicsates the destination data types for the input stream of characters
   2. 
```C 
#include <stdio.h>
scanf() 
// can read a variety of formats 
scanf(%d, &number )
print() //uses variable names, constrants, and epxressions as it s arguements list
scanf() //function pointers to variables(location of memory)
/*
1. returns number of items succesffuly read
2. if you use the scanf to read a value for one of the basic values types preced the variable name with an & = &name, &number
3. if you use scanf to read a stering into a character array you don't use the &
4. takes all input and converts it into text.
*/
scanf(%c, name)

```
