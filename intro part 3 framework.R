setwd("~/intro to r")
rm(list = ls())
library(tidyverse)

# reading in data
titanic <- read_csv("https://goo.gl/4Gqsnz")

# looking at a dataset


# cleaning our data


# data manipulation

# select

# filter




# filter conditions
# == equality
# != inequality
# > greater than
# < less than
# >= greater/equal
# <= less/equal

# & match both conditions
# | match either condition

### Challenge 1: Filter and Select

# Produce dataframes that contain only:
# i.  men over 30

# ii. women older than 25 and no older than 60

# iii. Ages, Fares and Names for only male passengers

# iv. (Advanced) both passengers from  part i. and ii.

countdown(minutes = 8)
###

# cleaning data - using filter and select

# mutate

# adding columns

# changing columns

# a kind of filter

### Challenge 2: Mutate

# Let's create some age ranges to sort our passengers into.
# i. Create a new column containing passenger ages rounded to the nearest 10 years with floor(Age/10).

# The first class passengers don't want to mix with the riffraff. Create a new column which reads TRUE for first class passengers and FALSE for everyone else.

# Survived might be better served as a logical value than a numeric here, use the as.logical function from last week to change this column.

countdown(minutes = 8)
###

# summarise

# useful functions
# mean()
# median()
# min()
# max()
# sd()
# IQR()
# n()


# group_by

# using mutate with group by

### Challenge 3: Group_by and Summarise
# i. Calculate the survival rate and number of survivors for each age range generated in challenge 4.


# ii. Calculate the survival rate for each combination of Class and Sex. Which had the highest/lowest chances of survival?

countdown(minutes = 5)
###


# writing data from R

### Challenge 4: Writing Data from R

# i. Make a subset of the titanic data to include only names, ages,  fares and class for children
# (below the age of 18).


# ii. Write the new subset to a file in your “Introduction_to_R” folder using write_csv().
write_csv(children, "children.csv")

countdown(minutes = 5)
###

# secret code
titanic_cleaned <- titanic_cleaned %>%
  mutate(Age_brackets = floor(Age/10)) %>%
  mutate(Age_brackets = case_when(Age_brackets == 0~ "0-9",
                                  Age_brackets == 1~ "10-19",
                                  Age_brackets == 2~ "20-29",
                                  Age_brackets == 3~ "30-39",
                                  Age_brackets == 4~ "40-49",
                                  Age_brackets == 5~ "50-59",
                                  Age_brackets == 6~ "60-69",
                                  Age_brackets == 7~ "70-79",
                                  Age_brackets == 8~ "80-89"))
