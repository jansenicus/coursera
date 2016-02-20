Data Types - Part 2
===================

Creating vectors
----------------

The c() function (concatenate) can be used to create vectors of objects:

	> x <- c(0.5, 0.6)      # numeric
	> x <- c(TRUE, FALSE)   # logical
	> x <- c(T, F)          # logical
	> x <- c("a", "b", "c") # character
	> x <- c(9:29)          # integer
	> x <- c(1+0i, 2+4i)    # complex

Using the vector function:

	> x <- vector("numeric", length = 10)
	> x
	[1] 0 0 0 0 0 0 0 0 0 0 0


Mixing Objects
--------------

What about the following?

	> y <- c(1.7, "a") # character, 1.7 is converted into "1.7"
	> y <- c(TRUE, 2) # numeric, TRUE is converted into number (1)
	> y <- c("a", TRUE) # character, TRUE is converted to "TRUE"

Explicit Coercion
-----------------

Object can be explicitly coerced from one class to another using the as.* functions, if available.

	> x <- 0:6
	> class(x)
	[i] "integer"
	> as.numeric(x)
	[1] 0 1 2 3 4 5 6
	> as.logical(x)
	[1] FALSE TRUE TRUE TRUE TRUE TRUE TRUE
	> as.character(x)
	[1] "0" "1" "2" "3" "4" "5" "6"

Explicit Coercion
-----------------

Nonsensical coercion results in NAs:

	> x <-c("a", "b", "c")
	> as.numeric(x)
	[1] NA NA NA
	Warning message:
	NAs introduced by coercion
	> as.logical(x)
	[1] NA NA NA
	as.complex(x)
	[1] 0+0i 1+0i 3+0i 4+0i 5+0i 6+0i

Matrices
--------

Matrices are vectors with a dimension attribute. The dimension attribute is itself an integer vector of length 2 (nrow, ncol).

	> m<- matrix(nrow=2, ncol=3)
	> m
	     [,1] [,2] [,3]
	[1,]   NA   NA   NA
	[2,]   NA   NA   NA
	> dim(m)
	[1] 2 3
	> attributes(m)
	$dim
	[1] 2 3

Matrices are constructed _column-wise_, so entries can be thought of starting in the "upper left" corner and running down the columns.

	> m <- matrix(1:6, nrow = 2, ncol = 3)
	> m
	     [,1] [,2] [,3]
	[1,]    1    3    5
	[2,]    2    4    6

Matrices can also be created directly from vectors by adding a dimension attribute.

	> m <- 1:10
	> m
	[1]  1 2 3 4 5 6 7 8 9 10
	> dim(x) <- c(2, 5)
	> m
	     [,1] [,2] [,3] [,4] [,5]
	[1,]    1    3    5    7    9
	[2,]    2    4    6    8   10

Matrices are also commonly created by _column-bining_ or _row-binding_ with cbind() and rbind().

	> x <- 1:3
	> y <- 10:12
	cbind(x, y)
	     x  y
	[1,] 1 10
	[2,] 2 11
	[3,] 3 12
	> rbind(x, y)
	  [,1] [,2] [,3]
	x    1   2    3
	y   10  11   12

Lists
-----

Lists are a special type of vector that can contain elements of different classes. Lists are a very important data type in R and you should get to know them well.

	> x <- list(1, "a" TRUE, 1 + 4i)
	> x
	[[1]]
	[1] 1
	
	[[2]]
	[1] "a"
	
	[[3]]
	[1] TRUE
	
	[[4]]
	[1] 1+4i



