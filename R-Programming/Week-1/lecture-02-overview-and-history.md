Overview and History of R
=======================

R is the dialect of the S language

What is S?
----------

* S is a language that was developed by John Chambers and others at Bell labs
* It was rewritten in C in 1988
* S has transferred from Bell (now Lucent) to StatSci (then insightful Corp) to TIBCO
* The fundamentals of S have not changed since 1998

S Philosophy
------------

Enter the language as an interactive environment. Then as their needs became clearer they could slide gradually into programming.

Back to R
---------

* 2000 version 1.0.0 is released
* 2013 v.3.0.2 is release in December

Features of R
-------------

* Syntax is similar to S
* Semantics are superficially to S but are actually different
* Runs on almost any standard computing platform/OS (even PLayStation 3)
* Frequent releases (annual + bugfix releases); active development
* Core is quite lean, functionality is divided into modular packages
* Graphic capabilities very sophisticated
* Useful for interactive work, but contains a powerful programming language for developing tools
* Very active user community
* It's free!

Free Software
-------------

* The freedom to run the program
* Freedom to study how it works and adapt to your needs
* Freedom to redistribute copies
* Freedom to improve and release improvements to the public

Drawbacks of R
--------------

* Essentially based on 40-year old technology
* Little built-in support for dynamic or 3D graphics
* Functionality is based on consumer demand
* Objects must be generally stored in your physically memory
* Not ideal for all possible situations

Design of the R System
----------------------

The R system is divided into 2 conceptual parts:

1. The "base" R system that you download from CRAN
2. Everything else

R functionality is divided into a number of packages:

* The "base" package required to run R
* Other bundled packages include: stats, datasets, graphics, grid, methods, tools, parallel, splines, etc
* "Recommended" packages include: boot, class, cluster, lattice, survival, spatial, Matrix
* 4000 contrib packages on CRAN

Some R Resources
----------------

Available from [CRAN](http://cran.r-project.org):

* An introduction to R
* Writing R extensions
* R data import/export
* R installation and admin (mostly for building R from source)
* R internals (not for the faint of heart)