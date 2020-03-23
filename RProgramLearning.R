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
# 

### Coercion
  # So how does R coerce data types? If a character string is present in an atomic vector, R will convert everything else in the vector to character strings. If a vector only contains logicals and numbers, R will convert the logicals to numbers; every TRUE becomes a 1, and every FALSE becomes a 0
### Lists
### Data Frames



