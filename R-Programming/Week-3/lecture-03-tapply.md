tapply()
--------

tapply() is used to apply a function over subsets of a vector. I don't know why it's called tapply().

	> str(tapply)
	function (X, INDEX, FUN = NULL, ..., simplify = TRUE)

Arguments:

* X is a vector
* INDEX is a factor or list of factors (or else they are coerced to factors)
* FUN is a function to be applied
* … contains other arguments to be passed to FUN
* simplify, should we simplify the result?

Take group means.

	> x <- c(rnorm(10), runif(10), rnorm(10, 1))
	> f <- gl(3, 10)
	> f
	 [1] 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3
	Levels: 1 2 3
	> tapply(x, f, mean)
	        1         2         3 
	0.4102277 0.6013687 0.7498127

Take group means without simplification.

	> tapply(x, f, mean, simplify = FALSE)
	$`1`
	[1] 0.4102277
	
	$`2`
	[1] 0.6013687
	
	$`3`
	[1] 0.7498127

Find group ranges.

	> tapply(x, f, range)
	$`1`
	[1] -2.378255  2.673336

	$`2`
	[1] 0.1150650 0.9278384

	$`3`
	[1] -0.2201542  1.5680852

