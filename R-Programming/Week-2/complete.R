#!/usr/bin/Rscript
#--------------------------------
# Jansen A. Simanullang, 20.02.2016
# complete.R
# example usage:
#> setwd("[this source code directory path]")
#> source("complete.R")
#> complete("specdata", c(6, 10, 20, 34, 100, 200, 310))
#> complete("specdata", 54)
#> complete("specdata", 332:1)
#--------------------------------

complete <- function(directory, id = 1:332) {
  
  # 'complete'
  # computes the number of observations with complete result, with no 'NA' values
  # as a function of 'directory', 'pollutant' and 'id'
  # 'directory' is location of the CSV files
  # 'id' is the id of each file
  #---------------------------------------------------------
  # 1. list all the files inside directory
  
  csv_files <- list.files(directory, full.names = TRUE)
  
  # 2. initialize the data frame 'z' with 0 columns and 0 rows

  z <- data.frame()

  # 3. loop for each file id
  # 3.1 Read the file
  # 3.2 count the number of complete cases 'nobs',
  # 3.3 make a new dataframe 'y' to show the number of observations
  # 3.4 bind it to our data frame 'z'
  
  for (i in id) {
    
    x <- read.csv(csv_files[i])
    nobs <- sum(complete.cases(x))
    y <- data.frame(i, nobs)
    z <- rbind(z, y)
  }
  
  
  # 4. label column names of our data frame 'z'
  
  colnames(z) <- c("id", "nobs")
  
  # 5. Return data frame 'z'
    # which output looks like:
      # id nobs
      # 1  117
      # 2  1041
      # ...

  return(z)
}
