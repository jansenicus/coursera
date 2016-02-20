split()
=======

split takes a vector or other objects and splits it into groups determined by a factor or a list of factors.

	> str(split)
	function (x, f, drop = FALSE, …)

Arguments:

* x is a vector (or list) or data frame
* f is a factor (or coerced to one) or a list of factors
* drop indicates whether empty factor levels should be dropped

Example:

	> x <- c(rnorm(10), runif(10), rnorm(10, 1))
	> f <- gl(3, 10)
	> split(x, f)
	$`1`
	 [1] -0.5615980 -1.0227400  2.3743946 -1.1828731
	 [5] -0.4588891  1.3406054 -1.2529312 -1.5232924
	 [9] -0.9483891  0.5974399

	$`2`
	 [1] 0.28819663 0.24568527 0.08535357 0.64725198
	 [5] 0.55680796 0.99364603 0.25011440 0.90709685
	 [9] 0.20941979 0.63402239

	$`3`
	 [1]  0.6468613 -0.3783117 -0.8270978  0.3052268
	 [5]  0.9999587  1.0533331  2.4046919  1.3490653
	 [9]  0.6020979  1.3048118

A common idiom is split() followed by an lapply()

	> lapply(split(x, f), mean)
	$`1`
	[1] -0.2638273

	$`2`
	[1] 0.4817595

	$`3`
	[1] 0.7460637


Splitting a Data Frame
----------------------

	> library(datasets)
	> head(airquality)
	  Ozone Solar.R Wind Temp Month Day
	1    41     190  7.4   67     5   1
	2    36     118  8.0   72     5   2
	3    12     149 12.6   74     5   3
	4    18     313 11.5   62     5   4
	5    NA      NA 14.3   56     5   5
	6    28      NA 14.9   66     5   6

	> s <- split(airquality, airquality$Month)
	> lapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
	$`5`
	   Ozone  Solar.R     Wind 
	      NA       NA 11.62258 

	$`6`
	    Ozone   Solar.R      Wind 
	       NA 190.16667  10.26667 

	$`7`
	     Ozone    Solar.R       Wind 
	        NA 216.483871   8.941935 

	$`8`
	   Ozone  Solar.R     Wind 
	      NA       NA 8.793548 

	$`9`
	   Ozone  Solar.R     Wind 
	      NA 167.4333  10.1800

You can also use sapply() here.

	> sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")]))
	               5         6          7        8        9
	Ozone         NA        NA         NA       NA       NA
	Solar.R       NA 190.16667 216.483871       NA 167.4333
	Wind    11.62258  10.26667   8.941935 8.793548  10.1800

Remove NAs

	> sapply(s, function(x) colMeans(x[, c("Ozone", "Solar.R", "Wind")], na.rm  = TRUE))
	                5         6          7          8         9
	Ozone    23.61538  29.44444  59.115385  59.961538  31.44828
	Solar.R 181.29630 190.16667 216.483871 171.857143 167.43333
	Wind     11.62258  10.26667   8.941935   8.793548  10.18000


Splitting on More than One Level
--------------------------------

	> x <- rnorm(10)
	> f1 <- gl(2, 5)
	> f2 <- gl(5, 2)
	> f1
	 [1] 1 1 1 1 1 2 2 2 2 2
	Levels: 1 2
	> f2
	 [1] 1 1 2 2 3 3 4 4 5 5
	Levels: 1 2 3 4 5
	> interaction(f1, f2)
	 [1] 1.1 1.1 1.2 1.2 1.3 2.3 2.4 2.4 2.5 2.5
	Levels: 1.1 2.1 1.2 2.2 1.3 2.3 1.4 2.4 1.5 2.5

Interactions can create empty levels.

	> str(split(x, list(f1, f2)))
	List of 10
	 $ 1.1: num [1:2] 1.829 -0.808
	 $ 2.1: num(0) 
	 $ 1.2: num [1:2] -1.329 0.544
	 $ 2.2: num(0) 
	 $ 1.3: num 0.477
	 $ 2.3: num -0.108
	 $ 1.4: num(0) 
	 $ 2.4: num [1:2] -0.44 0.394
	 $ 1.5: num(0) 
	 $ 2.5: num [1:2] 1.333 -0.414

Use drop = TRUE to get rid of empty levels.

	> str(split(x, list(f1, f2), drop = TRUE))
	List of 6
	 $ 1.1: num [1:2] 1.829 -0.808
	 $ 1.2: num [1:2] -1.329 0.544
	 $ 1.3: num 0.477
	 $ 2.3: num -0.108
	 $ 2.4: num [1:2] -0.44 0.394
	 $ 2.5: num [1:2] 1.333 -0.414