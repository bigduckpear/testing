library(ggplot2)
x <- c(-1, -0.8, -0.6, -0.4, -0.2)
y <-  x^3
qplot(x,y)

sqrt(2)^2-2

die <- c(1,2,3,4,5,6)

# R will always us the first value in dim for number of rows, and the second value for the number of columns.
# R always fill up each matrix by columns, instead of by rows
dim(die) <- c(1,2,3)

die <- c(1,2,3,4,5,6)
m <- matrix(die, nrow=2)
n <- matrix(die, nrow=2, byrow=TRUE)




