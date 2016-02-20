Your First R Function
=====================

Add two numbers together.

	> add2 <- function(x, y) {
	+ 	x + y
	+ }

	> add2(3, 5)
	[1] 8

Take a vector and return a subset of numbers larger than 10.

	> aboveTen <- function(x) {
	+ 	use <- x > 10 ## logical vector
	+ 	x[use]
	+ }

	> aboveTen(1:20)
	[1] 11 12 13 14 15 16 17 18 19 20
	
Take a vector and let the user define the number (but default to 10).

	> above <- function(x, n = 10) {
	+ 	use <- x > n
	+ 	x[use]
	+ }
	
	> above(1:20, 12)
	[1] 13 14 15 16 17 18 19 20

Take a matrix or a dataframe and calculate the mean of each column. Include an optional argument to keep or remove NA values in the data.

	> columnMean <- function(x, removeNA = TRUE) {
	+   nc <- ncol(x)
	+   means <- numeric(nc)
	+   for(i in 1:nc) {
	+     means[i] <- mean(x[,i], na.rm = removeNA)
	+   }
	+   means
	+ }

	> columnMean(airquality)
	[1]  42.129310 185.931507   9.957516  77.882353   6.993464  15.803922


	