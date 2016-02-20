#!/usr/bin/Rscript
#--------------------------------
# Jansen A. Simanullang, 20.02.2016
# corr
# example usage:
#> setwd("[this source code directory path]")
#> source("corr.R")
#> corr("specdata")
#> corr("specdata", 129)
#> corr("specdata", 2000)
#> corr("specdata", 1000)
#> corr("specdata", 1094)
#> corr("specdata", 1095)
#--------------------------------

corr <- function(directory, threshold = 0) {
  
  # 'complete'
  # computes the correlation between nitrate and sulfate
  # as a function of 'directory', and 'threshold';
  # 'directory' is location of the CSV files;
  # 'id' is the id of each file;
  # 'threshold' is the number of completely observed observations (on all variables),
  #  the default 'threshold' is 0.
  #---------------------------------------------------------
  # 1. list all the files inside directory

  csv_files <- list.files(directory, full.names = TRUE)
  
  # 2. initialize the numeric vector 'v' with 0 length
  
  v <- vector(mode = "numeric", length = 0)
  
  # 3. loop for each file id

  for (i in 1:length(csv_files)) {
    
    # 3.1 Read the file;
    x <- read.csv(csv_files[i])

    # 3.2 count the number of complete cases 'csum';
    csum <- sum(complete.cases(x))
    
    # 3.3 check if 'csum' is greather than threshold;
    if (csum > threshold) {
      
      # 3.3.1 create 'xSulfate'
      # select from 'x' which has complete sulfate data
      # which does not contain 'na' values in sulfate data
      xSulfate <- x[which(!is.na(x$sulfate)), ]
      
      # 3.3.2 create 'xPollutant' 
      # select from 'xSulfate' which also has complete nitrate data
      # which also does not contain 'na' values in nitrate data
      xPollutant <- xSulfate[which(!is.na(xSulfate$nitrate)), ]
      
      # 3.3.3 update vector 'v'
      # 'cor' function is used to compute the correlation value
      v <- c(v, cor(xPollutant$sulfate, xPollutant$nitrate))
      
    }
  }
  
  return(v)
}
