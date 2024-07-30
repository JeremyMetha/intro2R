setwd("~/intro to r")
rm(list = ls())

# data types
# logicals - true or false

# integers


# numerics/doubles - most of our numeric data will sit here

# why doubles?

# they take up double the memory!
object.size(as.integer(1:1000))
object.size(as.numeric(1:1000))

# but can store much larger values
# the largest possible integer value...
.Machine$integer.max

# is much smaller than the largest possible double
.Machine$double.xmax

> # complex - complex numbers


# characters/strings - everything non-numeric


# type coercions

as.logical()
as.integer()
as.numeric()
as.complex()
as.character()

###
# Challenge 1: Data typing and coercions


# Hierarchy:   logical -> integer -> numeric -> complex -> character

# Which of these coercion work? What do they produce? Why might this be the case?
as.numeric(FALSE)
as.logical(-2)
as.integer(4.9)
as.character(TRUE)
as.integer("eleven")
as.integer("11")
as.integer("TRUE")

countdown(minutes = 5)
###

# data structures

# vectors

# subsetting vectors


###
# Challenge 2: Vectors

# Create the following vectors in R. What are their data types?
c(TRUE,1L,10)
c("11",10,12)


# Create a vector that ranges from 10 to 50 in steps of 3 (use the seq() function)
#   How many elements are in the vector?
#   What is the value of the 7th element in the vector?
#   Replace the 10th element in the vector with twice it’s current value
#   How can you access the last 8 elements of the vector? Try finding two alternative ways.
#   Advanced: what is the sum of all the elements except the first 3          elements?
#   The sum() function might help here..


countdown(minutes = 10)
###

# lists

# named lists

###
# Challenge 3: Lists

# Create a named list called winter with the following elements:
#   A logical named too_damn_cold with value TRUE
#   A vector named better.temperatures with the values 24, 25 and 26
#   Change the third better temperature to 30 (that is, change 26 to 30) by reassigning it

countdown(minutes = 5)
###


# dataframes

# importing dataframes
trump <- read.csv("https://go.unimelb.edu.au/tt3r", stringsAsFactors=FALSE)

# accesssing and subsetting dataframes

#creating dataframes
# here are some cats!
name <- c("Otis", "Luna", "Nami", "Garfield")
colour <- c("black", "white", "tabby", "ginger")
weight <- c(4.5, 3.5, 2.5, 2)
hates_mondays <- c(FALSE, FALSE, FALSE, TRUE)

# let's group them into a dataframe
cats <- data.frame(name, colour, weight, hates_mondays)



###
# Challenge 4: Dataframes

# Our cats need to be put on the fancy square root diet, for Garfield's sake.
# Modify the weight column such that each cat loses the square root of their starting weight
# Through the power of positive influence from his peers, Garfield no longer hates Mondays.
# Modify his hates_mondays value to reflect this.

countdown(minutes = 10)
###
