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




