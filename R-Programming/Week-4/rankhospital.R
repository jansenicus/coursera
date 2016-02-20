#!/usr/bin/Rscript
#--------------------------------
# Jansen A. Simanullang, 20.02.2016
# rankhospital
# example usage:
#> setwd("[this source code directory path]")
#> source("rankhospital.R")
#> rankhospital("TX", "heart failure", 4)
#[1] "DETAR HOSPITAL NAVARRO"
#> rankhospital("MD", "heart attack", "worst")
#[1] "HARFORD MEMORIAL HOSPITAL"
#> rankhospital("MN", "heart attack", 5000)
#[1] NA
#--------------------------------

rankhospital <- function(state, outcome, num = "best") {

  # 'rankhospital' 
  # find the best hospital in a state with a given rank
  # as a function of 'state', 'outcome' and 'num'
  #---------------------------------------------------------
  # 1. Read from file to be taken as data:
  data <- read.csv("outcome-of-care-measures.csv")
  
  # 2. Get distinct 'States' from data:
  States <- levels(factor(data[, 7]))
  
  # 3. Define the possible acceptable 'Outcomes':
  Outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  # 4. check validity of the input: 'state', 'outcome' and 'num':
  
    # 4.1 stops when the input 'state' is not exist within the 'States';
    if ((state %in% States) == FALSE) {stop(print("-- invalid state input! --"))}
    
    # 4.2 stops when the input 'outcome' is not exist within the 'Outcomes';
    else if ((outcome %in% Outcomes) == FALSE) {stop(print("-- invalid outcome input! --"))}
    
    # 4.3 returns 'NA' if num is greater that the number of hospitals in the data.
    if (is.numeric(num) == TRUE) {
      if (length(data[,2]) < num) {return(NA)}
    }
  
  # 5. Define mapping of outcome column according to 'outcome' input:
    colNumber <- if (outcome == "heart attack") {11}
      else if (outcome == "heart failure") {17}
      else {23}
    
  # 6. Slice and clean data based on the requested input 'state and 'outcome':
    
    # 6.1 regard data in column 'colNumber' as numeric;
    
      data[, colNumber] <- suppressWarnings(as.numeric(levels(data[, colNumber])[data[, colNumber]]))
      
    # 6.2 regard data in column '2' as character;
      #> names(data)[2]
      #[1] "Hospital.Name"
      # since column #2 is Hospital.Name, it's should be considered as character
      
      data[, 2] <- as.character(data[, 2])
    
    # 6.3. select data based on requested input 'state';
      selectedData <- subset(data, State == state)
      #selectedData <- data[grep(state, data$State), ]

    # 6.4. re-select data based on requested input 'outcome' and clean it from all 'na' values;
      selectedColumns <- suppressWarnings(as.numeric(selectedData[,colNumber]))
      selectedData <- selectedData[!(is.na(selectedColumns)), ]
    
  # 7. rank hospital by 'outcome':
  
    rankedHospital <- selectedData[order(selectedData[, colNumber], selectedData[, 2]), ]
    
    # 7.1 if input 'num' == 'best' then then 'numRank' = first;
    if(num == "best") {numRank = 1}
    
    # 7.2 if input 'num' == 'worst' then 'numRank' = last;
    else if(num == "worst") {numRank = nrow(rankedHospital)}
    
    # 7.3 if input 'num' == number then 'numRank' = 'num'.
    else{numRank = num}
  
  # 8. return the hospital in the requested rank.
    
  return(rankedHospital[numRank, 2])
}
