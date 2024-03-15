rm(list = ls())
library(tidyverse)
setwd("~/intro to r")

# reading in the data
titanic <-  read_csv("https://goo.gl/4Gqsnz")

# cleaning the data
titanic <- titanic %>%
  select(-Cabin) %>%
  na.omit()
#today's worksheet
# go.unimelb.edu.au/y6e8


# plotting basics - scatterplots

ggplot(data = titanic, aes(x = Age , y = Fare)) +
  geom_point()

# changing graphical elements
ggplot(data = titanic, aes(x = Age , y = Fare)) +
  geom_point(size = 3, alpha = 0.9, colour = "pink")

# changing graphical elements to match the data - aes()

ggplot(data = titanic, aes(x = Age , y = Fare, colour = as.character(Pclass), shape = Sex)) +
  geom_point(alpha = 0.9)

### Challenge 1: Scatterplots
# 1. Create a scatterplot plotting passenger class on the x-axis and fare on the y-axis

ggplot(data = titanic, aes(x = Pclass, y = Fare)) +
  geom_point()


# 2. To improve this visualisation:
# i.   change your geom from geom_point() to geom_jitter()
ggplot(data = titanic, aes(x = Pclass, y = Fare)) +
  geom_jitter()
# ii.  change the point size to 2

ggplot(data = titanic, aes(x = Pclass, y = Fare)) +
  geom_jitter(size = 2)
# iii. change the colour to signify whether a passenger survived or not

ggplot(data = titanic, aes(x = Pclass, y = Fare)) +
  geom_jitter(size = 2, aes(colour = as.logical(Survived)))
# (you'll need the aes() function for this one)

countdown(minutes = 7)
###

# adding multiple aesthetics

# scaling
ggplot(data = titanic_no_highrollers, aes(x = Pclass, y = Fare)) +
  geom_jitter(size = 2, aes(colour = as.logical(Survived)))

ggplot(data = titanic, aes(x = Pclass, y = log(Fare))) +
  geom_jitter(size = 2, aes(colour = as.logical(Survived)))

ggplot(data = titanic, aes(x = Pclass, y = Fare)) +
  geom_jitter(size = 2, aes(colour = as.logical(Survived)))+
  scale_y_continuous(limits = c(0, 100))

titanic_no_highrollers <- titanic %>%
  filter(Fare <= 450)


# lines

# throwback to last week - some dplyr tools

survivalsummaries <- titanic %>%
  group_by(Pclass) %>% # using Pclass as a grouping variable
  summarise(meanSurvival = mean(Survived), # create summary data for each class survival summary data for survival rates
            sdSurvival = sd(Survived),
            count = n(),
            SEMsurvival = sdSurvival/sqrt(count))

# line graphs

ggplot(data = survivalsummaries, aes(x= Pclass, y =meanSurvival)) +
  geom_line()+
  geom_point()+
  geom_errorbar(aes(ymin = meanSurvival - SEMsurvival, ymax = meanSurvival + SEMsurvival ))

# multiple groups, multiple lines!

survivalsummaries <- titanic %>%
  group_by(Pclass, Sex) %>% # using Pclass as a grouping variable
  summarise(meanSurvival = mean(Survived), # create summary data for each class survival summary data for survival rates
            sdSurvival = sd(Survived),
            count = n(),
            SEMsurvival = sdSurvival/sqrt(count))

ggplot(data = survivalsummaries, aes(x= Pclass,
                                     y = meanSurvival,
                                     colour = Sex)) +
  geom_line()+
  geom_point()+
  geom_errorbar(aes(ymin = meanSurvival - SEMsurvival,
                    ymax = meanSurvival + SEMsurvival ))


# regression as another approach

ggplot(data = titanic, aes(x = Pclass, y = Survived, colour = Sex))+
  geom_smooth(method = "lm")




### Challenge 2: Lines and regressions

# 1. Let's have a look at average fare across age brackets.
# i.Firstly, let's add a new column to the titanic dataset with 10 year age brackets with mutate(AgeBracket = floor(Age/10))

titanic <- titanic %>%
  mutate(Age_bracket = floor(Age/10))

# ii. Using group_by() and summarise() find the mean fare for each age bracket

fareSummaries <- titanic %>%
  group_by(Age_bracket, Pclass) %>%
  summarise(meanFare = mean(Fare))

# iii. Plot these using geom_line()

ggplot(data = fareSummaries, aes(x = Age_bracket, y = meanFare, colour = as.character(Pclass))) +
  geom_line() +
  geom_point()


# iv. What if we wanted to look at this in a class dependent manner? Add Pclass to your grouping variables, then plot separate coloured lines for each class.

# 2.   Another way of looking at this data would be with a scatterplot and regression lines. Create a scatterplot of Fare against Age (not the summaries) and add a geom_smooth(method = "lm") for each class.
ggplot(data=titanic, aes(x= Age, y = Fare, colour = as.character(Pclass))) +
  geom_smooth(method = "lm")+
  geom_point()

countdown(minutes = 10)
###

# other types of plots
ggplot(data = titanic, aes(x=Age, fill = as.character(Pclass))) +
  geom_histogram(position = "dodge")


# multiple panels with facets
ggplot(data = titanic, aes(x=Age, fill = as.character(Pclass))) +
  geom_histogram(position = "dodge")+
  facet_wrap(Sex~Pclass) + xlab("x label") + ylab("people")+
  ggtitle("cool graph")

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

countdown(minutes = 22)
###

# useful ggplot code resources

# http://www.sthda.com/english/wiki/be-awesome-in-ggplot2-a-practical-guide-to-be-highly-effective-r-software-and-data-visualization#graphical-parameters

# https://r-graph-gallery.com/



