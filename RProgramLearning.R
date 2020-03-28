library(ggplot2)


#### R Objests
### Atomic Vectors
  # Doubles
  # Integers
  # Characters
  # Logicals
  # Complex and Raw
### Attributes
  # Names
  # Dim
### Matrices
### Arrays
### Class
  # Dates and Times
  # Factors
### Coercion
### Lists
### Data Frames


################################################################





#### R Objests
### Atomic Vectors
  # Doubles
  # Integers
  # Characters
  # Logicals
  # Complex and Raw
### Attributes
  # Names
  # Dim
### Matrices

# R will always us the first value in dim for number of rows, and the second value for the number of columns.
# R always fill up each matrix by columns, instead of by rows
dim(die) <- c(1,2,3)

die <- c(1,2,3,4,5,6)
m <- matrix(die, nrow=2)
n <- matrix(die, nrow=2, byrow=TRUE)



### Arrays

ar <- array(c(11:14, 21:24, 31:34), dim=c(2,2,3))

### Class

# Changing the dimensions of the object will NOT change the type of the object, but will change the objects class
# A class is a special case of an atomic vector.
# An object's class attibute will not always apprear when you run attibutes; 
# (-contuned)you may need to specifically search for it with class
# the class of a double is numeric

die <- c(1,2,3,4,5,6)
typeof(die)
class(die)

dim(die) <- c(2,3)
typeof(die)
class(die)

  # Dates and Times
  # Factors

# to make a factor, pass an atomic vecotr into the "factor" function. R will recode the data in the vector as integers.

gender <- factor(c("male","female", "female", "male"))
attributes(gender)

gender

unclass(gender)
gender

class(gender)
gender

color <- factor(c("red","blue", "orange", "red"))
attributes(color)

color

unclass(color)
color

class(color)
color



# Factors make it easy to put categorical variables into a statistical model bc the variables are already coded as numbers.
# 

### Coercion
  # So how does R coerce data types? If a character string is present in an atomic vector, R will convert everything else
  # in the vector to character strings. If a vector only contains logicals and numbers, R will convert the logicals to
  # numbers; every TRUE becomes a 1, and every FALSE becomes a 0

  # You can convert data's type by using as.functions, such as as.character(1), as.logical(1)
### Lists
### Data Frames

df <- data.frame(face=c("ace", "two", "six"), suit=c("clubs", "clubs", "clubs"), value=c(1,2,6))
df
typeof(df)
class(df)
str(df)
#'data.frame':	3 obs. of  3 variables:
# $ face : Factor w/ 3 levels "ace","six","two": 1 3 2
# $ suit : Factor w/ 1 level "clubs": 1 1 1
# $ value: num  1 2 6
# R saves the chracter strings (ace, two, six, clubs) as factors, because R like factors!
# Not good here, but can change by adding the argument, StringsAsFactors=False

df <- data.frame(face=c("ace", "two", "six"), suit=c("clubs", "clubs", "clubs"), value=c(1,2,6), stringsAsFactors = FALSE)
str(df)
# 'data.frame':	3 obs. of  3 variables:
# $ face : chr  "ace" "two" "six"
# $ suit : chr  "clubs" "clubs" "clubs"
# $ value: num  1 2 6

getwd()
# you can change the working directory to any folder with: setwd()
# setwd("c:/users/zzhan/Documents/Respository_RStudio/testing")

poker <- read.table("poker.csv", sep=",",header=TRUE)

# na.strings will convert missing values to NA.

poker <- read.table("poker.csv", sep=",",header=TRUE, na.strings = ".")

# stringasfactors R wants to convert every character string into a factor, so need to use a statement to correct it

poker <- read.table("poker.csv", sep=",",header=TRUE, stringsAsFactors = FALSE)

# If you will be loading more than one data file, you can change the default factoring behavior at global level

options(stringsAsFactors = FALSE)

# Saving data as R files better than plain-text files

a <- 1
b <- 2
c <- 3
save(a, b, c, file = "stuff.RData")


library("rJava")
library("xlsx")

# READING SPREADSHEETS
# Two-step process
# 1. Load an excel workbook by loadWorkbook : 
# 2. Read a spreadsheet from the workbook with readWorksheet
# Or one step process
# sheet <- readWorksheetFromfile ("file.xlsx", sheet-1, ...)

# WRITING SPREADSHEET
# one step process: 
# writeWorksheetToFile("file.xlxs", data=poker, sheet="sheet1", startRow=1,startCol=1)

###########################################
# TO SUMMARIZE
# Data frames store one of the most common forms of data used in data science, tabular data (表数据)

# Chapter Modifying values
# Make a copy to always have a pristine copy of deck
# deck2 <- deck
# 
# Changing values in place
# 
# vec <- c(0,0,0)
# 
# vec[1] <- 1000
# 
# You can replace multiple values:
# 
# vec[c(1,2)] <- c(100,8)
# vec[1:3] <- c(4,5,6)
# vec[1:3] <- vec[1:3]+1
# 
# You can also create new value:
# vec[4] <- 2
# 
# This provide a great way to add new viriables to datasets:
# deck2$new <- 1:52
# 
# You can also remove columns
# deck2$new <- NULL

# when you work with logical subsetting, no need to know where in your dataset a value exists.
# Only need to know how to describe the value with a logical test
# For example, to assign 14 to ace
# deck3$value[deck3$face=="ace"] <- 14

# Logical setting is one of the things R does the best!
# Logical setting is one of the things R does the best!
# Logical setting is one of the things R does the best!



##################################
# Boolean Operations
# a <- c(1,2,3)
# b <- c(1,2,3)
# c <- c(1,2,4)

# a==b
# b==c
# a==b & b==c

# Missing Information
# NA stands for "not available"

# na.rm means NA removal

# payouts <- c("DD"=100, "7"=80, "BBB"=40, "BB"=25, "B"=10, "C"=10,"0"=0)

# Lookup Table vs If Trees
# As a general rule
# Use an if tree if each branch of the tree runs different code.
# Use a lookup table if each branch of the tree only assigns different values.

##############################################
# S3 system 
# S3 refers to a class system built into R, which governs how R handles objects of different classes.
# S3 system is built around three components: attributes, generic functions and methods

get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

score <- function (symbols) {
  # identify case
  same <- symbols[1] == symbols[2] && symbols[2] == symbols[3]
  bars <- symbols %in% c("B", "BB", "BBB")
  
  # get prize
  if (same) {
    payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, 
                 "B" = 10, "C" = 10, "0" = 0)
    prize <- unname(payouts[symbols[1]])
  } else if (all(bars)) {
    prize <- 5
  } else {
    cherries <- sum(symbols == "C")
    prize <- c(0, 2, 5)[cherries + 1]
  }
  
  # adjust for diamonds
  diamonds <- sum(symbols == "DD")
  prize * 2 ^ diamonds
}


play <- function() {
  symbols <- get_symbols()
  print(symbols)
  score(symbols)
}

####################################################
# Unfortunately, loops in R can sometimes be slower than loops in other languanges.
# Vectorized code, a style of lightening-fast code that takes advantage of all of R's strengths. 
# Vectorized code, a style of lightening-fast code that takes advantage of all of R's strengths. 
# Vectorized code, a style of lightening-fast code that takes advantage of all of R's strengths. 

# Vectorized Code
# The fastest R code takes advantage of three things:
  # Logical tests + subsetting + element-wise execution

# The fastest R code takes advantage of three things:
  # Logical tests + subsetting + element-wise execution
# How to write Vectionized Code 
# 1. Use vectorized functions to complete the sequential steps in your program
# 2. Use logical subsetting to handle parallel cases. Try to manipulate every element in a case at once. 

# How to write Fast for Loops in R
# 1. Do as much as you can outside of the "for" Loops
# 2. Make sure that any storage objects that you use with the loop are 
    # large enough to contain all of the results of the loop

# Vectorized Code in Practice
# The combination of an "if" tree with a "for" loop suggests you can write a pecec of vectorized code that takes many slot
# combinations and then uses logical subsetting to operate all at once. 

#################################################################

# How to write a reproducible example.
# You are most likely to get good help with your R problem if you provide a reproducible example. A reproducible example allows someone else to recreate your problem by just copying and pasting R code.
# 
# There are four things you need to include to make your example reproducible: required packages, data, code, and a description of your R environment.
# 
# Packages should be loaded at the top of the script, so it's easy to see which ones the example needs.
# 
# The easiest way to include data in an email is to use dput() to generate the R code to recreate it. For example, to recreate the mtcars dataset in R, I'd perform the following steps:
#   
#   Run dput(mtcars) in R
# Copy the output
# In my reproducible script, type mtcars <- then paste.
# Spend a little bit of time ensuring that your code is easy for others to read:
#   
#   make sure you've used spaces and your variable names are concise, but informative
# use comments to indicate where your problem lies
# do your best to remove everything that is not related to the problem.
# The shorter your code is, the easier it is to understand.
# Include the output of sessionInfo() as a comment. This summarises your R environment and makes it easy to check if you're using an out-of-date package.
# 
# You can check you have actually made a reproducible example by starting up a fresh R session and pasting your script in.
# 
# Before putting all of your code in an email, consider putting it on http://gist.github.com/. It will give your code nice syntax highlighting, and you don't have to worry about anything getting mangled by the email system.
# 
# 

############################################
