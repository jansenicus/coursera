apply()
=======

apply() is used to evaluate a function (often an anonymous one) over the margins of an array

* It is most often used to apply a function to the rows or columns of a matrix
* It can be used with general array _e.g._ taking the average of an array of matrices
* It is not only faster than writing a loop, but it works in one line!

Example:

	> str(apply)
	function (X, MARGIN, …)

Arguments:

* X is an array
* MARGIN is an integer vector indicating which margins should be "retained"
* FUN is a function to be applied
* … is for other arguments to be passed to FUN

Example:

	> x <- matrix(rnorm(200), 20, 10)
	> apply(x, 2, mean)
	 [1]  -0.24271338 -0.09769539 -0.26258277
     [4]  -0.38282262  0.36272239 -0.23001762
	 [7]  -0.30442240  0.18822820  0.23424057
	 [10] -0.35909576
	
	> apply(x, 1, sum)
	 [1]  -0.409985811 -3.268890256 -3.728752232
	 [4]   0.436631813 -0.455544538 -6.780291602
     [7]  -2.008526814  2.271598286 -0.001329909
	 [10] -0.772003961  2.252825741  0.326282318
     [13] -4.396864141 -3.975331909 -3.523458630
     [16]  1.877565192  2.122820628 -4.235880427
     [19] -1.915425553  4.301386289


Col/row sums and means
----------------------

For sums and means of matrix dimensions, we have some shortcuts.

* rowSums = apply(x, 1, sum)
* rowMeans = apply(x, 1, mean)
* colMeans = apply(x, 2, sum)
* colMeans = apply(x, 2, mean)

The shortcut functions are _much_ faster, but you won't notice unless you're using a large matrix.


Other ways to apply
-------------------

Quantiles of the rows of a matrix.

	> x <- matrix(rnorm(200), 20, 10)
	> apply(x, 1, quantile, probs = c(0.25, 0.75))
	            [,1]       [,2]       [,3]       [,4]
	25% -1.463023845 -0.2932014 -0.4127894 -0.8502298
	75% -0.006850471  0.7238166  0.7484396  0.3859197
	          [,5]       [,6]       [,7]       [,8]
	25% -0.2544152 -0.5906017 -0.1367046 -0.8027295
	75%  0.6316449  0.3365734  0.4772425  0.6892627
	          [,9]      [,10]      [,11]     [,12]
	25% -0.3477938 -0.7819127 -1.5651389 -1.300000
	75%  1.2975913  0.6874982  0.2340079  1.030404
	          [,13]      [,14]      [,15]      [,16]
	25% -0.09854616 -0.6715086 -0.9392777 -0.2083622
	75%  1.02289904  0.4008069  0.7483483  0.8404269
	         [,17]      [,18]      [,19]      [,20]
	25% -0.6191729 -0.7834631 -1.1424522 -0.3559212
	75%  0.9909588  0.8844815  0.7276243  0.7105771

Average matrix in an array

	> a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
	> apply(a, c(1, 2), mean)
	            [,1]       [,2]
	[1,]  0.04107431 0.64450175
	[2,] -0.04269955 0.07289623
	> rowMeans(a, dims = 2)
	            [,1]       [,2]
	[1,]  0.04107431 0.64450175
	[2,] -0.04269955 0.07289623