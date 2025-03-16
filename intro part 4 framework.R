rm(list = ls())
library(tidyverse)
setwd("~/intro to r")

# reading in the data
titanic <-  read_csv("https://goo.gl/4Gqsnz")

# cleaning the data
titanic <- titanic %>%
  select(-Cabin) %>%
  na.omit()

# plotting basics - scatterplots

# changing graphical elements


# changing graphical elements to match the data - aes()

### Challenge 1: Scatterplots
# 1. Create a scatterplot plotting passenger class on the x-axis and fare on the y-axis



# 2. To improve this visualisation:
# i.   change your geom from geom_point() to geom_jitter()
# ii.  change the point size to 2
# iii. change the colour to signify whether a passenger survived or not
# (you'll need the aes() function for this one)

countdown(minutes = 7)
###

# adding multiple aesthetics

# scaling


# lines

# throwback to last session - some dplyr tools

survivalsummaries <- titanic %>%
  group_by() %>% # create summary data for each class 
  summarise(meanSurvival = mean(Survived), # survival summary data for survival rates
            sdSurvival = sd(Survived),
            count = n(),
            SEMsurvival = sdSurvival/sqrt(count))

# line graphs

# multiple groups, multiple lines!

# order matters

# regression as another approach






### Challenge 2: Lines and regressions

# 1. Let's have a look at average fare across age brackets.
# i.Firstly, let's add a new column to the titanic dataset with 10 year age brackets with mutate(AgeBracket = floor(Age/10))

# ii. Using group_by() and summarise() find the mean fare for each age bracket

# iii. Plot these using geom_line()


# iv. What if we wanted to look at this in a class dependent manner? Add Pclass to your grouping variables, then plot separate coloured lines for each class.

# 2.   Another way of looking at this data would be with a scatterplot and regression lines. Create a scatterplot of Fare against Age (not the summaries) and add a geom_smooth(method = "lm") for each class.
countdown(minutes = 10)
###

# other types of plots

# histograms

# multiple panels with facets

# boxplots



###
# Challenge 3: Looking at data distributions

# Let's create some exploratory figures around titanic passenger age

# First, create a histogram of passenger ages using geom_histogram. What might be a good binwidth for this distribution?

# let's look at this in a class dependent manner. Add a facet_wrap layer to visualise each class seperately

# Now let's have a look at a more condensed visualisation by creating boxplots for the age distribution within each class. 
# You can do this in a single panel or include facets for this one!


countdown(minutes = 10)
###

# making things pretty

# titles and labels

# exporting graphs

# useful ggplot code resources

# http://www.sthda.com/english/wiki/be-awesome-in-ggplot2-a-practical-guide-to-be-highly-effective-r-software-and-data-visualization#graphical-parameters

# https://r-graph-gallery.com/

# the IMDb database 
# IMDb <- read_csv("https://go.unimelb.edu.au/p8is”)




