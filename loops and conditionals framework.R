### loops, conditionals and functions
library(countdown)
rm(list = ls())

# loops

# for loop

# some useful indexing functions for dealing with dataframes
colnames() # for looping over columns of a dataframe
unique() # for looping over unique values in a dataframe column






### challenge 1:
# 1.1 Bart Simpson is in trouble and writing lines on the board. Construct a loop that will print the statement 
# "I will not copy and paste lines of code that could be a loop or function instead." 100 times to the console. 

# 1.2 Modify the Fibonacci sequence loop example to store these values in a vector instead of printing them to the console.

# 1.3 create a for loop to print the column name and number of unique values in each column of the iris dataframe


# while loop

# nesting loops

### challenge 2:

# 2.1. modify the Fibonacci example loop to print all fibonacchi numbers less than 50

# 2.2. construct loops to print the times tables from 1*1 to 12*12

# 2.3. (advanced) alter your code from 2.2 to instead construct a 12 x 12 dataframe containing the times table values


# conditionals

### challenge 3:

# 3.1. modify the Fibonacci example loop to only print the even Fibonacci numbers less than 50

# 3.2 in addition to even Fibonacci numbers, now also print odd multiples of 3 too


# functions


### challenge 4:

# 4.1  create a function to convert centimetres into inches

# 4.2  create another function to convert them back

# 4.3  create a function that takes two numbers as inputs and multiplies them together

# function defaults

# composing functions


### challenge 5:

# 5.1 modify your function from 4.3 to take either 2 or 3 numbers and multiply them together

# 5.2 create a new function that can convert centimetres to inches or inches to centimetres using the functions you already made in 4.1 and 4.2.

# 5.3 make a more general converter that will convert either length or temperature, depending on what mode you give it
