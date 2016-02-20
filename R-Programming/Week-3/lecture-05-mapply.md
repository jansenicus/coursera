mapply()
========

mapply() is a multivariate apply of sorts which applies a function in parallel over a set of arguments.

	> str(mapply)
	function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE,
	          USE.NAMES = TRUE)

Arguments:

* FUN is a function to apply
* … contains arguments to apply over
* MoreArgs is a list of other arguments to FUN
* SIMPLIFY indicates whether the result should be simplified

The following is tedious to type:

	list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))

Instead we can do:

	> mapply(rep, 1:4, 4:1)
	[[1]]
	[1] 1 1 1 1

	[[2]]
	[1] 2 2 2

	[[3]]
	[1] 3 3

	[[4]]
	[1] 4


Vectorizing a function
----------------------

Define a custom function:

	> noise <- function(n, mean, sd) {
	+ rnorm(n, mean, sd)
	+ }
	> noise(5, 1, 2)
	[1] 1.9218170  1.3781843 -0.5607748  3.7576328
	[5] 0.2590522
	> noise(1:5, 1:5, 2)
	[1] 1.780955 1.813852 1.827005 1.144564
	[5] 1.842238

Passing lists to this function does not behave as expected.

	> mapply(noise, 1:5, 1:5, 2)
	[[1]]
	[1] 2.2496

	[[2]]
	[1] 3.003979 3.621779

	[[3]]
	[1] 2.304840 4.135399 3.633926

	[[4]]
	[1] 1.269779 4.212011 2.963119 4.499524

	[[5]]
	[1] 5.353751 8.353743 6.389625 1.016071 3.344346

Which is the same as:

	> list(noise(1, 1, 2), noise(2, 2, 2),
	       noise(3, 3, 2), noise(4, 4, 2),
	       noise(5, 5, 2))