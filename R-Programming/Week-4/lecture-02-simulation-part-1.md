Simulation - Part 1
===================

Generating Random Numbers
-------------------------

Functions for probabilty distributions in R.

* rnorm(): generate random Normal variates with a given mean and standard deviation
* dnorm(): evaluate the Normal probability density (with a given mean/SD) at a point (or vector of points)
* pnorm(): evaluate the cumulative distribution function for a Normal distribution
* rpois(): generate random Poisson variates with a given rate

Probability distribution functions usually have foud functions associated with them. The functions are prefixed with a…

* d for density
* r for random number generation
* p for cumulative districbution
* q for quantile function

Working with the Normal distribution requires using these foud functions

	dnorm(x, mean = 0, sd = 1, log = FALSE)
	pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
	qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, loq.p = FALSE)
	rnorm(n, mean = 0, sd = 1)

If phi is the cumulative distribution function for a standard Normal distribution, then pnorm(q) = phi(q) and qnorm = (phi^-1) * p.

	> x <- rnorm(10)
	> x
	 [1]  0.14830698 -0.27440203 -0.40556516  0.50068503 -0.95326642 -0.63328362
	 [7] -0.81992345 -0.09771788  1.51245542 -0.15558700
	> x <- rnorm(10, 20, 2)
	> x
	 [1] 20.11975 19.63171 19.52337 17.29754 21.20785 21.60996 22.59994 22.64028
	 [9] 22.38124 19.43176
	> summary(x)
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	  17.30   19.55   20.66   20.64   22.19   22.64

Setting the random number seed with set.seed ensures reproducibility.

	> set.seed(1)
	> rnorm(5)
	[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078
	> rnorm(5)
	[1] -0.8204684  0.4874291  0.7383247  0.5757814 -0.3053884
	> set.seed(1)
	> rnorm(5)
	[1] -0.6264538  0.1836433 -0.8356286  1.5952808  0.3295078

Always set the random number seed when conducting a simulation!

Generate Posson data:

	> rpois(10, 1)
	 [1] 0 0 1 1 2 1 1 4 1 2
	> rpois(10, 2)
	 [1] 4 1 2 0 1 1 0 1 4 1
	> rpois(10, 20)
	 [1] 19 19 24 23 22 24 23 20 11 22
	> ppois(2, 2)
	[1] 0.6766764
	> ppois(4, 2)
	[1] 0.947347
	> ppois(6, 2)
	[1] 0.9954662