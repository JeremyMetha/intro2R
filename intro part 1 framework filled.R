# setting up

getwd()
setwd("/Users/jeremy/intro to r")
# command + enter
# ctrl + enter



# using r as a calculator

1+2
2-21
3*3
2^6

# comparisons

2 == 2 # equality

2 != 3 # inequality

# > greater than

# < less than

# >= greater than or equal to

# <= less than or equal to

sin(23) # make sure the comments are at the end of a line

# because everything after a hash is treated as a comment log10(34)

#####
# Challenge 1: Basic Driving

#   a) Basic calculator time! Run the following in the CONSOLE:
#   32*19 + 123,
#   what do you get?
32*19 + 123
#   b) Run the following in a SCRIPT:
#   11*34 + log(10
#   What happens? Do you get a value? Error? Warning?
#   Can you fix it?
# missing a closing bracket!
11*34 + log(10) # this one will work
#   c) Which one is larger, cos(10) or sin(10)? Can you write an
#   expression to solve this?
   cos(10) > sin(10)
   cos(10) < sin(10)

#####


# functions
# name(stuff, otherstuff, specifiedstuff = morestuff)

   # r has inbuilt help!
help(log)

log(10)

log(10, base = 10)


#####
# Challenge 2: Functions and Help

#   a) What does the abs() function do? Access help.
#      What is abs(-10)
abs(-10)
help(abs)

#   b) What is the square root of 11? Is there a function for this in R?
11^0.5
sqrt(11)

#   c) How can we round numbers in R? Round 3.5 to the nearest integer.
#      Is it 3 or 4?

# many options, depending on the job at hand
round(3.5)
floor(3.9)
ceiling(3.1)


#####

# variables and storing data

# arrows (<-) are used to assign variables
variable_name <- sqrt(11)

variable_name +3

sin(variable_name)

# names can contain
# letters
# numbers
# underscores
# periods

# names are CASE SENSITIVE

name1 <- 34
periods.between.words <- 4
Name1 <- 35

name1 <- 34
new_name1 <- name1

#rm will remove variables you've created
rm(Name1)
# and ls will list them all out for you
ls()

# used together they can clear your stored data
# this is good to do at the start of a session to get a "clean slate" to work with
rm(list = ls())


#####
# Challenge 3: Variables and Storing Data

#   a) Try assigning some variables! Which of the following work as names?

 min_height <- 2
# _age =2 can't start with an underscore
 .mass =2 # hidden variable
 MaxLength =2
 maxLength =2
 # 2widths =2 also cant start with a number


#   b) What will be the value of each variable below after each step?
 height = 181.2
 weight = 85
 height = height ^2
 weight = sqrt(weight) + height/2


#####


# vectors

# r can store data grouped together into vectors
vector <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
# numeric vectors can be treated as numbers
vector + 5

2^vector

log(vector)
# but vectors can also contain other things
words <- c("these", "are", "some", "words") # make sure with text entries that each text entry is wrapped up in quotation marks

words + 2 # maths doesn't work with words

#####
## Challenge 4: Vectors

#   a) Create a vector with these numbers:
#      1, 11, 111, 1111

numbers <- c(1, 11, 111, 1111)

#   b) What is the square root of each of the numbers in A?

sqrt(numbers)

sqrt(c(1, 11, 111, 1111))


#      Store these as another vector.
sqrt_numbers <- sqrt(numbers)
# c) create a vector with your first name, last name, department, and favourite colour, and paste it into the google doc here!

Jeremy <- c("Jeremy", "Metha", "MDHS", "green")

#####


# expanding r with packages
# r has man y many user built pacakges you can access and use to expand its utility
install.packages("tidyverse")
library(tidyverse)

#####
## Challenge 5: Packages

# Install the tidyverse package onto your machines, then check if it's there and behaving using the library() function.


#####
