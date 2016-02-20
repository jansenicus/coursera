lapply()
========

Looping on the command line
---------------------------

Writing for and while loops is useful when programming but not particularly easy when working interactively on the command line. There are some functions which implement looping to make life easier.

* lapply(): Loop over a list and evaluate and function on each element
* sapply(): Same as lapply() but try to simplify the result
* apply(): Apply a function over the margins of an array
* tapply(): Apply a function over subsets of a vector
* mapply(): Multivariate version of lapply

An auxiliary function split() is also useful, particularly in conjunction with lapply().

lapply()
--------

lapply() takes three arguments

1. A list x (if x is not a list it will be coerced to a list using as.list)
2. A function (or name of a function) FUN
3. Other arguments via its … argument

The function:

	lapply

	## function(X, FUN, …) {
	##     FUN <- match.fun(FUN)
	##     if (!is.vector(X) || is.object(X))
	##         X <- as.list(X)
	##     .Internal(lapply(X, FUN))
	## }
	## <bytecode: 0x7ff7a195c00>
	## <environment: namespace:base>

The actual looping is done internally in C code.

lapply() always returns a list, regardless of the class of the input.

	> x < list(a = 1:5, b = rnorm(10))
	> lapply(x, mean)
	$a
	[1] 3
	
	$b
	[1] 0.0296824

A more complicated example:

	> x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
	> lapply(x, mean)
	$a
	[1] 2.5
	
	$b
	[1] 0.6082667
	
	$c
	[1] 1.467083
	
	$d
	[1] 5.074749

Another way to call lapply()

	> x <- 1:4
	> lapply(x, runif)
	[[1]]
	[1] 0.2675082
	
	[[2]]
	[1] 0.2186453 0.5167968
	
	[[3]]
	[1] 0.2689506 0.1811683 0.5185761
	
	[[4]]
	[1] 0.5627829 0.1291569 0.2563676 0.7179353

Pass arguments to your function:

	> x <- 1:4
	> lapply(x, runif, min = 0, max = 10)
	[[1]]
	[1] 2.7815

	[[2]]
	[1] 3.90933223 0.03094193

	[[3]]
	[1] 5.307777 8.944883 1.933448

	[[4]]
	[1] 2.6599025 0.5341006 8.7176168 3.2705339

lapply() and friends make heavy use of anonymous functions.

	> x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
	> x
	$a
	     [,1] [,2]
	[1,]    1    3
	[2,]    2    4

	$b
	     [,1] [,2]
	[1,]    1    4
	[2,]    2    5
	[3,]    3    6

An anonymous function for extracting the first column of each matrix:

	> lapply(x, function(elt) elt[,1])
	$a
	[1] 1 2

	$b
	[1] 1 2 3

sapply()
--------

sapply() will try to simplify the result of lapply if possible

* If the result is a list where every element is length 1, then a vector is returned
* IF the result i a list where every element is a vector of the same length (> 1), a matrix is returned
* If it can't figure things out, a list is returned

Here's the lapply() behavior again:

	> x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
	> lapply(x, mean)
	$a
	[1] 2.5

	$b
	[1] -0.21178

	$c
	[1] 1.073342

	$d
	[1] 5.050767

	> sapply(x, mean)
	        a         b         c         d 
 	2.500000 -0.211780  1.073342  5.050767
 
 