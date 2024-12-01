### loops, conditionals and functions
library(countdown)
rm(list = ls())

# loops

# for loop

# some useful indexing functions
colnames() # for looping over columns of a dataframe
unique() # for looping over unique values in a dataframe column






### challenge 1:
# The Fibonacci sequence is an interesting mathematical series where each number is the sum of the two preceeding numbers, for example, 0, 1, 1, 2, 3, 5, 8...

# 1. write some code using a for loop that prints the first 20 digits of the Fibonacci sequence in the console.
# hint: you may want to initialise the first 2 steps (0, 1) as values outside of the loop

# 2. modify the loop to store these values in a list instead

# 3. create a for loop to print the column name and number of unique values in each column of the iris dataframe


# while loop

# nesting loops

### challenge 2:

# 2.1. modify the loop from challenge 1.1 to print all fibonacchi numbers less than 50

# 2.2. construct loops to print the times tables from 1*1 to 12*12

# 2.3. (advanced) alter your code from 2.2 to instead construct a 12 x 12 dataframe containing the times table values


# conditionals

### challenge 3:

# 3.1. modify the loop created in challenge 2.1 to only print the even Fibonacci numbers

# 3.2 in addition to even Fibonacci numbers, now print odd multiples of 3 too


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
