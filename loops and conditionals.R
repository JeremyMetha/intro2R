### loops, conditionals and functions
library(countdown)
rm(list = ls())

# loops

# for loop

for (i in 1:10) { # for 1, 2, 3...
  print(i)
}
values <- list()
for (i in 1:10) {
  values[[i]] <- i
}

# some useful indexing functions
colnames(trees) # for looping over columns of a dataframe
unique(trees$Girth) # for looping over unique values in a dataframe column


for (col in colnames(trees)) {
  print(col)
  trees[[col]]

}



### challenge 1:

# 1. create a for loop that prints the first 20 digits of the fibonnachi sequence in the console

# initialise out first two steps
j = 0
k = 1
print(j) # and print them out
print(k)
for (i in 1:18) { # then for the remaining 18, execute this loop
  fib <- j + k
  j <- k
  k <- fib
  print(fib)
}

# 2. modify the loop to store these values in a list instead


fib <- list(0, 1)
for (i in 3:20) {
  fib[[i]] <- fib[[i-2]] + fib[[i-1]]
  }

# 3. create a for loop to print the column name and number of unique values in each column of the iris dataframe
flowers <- list()
i = 0
for (name in colnames(iris)) {
  i <- i+ 1
  print(name)
  flowers[[i]] <- length(unique(iris[[name]]))

}


# while loop
i= 0
while (i <= 20) { # because i isn't changing in the loop, this will go forever!
  print(i)

}


while (i<= 20) { # this one will work as we're incrementing i in our loop
print(i)
i<- i + 2

}


# nesting loops can be used for iteration over things inside loops too!
for (i in (0:9)*10) { # for 0, 10, 20...
  for (j in 1:10) { # add 1, 2, 3, ...
    print(i+j) # this will count from 1 to 100
  }

}


### challenge 2:

# 2.1. modify the loop from challenge 1.1 to print all fibonacchi numbers less than 50

fib <- list(0, 1)
i = 2
while (fib[[i]] <= 50) {
  i <- i + 1
  fib[[i]] <- fib[[i-2]] + fib[[i-1]]
  print(fib[[i-1]])

  }

# 2.2. construct loops to print the times tables from 1*1 to 12*12
timestable <- data.frame()
for (i in 1:12) {
  for (j in 1:12) {
    print(i*j)
    timestable[i, j] <- i*j # we can assign this to spots on a dataframe with those same indexes too
  }

}


# conditionals
for (i in 1:20) {
  if (i %% 2 == 0){ # the code inside each set of curly brackets only executes if the statement is true
    print(i)
  } else if (i %% 3 ==0){
    print("divisible by 3")
  } else {
    print("not divisible by 3")
  }
}

### challenge 3:

# 3.1. modify the loop created in challenge 2.1 to only print the even fibonacchi numbers

fib <- list(0, 1)
i = 2
while (fib[[i]] <= 50) {
  i <- i + 1
  fib[[i]] <- fib[[i-2]] + fib[[i-1]]
  if(fib[[i]] %%2 == 0){
    print(fib[[i]])
  }
}

# functions

farenheit_to_celcius <- function(temp){ # this is defining a new function called farenheit_to_celcius, which takes a single argument called temp
  new_temp <- (temp-32)/1.8
  return(new_temp) # the return statement is what he function will give back to you when it executes
}

farenheit_to_celcius(32)

addition <- function(x, y) { # functions can taker multiple arguments, this one takes two values
  add <- x+ y
  return(add)
}

addition(3, 4)


### challenge 4:

# 4.1  create a function to convert centimetres into inches

cm_to_inch <- function(length){
  new_length <- length/2.54
  return(new_length)
}
cm_to_inch(2.54)

# 4.2  create another function to convert them back

inch_to_cm <- function(length){
  new_length <- length*2.54
  return(new_length)
}

# 4.3  create a function that takes two numbers as inputs and multiplies them together

multiplier <- function(x, y){
  value <- x*y
  return(value)
}
multiplier(3, 5)

# function defaults

addition <- function(x, y, z = 0, ...) { # by setting z = 0 here, we can suply a third argument to this function, or leave it empty if we only want to add two numbers
  add <- x+ y + z
  return(add)
}
addition(x =3, y =4, z = 5)

# composing functions

farenheit_to_celcius <- function(temp){
  new_temp <- (temp-32)/1.8
  return(new_temp)
}
celcius_to_farenheit <- function(temp){
    new_temp <- (temp*1.8 + 32)
    return(new_temp)
}

temp_converter <- function(temp, direction = 0){ # functions can be built up from smaller, existing functions!
  if(direction == "f_to_c"){
    return(farenheit_to_celcius(temp))
  } else if (direction == "c_to_f"){
    return(celcius_to_farenheit(temp))
  } else {
    print("direction not indicated: must be f_to_c or c_to_f")
  }
}
temp_converter(32, "c_to_c")
### challenge 5:

# 5.1 modify your function from 4.3 to take either 2 or 3 numbers and multiply them together

multiplier <- function(x, y, z=1){
  value <- x*y*z
  return(value)
  }

# 5.2 create a new function that can convert centimetres to inches or inches to centimetres using the functions you already made in 4.1 and 4.2.

length_converter <- function(length, direction = 0){
  if(direction== "inch_to_cm"){
    return(inch_to_cm(length))
  } else if (direction == "cm_to_inch"){
    return(cm_to_inch(length))
  } else {
    print("direction not indicated: must be cm_to_inch or inch_to_cm")
  }
}

# 5.3 make a more general converter that will convert either length or temperature, depending on what you give it


general_converter <- function(value, direction = 0){
  if (direction == "inch_to_cm" | direction == "cm_to_inch"){
    return(length_converter(value, direction))
  } else if (direction == "c_to_f" | direction == "f_to_c"){
    return(temp_converter(value, direction))
  }
    else {
      print("direction not indicated: must be cm_to_inch, inch_to_cm, f_to_c, or c_to_f")
    }
}

