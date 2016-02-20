Reading and Writing Data - Part 1
=================================

Reading Data
------------

There are a few principle functions for reading data into R.

* read.table and read.csv for reading tabular data
* readLines, for reading lines of a text file
* source for reading in R code files (inverse of dump)
* dget, for reading in R code files (inverse of dput)
* load, for reading in saved workspaces
* unserialize, for reading single R objects in binary form


Writing data
------------

Writing functions analogous to the reading ones:

* write.table
* writeLines
* dump
* dput
* save
* serialize


Reading Data Files with read.table
----------------------------------

The read.table function is one of the most commonly used functions for reading data. It has a few important arguments:

* file, the name of a file or a connection
* header, logical indicating if the file has a header line
* sep, a string indicating how the columns are separated
* colClasses, a character vector indicating the class of each column in the dataset
* nrows, the number of rows in the dataset
* comment.char, a character string indicating the comment character
* skip, the number of lines to skip from the beginning
* stringsAsFactors, should character variables be coded as factors


Reading in Larger Datasets with read.table
------------------------------------------

With much larger datasets, doing the following things will make your life easier and will prevent R from choking.

* Read the help page for read.table, which contains many hints
* Make a rough calculation of the memory required to store your datasets. If the dataset is larger than the amount of RAM on your computer, you can probably stop right here.
* Set comment.char = "" if there are no commented lines in your file


Reading in Larger Datasets with read.table
------------------------------------------

* Use the colClasses argument. It can make read.table up to twice as fast since it doesn't have to guess what datatypes to make your fields.
* Set nrows. This doesn't make R run faster but it helps with memory usage. A mild overestimate is okay. You can use the Unix tool wc to calculate the number of lines in a file.


Know thy system
---------------

In general, when using R with larger datasets, it's useful to know a few things about your system.

* How much memory is available?
* What other applications are in use?
* Are there other users logged into the same system?
* What operating system?
* Is the OS 32 or 64 bit?


Calculating Memory Requirements
-------------------------------

I have a data frame with 1,500,000 rows and 120 columns, all of which are numeric data. Roughly, how much memory is required to store this data frame?

1,500,000 x 8 bits/numeric

= 1440000000 bytes
= 1440000000 / 220 bytes/MB
= 1,373.29MB
= 1.34 GB

You will need roughly double the memory to read data into R because of the overhead.