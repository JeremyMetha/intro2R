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

# throwback to last week - some dplyr tools

survivalsummaries <- titanic %>%
  group_by(Pclass) %>% # using Pclass as a grouping variable
  summarise(meanSurvival = mean(Survived), # create summary data for each class survival summary data for survival rates
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

# multiple panels with facets


###
# Challenge 3: Putting it all together

# The final challenge of the course! Let’s put everything we’ve learned together and do some data analysis!
#
# Each group has been given a unique (and hopefully interesting) public dataset.
#
# For this challenge, work with your breakout team to:
# i.   Decide on a research question to answer
# ii.  Manipulate the dataset with summarise(), group_by(), mutate(), etc in order to answer your data question
# iii. Create plot(s)  to illustrate your findings
# iv.  Present your findings to the whole group!

countdown(minutes = 30)
###

# useful ggplot code resources

# http://www.sthda.com/english/wiki/be-awesome-in-ggplot2-a-practical-guide-to-be-highly-effective-r-software-and-data-visualization#graphical-parameters

# https://r-graph-gallery.com/



