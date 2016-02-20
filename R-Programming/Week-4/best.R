#!/usr/bin/Rscript
#--------------------------------
# Jansen A. Simanullang, 20.02.2016
# best.R
# example usage:
#> setwd("[this source code directory path]")
#> source("best.R")
#> best("SC", "heart attack")
#> best("NY", "pneumonia")
#> best("AK", "pneumonia")
#--------------------------------

best <- function(state, outcome) {
  
  # 'best' 
  # find the best hospital name in a state with lowest 30-day death rate
  # as a function of 'state' and 'outcome'
  #---------------------------------------------------------
  # 1. Read from file, take as data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  # 2. Get distinct 'States' from data:
  States <- levels(factor(data[, 7]))
  
  # 3. Define the possible distinct acceptable 'Outcomes':
  Outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  # 4. check validity of the input: 'state' and 'outcome'
  
    # 4.1 stops when the input 'state' is not exist within the 'States'
    if ((state %in% States) == FALSE) {stop(print("-- invalid state input! --"))}
    
    # 4.2 stops when the input 'outcome' is not exist within the 'Outcomes'
    else if ((outcome %in% Outcomes) == FALSE) {stop(print("-- invalid outcome input! --"))}
  
  # 5. Define mapping of outcome column according to 'outcome' input
  colNumber <- if (outcome == "heart attack") {11}
  else if (outcome == "heart failure") {17}
  else {23}
  
  # 6. Slice and clean data based on the requested input 'state and 'outcome'
  
    # 6.1 select data based on requested input 'state'
    selectedData <- subset(data, State == state)
    
    # 6.2 prepare selection of column by outcome
    selectedColumns <- suppressWarnings(as.numeric(selectedData[,colNumber]))
    
    # 6.3. re-select data based on requested input 'outcome' and clean it from all 'na' values
    selectedData <- selectedData[!(is.na(selectedColumns)), ]
  
  # 7. select the necessary columns and rows based on cleaned data
  
    # 7.1 re-select column by outcome from the cleaned data
    selectedColumns <- as.numeric(selectedData[, colNumber])
    
    # 7.2 select row(s) which has the minimum value
    selectedRows <- which(selectedColumns == min(selectedColumns))
  
  # 8. get hospital data based on selected rows data
  
    # 8.1 select hospital data from selected rows data
    selectedHospital <- selectedData[selectedRows, 2]
    
    # 8.2 sort hospital alphabetically in case of multiple result
    sortedHospital <- sort(selectedHospital)
  
  return(sortedHospital)
  
}
