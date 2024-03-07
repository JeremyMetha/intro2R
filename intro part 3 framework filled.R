setwd("~/intro to r")
rm(list = ls())
install.packages("tidyverse")
library(tidyverse)

# go.unimelb.edu.au/6oi8

# reading in data
titanic <- read_csv("https://goo.gl/4Gqsnz")

# looking at a dataset
View(titanic)
glimpse(titanic)
summary(titanic)

# data manipulation

# select

# filter

# mutate

# summarise

# group_by

# select

names_sex <- next_step(select(titanic, Name, Sex), function_things)


not_names_sex <- select(titanic, -Name, -Sex)

# pipe
names_sex <- titanic %>% # command/control + shift + M
  select(Name, Sex) %>%
  next_step(function_things)


# filter

men_only <- titanic %>%
  filter(Sex == "male")

# filter conditions
# == equality
# != inequality
# > greater than
# < less than
# >= greater/equal
# <= less/equal

# & match both conditions
# | match either condition

first_class_men_only <- titanic %>%
  filter(Sex == "male" & Pclass == 1)

first_class_and_men <- titanic %>%
  filter(Sex == "male" | Pclass == 1)

first_class_men_only <- titanic %>%
  filter(Sex == "male" & Pclass == 1) %>%
  select(Age, Name)


### Challenge 1: Filter and Select

# Produce dataframes that contain only:
# i.  men over 30

men_over_30 <- titanic %>%
  filter(Sex == "male" & Age > 30)

# ii. women older than 25 and no older than 60

women_25_to_60 <- titanic %>%
  filter(Sex == "female" & Age > 25 & Age <= 60)

# iii. Ages, Fares and Names for only male passengers
age_fare_name_males <- titanic %>%
  filter(Sex == "male") %>%
  select(Age, Fare, Name)

# iv. (Advanced) both passengers from  part i. and ii.

challenge_4 <- titanic %>%
  filter((Sex == "male" & Age > 30)|(Sex == "female" & Age > 25 & Age <= 60))
challege_4_2 <- rbind(men_over_30, women_25_to_60)

countdown(minutes = 8)
###

# cleaning data - using filter and select

titanic_cleaned <- na.omit(titanic) # probably a bit extreme in this case

colSums(is.na(titanic))

titanic_cleaned <- titanic %>%
  select(-Cabin) %>%
  na.omit()



# mutate



# adding columns

titanic_cleaned <- titanic_cleaned %>%
  mutate(Fare_Today = Fare * 83)


# changing columns

titanic_cleaned <- titanic_cleaned %>%
  mutate(Survived = as.logical(Survived))

# a kind of filter

titanic_cleaned <- titanic_cleaned %>%
  mutate(Kids = Age < 18)

### Challenge 2: Mutate

# Let's create some age ranges to sort our passengers into.
# i. Create a new column containing passenger ages rounded to the nearest 10 years with floor(Age/10).

titanic_cleaned <- titanic_cleaned %>%
  mutate(Age_brackets = floor(Age/10))

# The first class passengers don't want to mix with the riffraff. Create a new column which reads TRUE for first class passengers and FALSE for everyone else.

titanic_cleaned <- titanic_cleaned %>%
  mutate(First_class = Pclass == 1)

# Survived might be better served as a logical value than a numeric here, use the as.logical function from last week to change this column.

titanic_cleaned <- titanic_cleaned %>%
  mutate(Survived = as.logical(Survived))

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

Fare_summaries <- titanic_cleaned %>%
  summarise(meanFareToday = mean(Fare_Today),
            minFareToday = min(Fare_Today),
            maxFareToday = max(Fare_Today),
            sdFareToday = sd(Fare_Today))


# group_by

Fare_summaries <- titanic_cleaned %>%
  group_by(Kids) %>%
  summarise(meanFareToday = mean(Fare_Today),
            minFareToday = min(Fare_Today),
            maxFareToday = max(Fare_Today),
            sdFareToday = sd(Fare_Today),
            count = n())



# using mutate with group by

### Challenge 3: Group_by and Summarise
# i. Calculate the survival rate and number of survivors for each age range generated in challenge 4.

survived_summary <- titanic_cleaned %>%
  group_by(Age_brackets) %>%
  summarise(survival = mean(Survived),
            number = survival*n())


# ii. Calculate the survival rate for each combination of Class and Sex. Which had the highest/lowest chances of survival?

survived_summary <- titanic_cleaned %>%
  group_by(Pclass, Sex) %>%
  summarise(survival = mean(Survived),
            number = survival*n())

countdown(minutes = 5)
###


# writing data from R

write_csv(titanic_cleaned, "titanic_cleaned.csv")

### Challenge 4: Writing Data from R

# i. Make a subset of the titanic data to include only names, ages,  fares and class for children
# (below the age of 18).

final_challenge <- titanic_cleaned %>%
  filter(Age < 18) %>%
  select(Name, Age, Fare, Pclass)


# ii. Write the new subset to a file in your “Introduction_to_R” folder using write_csv().

write_csv(final_challenge, "kids.csv")


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
