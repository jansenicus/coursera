Subsetting - Part 2
===================

Subsetting Lists
----------------

	> x <- list(foo = 1:4, bar = 0.6)
	> x[1]
	$foo
	[1] 1 2 3 4
	
	> x[[1]]
	[1] 1 2 3 4
	> x$bar
	[1] 0.6
	> x[["bar"]]
	[1] 0.6
	> x["bar"]
	$bar
	[1] 0.6

Another example:

	> x <-list(foo = 1:4, bar = 0.6, baz = "hello")
	> x[c(1, 3)]
	$foo
	[1] 1 2 3 4
	
	$baz
	[1] "hello"

The [[ operator can be used with computed indices; $ can only be used with literal names.

	> x <- list(foo = 1:4, bar = 0.6, baz = "hello")
	> name <- "foo"
	> x[[name]] # computed index for 'foo'
	[1] 1 2 3 4
	> x$name # element 'name' doesn't exist
	NULL
	> x$foo
	[1] 1 2 3 4


Subsetting Nested Elements of a List
------------------------------------

The [[ can take an integer sequence.

	> x <-list(a = list(10, 12, 14), b = c(3.14, 2.81))
	> x[[c(1, 3)]]
	[1] 14
	> x[[1]][[3]]
	[1] 14
	
	> x x[[c(2, 1)]]
	[1] 3.14


Partial Matching
----------------

Partial matching of names is allowed with [[ and $

	> x <- list(aardvark = 1.5)
	> x$a
	[1] 1 2 3 4 5
	> x [["a"]]
	NULL
	> x[["a"]], exact = FALSE]]
	[1] 1 2 3 4 5


Removing NA values
------------------

A common task is to remove missing values (NAs).

	> x <- c(1, 2, NA, 4, NA, 5)
	> bad <- is.na(x)
	> x[!bad]
	[1] 1 2 4 5

What are there multiple things and you want to take the subset with no missing values?

	> x <- c(1, 2, NA, 4, NA, 5)
	> y <- c("a", "b", NA, "d", NA, "f")
	> good <- complete.cases(x, y)
	> good
	[1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE
	> x[good]
	[1] 1 2 4 5
	> y[good]
	[1] "a" "b" "d" "f"


You can use the complete.cases() function on data frames.

	> hw1 = read.csv('hw1_data.csv')
	> good <- complete.cases(hw1)
	> hw1[good,]

