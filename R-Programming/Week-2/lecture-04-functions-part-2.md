Functions - Part 2
==================

Defining a Function
-------------------

In addition to not specifying a default value, you can also set an argument to NUKK.

	f <- function(a, b = 1, c = 2, d = NULL) {
		
	}

Lazy Evaluation
---------------

Arguments to functions are evaluated lazily, so they are evaluated only as needed.

	f <- function(a, b) {
		a^2
	}
	f(2)

	## [1] 4

This function never actually uses the argument b, so calling f(2) will not produce and error because the 2 gets positionally matched to a.

	
	f <- function(a, b) {
		print(a)
		print(b)
	}
	f(45)

	## [1] 45
	
	## Error: argument "b" is missing, with no default

Notice that "45" got printed first before the error was triggered. This is because b did not have to be evaluated until after print(a). Once the function tried to evaluate print(b) it had to throw an error.

The '…' Argument
----------------

The … argument indicate a variable number of arguments that are usually passed on to other functions.

… is often used when extending another function and you don't want to copy the entire argument list of the original function

	myplot <- function(x, y, type = "l", …) {
		plot(x, y, type = type, …)
	}

Generic functions use … so that extra arguments can be passed to methods (more on this later).

	> mean
	function(x, …)
	UseMethod("mean")

The … is also necessary when the number of arguments passed to the function cannot be known in advance.

	> args(paste)
	function(…, sep = " ", collapse = NULL)
	
	> args(cat)
	function(…, file = "", sep = " " , fill = FALSE,
		labels = NULL, append = FALSE)

one catch with … is that any arguments that appear after … on the argument list must be named explicitly and cannot be partially matched.

	> args(paste)
	function(…, sep=" ", collapse = NULL)
	
	> paste("a", "b", sep = ":")
	[1] "a:b"
	
	> paste("a", "b", se = ":")
	[1] "a b :"

