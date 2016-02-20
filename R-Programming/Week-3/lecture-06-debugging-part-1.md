Debugging - Part 1
==================

Indications that something is not right.

* message
	* A generic notification/diagnostic message produced by the message function
	* Execution of the function continues
* warning
	* An indication that something is wrong but not necessarily fatal
	* Execution of the function continues
	* Generation by the warning function
* error
	* An indication that a fatal problem has occurred
	* Execution stops
	* Produced by the stop function
* condition
	* A generic concept for indicating that something unexpected can occur
	* Programmers can create their own conditions

Warnings:

	> log(-1)
	[1] NaN
	Warning message:
	In log(-1) : NaNs produced

Example:

	> printmessage <- function(x) {
	+ 	if(x > 0)
	+ 		print("x is greater than zero")
	+ 	else
	+ 		print("x is less than or equal to zero")
	+ 	invisible(x)
	+ }

	> printmessage(1)
	[1] "x is greater than zero"

	> printmessage(NA)
	Error in if (x > 0) print("x is greater than zero") else print("x is less than or equal to zero") : missing value where TRUE/FALSE needed

Another example:

	> printmessage2 <- function(x) {
	+ 	if(is.na(x))
	+ 		print("x is a missing value!")
	+ 	else if(x > 0)
	+ 		print("x is greater than zero")
	+ 	else
	+ 		print("x is less than or equal to zero")
	+ 	invisible(x)
	+ }
	> x <- log(-1)
	Warning message:
	In log(-1) : NaNs produced
	> printmessage2(x)
	[1] "x is a missing value!"

How do you know that something is wrong with your function?

* What was you input? How did you call the function?
* What were you expecting? Output, message, other results?
* What did you get?
* How does what you get differ from what you were expecting?
* Were your expectations correct in the first place?
* Can you reproduce the problem (exactly)?

