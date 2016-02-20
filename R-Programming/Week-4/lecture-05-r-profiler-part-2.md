R Profiler - Part 2
===================

Rprof()
-------

* The  Rprof() function starts the profiler in R
	* R must be compiled with profiler support (but this is usually the case)
* The summaryRprof() function summarizes the output from Rprof() (otherwise it's not readable)
* NO NOT use system.time() and Rprof() together or you will be sad
* Rprof() keeps track of the function call stack at regularly sampled intervals and tabulates how much time is spent in each function
* Default sampling interval is 0.02 seconds
* NOTE: If your code runs very quickly, the profiler is not useful, but then you probably don't need it in that case


Using summaryRprof()
--------------------

* The summaryRprof() function tabulates the R profiler output and calculates how much time is spent in which function
* There are two methods for normalizing the data
* "by.total" divides the time spent in each function by the total run time
* "by.self" does the same but first subtracts out time spent in functions above in the call stack


summaryRprof() Output
---------------------

	$sample.interval
	[1] 0.02
	
	$sampling.time
	[1] 7.41


Summary
-------

* Rprof() runs the profiler for performance analysis of R code
* summaryRprof() summarizes the output of Rprof() and gives percent of time spent in each function (with two types of normalization)
* Good to break your code into functions so that the profiler can give useful information about where time is being spent
* C or Fortran code is not profiled

