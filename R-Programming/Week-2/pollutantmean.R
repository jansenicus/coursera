#!/usr/bin/Rscript
#--------------------------------
# Jansen A. Simanullang, 20.02.2016
# pollutantmean.R
# example usage:
#> setwd("[this source code directory path]")
#> source("pollutantmean.R")
#> pollutantmean("specdata", "sulfate", 1:10)
#> [1] 4.064128
#> pollutantmean("specdata", "nitrate", 70:72)
#> [1] 1.706047
#> pollutantmean("specdata", "sulfate", 34)
#> [1] 1.477143
#> pollutantmean("specdata", "nitrate")
#> [1] 1.702932
#--------------------------------

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # 'pollutantmean'
  # computes the mean of each type of pollutant
  # as a function of 'directory', 'pollutant' and 'id'
  # 'directory' is location of the CSV files
  # 'pollutant' is type of pollutant
  # 'id' is the id of each file
  #---------------------------------------------------------
  # 1. list all the files inside directory
  
  csv_files <- list.files(directory, full.names = TRUE) 
  
  # 2. initialize the data frame with 0 columns and 0 rows
  
  z <- data.frame()
  
  # 3. loop for each file, read it and bind it to our data frame
  for (i in id) {
    x <- read.csv(csv_files[i])
    z <- rbind(z, x)
  }
    # 'rbind' is similar to 'append' in Python
    # to understand 'x' intuitively, try this at R console:
    #> x = read.csv("specdata/001.csv")
    #> x
    #> result of 'x' will be shown, is the content of csv file
    #> names(x)
    #> [1] "Date"    "sulfate" "nitrate" "ID"
  
  # 3. compute the mean for a given pollutant, ignoring NA values)
  return(mean(z[, pollutant], na.rm = TRUE))
}
