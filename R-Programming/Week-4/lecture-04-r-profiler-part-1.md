R Profiler
==========

Why is my code so slow?
-----------------------

* Profiling is a systematic way to examine how much time is being spent in different parts of a program
* Useful when trying to optimize your code
* Often code runs fine once, but what if you have to put it in a loop for 1,000 iterations? Is it still fast enough?
* Profiling is better than guessing


On Optimizing your Code
-----------------------
The first rule is "Don't do it". That is, don't think about optimizing your code as you write it.

* Getting biggest impact on speeding up code depends on knowing where the code spends most of its time
* This cannot be done without performance analysis or profiling

> We should forget about small efficiencies, say about 97% of the time: premature optimization is the root of all evil. &mdash;Donald Knuth


General Principles of Optimization
----------------------------------

* Design first, then optimize
* Remember: Premature optimization is the root of all evil
* Measure (collect data), don't guess
* If you're going to be a scientist, you need to apply the same principles here!


Using system.time()
-------------------

* Takes an arbitrary R expression as input (can be wrapped in curly braces) and returns the amount of time taken to evaluate the expression
* Compute the time (in seconds) needed to execute an expression
	* If there's an error, gives time until the error occurred
* Returns an object of class proc_time
	* __user time__: time charged to the CPU(s) for this expression
	* __elapsed time__: "wall clock" time
* Usually the user time and elapsed time are relatively close fro straight computing tasks
* Elapsed time may be greater than user time if the CPU spends a lot of time waiting around
* Elapsed time may be smaller than the user time if your machine has multiple cores/processors (and is capable of using them)
	* Multi-threaded BLAS libraries (vecLib/Accelerate, ATLAS, ACML, MKL)
	* Parallel processing via the __parallel__ package

Example:

	> system.time(readLines("http://www.jhsph.edu"))
	   user  system elapsed 
	  0.008   0.007   1.635 
	> hilbert <- function(n) {
	+     i <- 1:n
	+     1 / outer(i - 1, i, "+")
	+ }
	> x <- hilbert(1000)
	> system.time(svd(x))
	   user  system elapsed 
	  3.240   0.017   3.272


Timing Longer Expression
------------------------

	> system.time({
	+     n <- 1000
	+     r <- numeric(n)
	+     for (i in 1:n) {
	+         x <- rnorm(n)
	+         r[i] <- mean(x)
	+     }
	+ })
	   user  system elapsed 
	  0.098   0.003   0.101


Beyond system.time()
--------------------

* Using system.time() allows you to test certain functions or code blocks to see if they are taking excessive amounts of time
* Assumes you already know where the problem is and can call system.time() on it
* What if you don't know where to start?