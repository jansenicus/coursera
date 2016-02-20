Debugging - Part 3
==================

traceback()
-----------

	> mean(x)
	Error in mean(x) : object 'x' not found
	> traceback()
	1: mean(x)
	>

Example:

	> lm(y - x)
	Error in eval(expr, envir, enclos) : object 'y' not found
	> traceback()
	7: eval(expr, envir, enclos)
	6: eval(prevars, data, env)
	5: model.frame.default(formula = y - x, drop.unused.levels = TRUE)
	4: model.frame(formula = y - x, drop.unused.levels = TRUE)
	3: eval(expr, envir, enclos)
	2: eval(mf, parent.frame())
	1: lm(y - x)


debug()
-------

	> debug(lm)
	> lm(y - x)
	debugging in: lm(y - x)
	debug: {
	    ret.x <- x
	    ret.y <- y
	    cl <- match.call()
	…
	    if (!qr) 
	        z$qr <- NULL
	    z
	}
	Browse[2]> n
	debug: ret.x <- x
	Browse[2]> n
	debug: ret.y <- y
	Browse[2]> n
	debug: cl <- match.call()
	Browse[2]> n
	debug: mf <- match.call(expand.dots = FALSE)
	Browse[2]> n
	debug: m <- match(c("formula", "data", "subset", "weights", "na.action", 
	    "offset"), names(mf), 0L)


recover()
---------

	> options(error = recover)
	> read.csv('nosuchfile')
	Error in file(file, "rt") : cannot open the connection
	In addition: Warning message:
	In file(file, "rt") :
	  cannot open file 'nosuchfile': No such file or directory
	
	Enter a frame number, or 0 to exit   
	
	1: read.csv("nosuchfile")
	2: read.table(file = file, header = header, sep = sep, quote = quote, dec = dec, fil
	3: file(file, "rt")
	
	Selection: 


Summary
-------

* There are three main indications of a problem/condition: message, warning, error
	* Only an error is fatal
* When analyzing a function with a problem, make sure you can reproduce the problem. clearly state your expectations and how the output differs from your expectation
* Interactive debugging tools traceback, debug, browser, trace, and recover can be used to find problematic code in functions
* Debugging tools are not a substitute for thinking!