Simulation - Part 2
===================

Generating Random Numbers from a Linear Model
---------------------------------------------

Suppose we want to simulate from the following linear model

	> set.seed(20)
	> x <- rnorm(100)
	> e <- rnorm(100, 0, 2)
	> y <- 0.5 + 2 * x + e
	> summary(y)
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	-6.4080 -1.5400  0.6789  0.6893  2.9300  6.5050 
	> plot(x, y)


![Random Distribution](img/lecture-03-random-distribution.png?raw=true)

What if x is binary?

	> set.seed(10)
	> x <- rbinom(100, 1, 0.5)
	> e <- rnorm(100, 0, 2)
	> y <- 0.5 + 2 * x + e
	> summary(y)
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	-3.4940 -0.1409  1.5770  1.4320  2.8400  6.9410 
	> plot(x, y)

![Binomial Distribution](img/lecture-03-binomial-distribution.png?raw=true)

Suppose we want to simulate from a Poisson model

	> set.seed(1)
	> x <- rnorm(100)
	> log.mu <- 0.5 + 0.3 * x
	> y <- rpois(100, exp(log.mu))
	> summary(y)
	   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
	   0.00    1.00    1.00    1.55    2.00    6.00 
	> plot(x, y)

![Poisson Distribution](img/lecture-03-poisson-distribution.png?raw=true)

Random Sampling
---------------

The sample function draws randomly from a specified set of (scalar) objects allowing you to sample from arbitrary distributions.

	> set.seed(1)
	> sample(1:10, 4)
	[1] 3 4 5 7
	> sample(1:10, 4)
	[1] 3 9 8 5
	> sample(letters, 5)
	[1] "q" "b" "e" "x" "p"
	> sample(1:10)
	 [1]  4  7 10  6  9  2  8  3  1  5
	> sample(1:10)
	 [1]  2  3  4  1  9  5 10  8  6  7
	> sample(1:10, replace = TRUE)
	 [1] 2 9 7 8 2 8 5 9 7 8


Summary
-------

* Drawing samples from specific probability distributions can be done with r* functions
* Standard distributions are built in: Normal, Poisson, Binomial, Exponential, Gamma, etc.
* The sample() function can be used to draw random samples from arbitrary vectors
* Setting the random number generator seed via set.seed() is critical for reproducibility