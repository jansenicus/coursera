Subsetting - Part 1
===================

Subsetting
----------

* [ always returns an object of the same class as the original; can be used to select more than one element (there is one exception)
* [[ is used to extract elements of a list of data frame; it can only be used to extract a single element and the class of the returned object will not necessarily be a list or data frame
* $ is used to extract elements of a list or data frame by name; semantics are similar to that of [[

Examples:

	> x<- c("a", "b", "c", "c", "d", "a")
	> x[1]
	[1] "a"
	> x[2]
	[1] "b"
	> x[1:4]
	[1] "a" "b" "c" "c"
	> u <- x > "a"
	> u
	[1] FALSE TRUE TRUE TRUE TRUE FALSE
	> x[u]
	[1] "b" "c" "c" "d"

	
Subsetting a Matrix
-------------------

Matrices can be subsetted in the usual way with (i,j) type indices.

	> x <- matrix(1:6, 2, 3)
	> x[1, 2]
	[1] 3
	> x[2, 1]
	[1] 2

Indices can also be missing.

	> x[1, ]
	[1] 1 3 5
	> x[ ,2]
	[1] 3, 4

By default when a single element is retrieved, it is returned as a vector of length 1 rather than a 1 x 1 matrix. This behavior can be turned off by setting drop = FALSE.

	> x <- matrix(1:6, 2, 3)
	> x[1, 2]
	[1] 3
	> x[1, 2, drop = FALSE]
	     [,1]
	[1,]    3

Similarly, subsetting a single column or a single row will give you a vector, not a matrix (by default)

	> x <- matrix(1:6, 2, 3)
	> x[1, ]
	[1] 1 3 5
	> x[1, , drop = FALSE]
	     [,1] [,2] [,3]
	[1,]    1    3    5