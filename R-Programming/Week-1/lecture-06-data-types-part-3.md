Data Types - Part 3
===================

Factors
-------

Factors are used to represent categorical data. Factors can be unordered or ordered. one can think of a factor as an integer vector where each integer has a label.

* Factors are treated specially by R modeling functions like lm() and glm()
* Using factors with labels is better than using integers because factors are self-describing; having a variable that has values "Male" and "Female" is better than a variable that has values 1 and 2

Examples:

	> x <- factor(c("yes", "yes", "no", "yes", "no"))
	> x
	[1] yes yes no yes no
	Levels: no yes
	> table(x)
	x
	no yes
	 2   3
	> unclass(x)
	[1] 2 2 1 2 1
	attr(, "levels")
	[1] "no "yes"

The order of the levels can be set using the levels argument to factor(). This can be important in linear modeling because the first level is used as the baseline level.

	> x <- factor(c("yes", "yes", "no", "yes", "no"),
			levels = c("yes", "no"))
	> x
	[1] yes yes no yes no
	Levels: yes no

Missing values
--------------

Missing values are denoted by NA or NAN for undefined mathematical operations.

* is.na() is used to test if they are NA (missing values)
* is.nan() is used to test for NaN (not a number)
* NA values have  a class also, so there are integer NA and character NA etc
* a NaN value is also NA but the converse is not true

Examples:

	> x <- c(1, 2, NA, 10, 3)
	> is.na(x)
	[1] FALSE FALSE TRUE FALSE FALSE
	> is.nan(x)
	[1] FALSE FALSE FALSE FALSE FALSE
	> x <- c(1, 2, NaN, NA, 4)
	is.na(x)
	[1] FALSE FALSE TRUE TRUE FALSE
	> is.nan(x)
	[1] FALSE FALSE TRUE FALSE FALSE

Data Frame
----------

Data frames are used to store tabular data.

* They are represented as a special type of list where every element of the list has to have the same length
* Each element of the list can be thought of as a column and the length of each element of the list is the number of rows
* Unlike matrices, data frames can store different classes of objects in each column (just like lists); matrices must have every element be the same class
* Data frames also have a special attributes called row.names
* Data frames are usually created by calling read.table() or read.csv()
* Can be converted to a matrix by calling data.matrix()

Examples:

	> x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
	> x
	  foo   bar
	1   1  TRUE
	2   2  TRUE
	3   3 FALSE
	4   4 FALSE
	> nrow(x)
	[1] 4
	> ncol(x)
	[1] 2

Names
-----

R objects can also have names, which is very useful for writing readable code and self-describing objects.

	> x <- 1:3
	> names(x)
	NULL
	> names(x) <- c("foo", "bar", "norf")
	> x
	foo bar norf
	  1   2    3
	> names(x)
	[1] "foo" "bar" "norf"

Lists can also have names

	> x <- list(a = 1, b = 2, c = 3)
	> x
	$a
	[1] 1
	
	$b
	[1] 2
	
	$c
	[1] 3

And matrices:

	> m <- matrix(1:4, nrow = 2, ncol = 2)
	> dimnames(m) <- list(c("a", "b"), c("c", "d"))
	> m
	  c d
	a 1 3
	b 2 4

Summary
-------

* atomic classes: numeric, logical, character, integer, complex
* vectors, lists
* factors
* missing values
* data frames
* names