Debugging - Part 2
==================

The primary tools for debugging functions in R are:

* traceback
	* Prints out the function call stack after an error occurs
	* Does nothing if there's no error
* debug: Flags a function for debug mode which allows you to step through execution of a function in debug mode
* browser
	* Suspends the execution of a function wherever it is called and puts the function in debug mode
* trace: allows you to insert debugging code into a function in specific places
* recover: allows you to modify the error behavior so that you can browse the function call stack

These are interactive tools specifically designed to allow you to pick through a function. There's also the more blunt technique of inserting print/cat statements in the function.