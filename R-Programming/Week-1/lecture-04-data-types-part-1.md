Data Types - Part 1
===================

Objects
-------

* Character
* Numeric
* Integer
* Complex
* Logical (true/false)

The most basic object is a vector:

* A vector can only contain objects of the same class
* The one exception is a list

Empty vectors can be created with the vector() function.

Numbers
-------

* Numbers in R are generally treated as numeric objects (i.e. double precision real numbers)
* If you explicitly want an integer you need to specify the L suffix
* There is a special number called Inf which represents infinity
* The value NaN represents an undefined value

Attributes
----------

R objects can have attributes

* names, dimnames
* dimensions (e.g. matrices, arrays)
* class
* length
* other user-defined attributes/metadata

Attributes of an object can be access using the attributes() function.

Entering input
--------------

At the R prompt we type expressions. The <- symbol is the assignment operator.

	> x <- 1
	> print(x)
	[1] 1
	> x
	[1]1
	> msg <- "hello"

The [1] indicates that x is a vector.

The grammar of the language determines wether an expression is complete or not.

	> x <- ## incomplete expression

The # comment begins a comment.

Printing
--------

	> x <- 1:5
	[1] 1 2 3 4 5

The : operator is used to create integer sequences.