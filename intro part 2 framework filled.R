setwd("~/intro to r")
rm(list = ls())

# go.unimelb.edu.au/g4i8


# data types
# logicals - true or false
logicals <- c(TRUE, FALSE, T, F)

typeof(logicals)
3 > 42


# integers
typeof(1L)

integers <- c(1L, 3L, 5L)

# numerics/doubles - most of our numeric data will sit here

typeof(sqrt(3.2))
numeric <- c(1, 2, 3, 4, 5)
typeof(vector)

# why doubles?

object.size(as.integer(1:1000))
object.size(as.numeric(1:1000))
.Machine$integer.max
.Machine$double.xmax

# complex - complex numbers

sqrt(-1)
sqrt(-1 + 0i)
typeof(sqrt(-1 + 0i))

complex <- c(1+0i, 0 + 3i)

# characters/strings - everything non-numeric
typeof ("lettuce")

characters <- c("lettuce", "!@#$%^", "123", "multiple words")

123+5 # can maths
"123" + 5 # can't maths

# type coercions

as.logical()
as.integer()
as.numeric()
as.complex()
as.character()

as.character(11)
as.numeric("eleven")
as.numeric("11")

###
# Challenge 1: Data typing and coercions


# Hierarchy:   logical -> integer -> numeric -> complex -> character

# Which of these coercion work? What do they produce?
as.numeric(FALSE)
as.logical(-2)
as.integer(4.9)
as.character(TRUE)
as.integer("eleven")
as.integer("11")
as.integer(as.logical("TRUE"))

countdown(minutes = 5)
###

# data structures

# vectors

c()

long_vector <- seq(1, 1000, 0.3)
long_vector

head(long_vector, 32)
tail(long_vector, 24)
length(long_vector)

# subsetting vectors
characters[1]

characters[3]

1:3

characters[1:3]

characters[-2]

characters[2] <- "3 wombats"

characters[15] <- "!@#$%^"

characters[c(1, 2, 3, 4, 5, 15)]

characters

numeric^3

mixed_vector <- c(T, 11L, 32+0i, "lettuce")

###
# Challenge 2: Vectors

# Create the following vectors in R. What are their data types?
typeof(c(TRUE,1L,10))
as.numeric(c("11",10,12))


# Create a vector that ranges from 10 to 50 in steps of 3 (use the seq() function)
help(seq)
sequence <- seq(from = 10,by = 3, to = 50 )
#   How many elements are in the vector?
length(sequence)
#   What is the value of the 7th element in the vector?
sequence[7]
#   Replace the 10th element in the vector with twice it’s current value
sequence[10] <- sequence[10]*2
#   How can you access the last 8 elements of the vector? Try finding two alternative ways.
tail(sequence, 8)
sequence[7:length(sequence)]
sequence[-1:-6]
sequence[(length(sequence)+1)]<- 1
#   Advanced: what is the sum of all the elements except the first 3          elements?
#   The sum() function might help here..
sum(sequence[1:11])
sequence

countdown(minutes = 10)
###

# lists

mixed_list <- list(T, 11L, 32+0i, "lettuce", characters)

list(1, 2, 3, 4, 5) + 5

mixed_list[[4]] <- "cabbage"
mixed_list[[5]][2] <- "4 wombats"
# named lists

named_list <- list(logical = T,
                   integer = 11L,
                   complex = 32+0i,
                   vegetable = "lettuce",
                   vector = )

named_list$vegetable
named_list[[4]]

###
# Challenge 3: Lists

# Create a named list called winter with the following elements:
#   A logical named too_damn_cold with value TRUE
#   A vector named better.temperatures with the values 24, 25 and 26
#   Change the third better temperature to 30 (that is, change 26 to 30) by reassigning it

winter <- list(too_damn_cold = TRUE,
               better.temperatures = c(24, 25, 26))
winter[[2]][3] <- 30
winter$better.temperatures[3] <- 30

countdown(minutes = 5)
###


# dataframes

# importing dataframes
trump <- read.csv("https://go.unimelb.edu.au/tt3r", stringsAsFactors= FALSE)

# accesssing, navigating and subsetting dataframes

trump$text[434]

head(trump, 7)

datarame[row, col]
trump[32:40, 2:3]

#creating dataframes
# here are some cats!
name <- c("Otis", "Luna", "Nami", "Garfield")
colour <- c("black", "white", "tabby", "ginger")
weight <- c(4.5, 3.5, 2.5, 2)
hates_mondays <- c(FALSE, FALSE, FALSE, TRUE)

# let's group them into a dataframe
cats <- data.frame(name, colour, weight, hates_mondays)

new_cat <- list("Felix", "white", 4, NA)

cats <- rbind(cats, new_cat)
View(cats)
###
# Challenge 4: Dataframes

# Our cats need to be put on the fancy square root diet, for Garfield's sake.
# Modify the weight column such that each cat loses the square root of their starting weight

cats$weight <- cats$weight - sqrt(cats$weight)
cats <- cats %>%
  mutate(new_weight = cats$weight - sqrt(cats$weight))
# Through the power of positive influence from his peers, Garfield no longer hates Mondays.


# Modify his hates_mondays value to reflect this.
cats$hates_mondays[4] <- FALSE
countdown(minutes = 10)
###

install.packages("tidyverse")

