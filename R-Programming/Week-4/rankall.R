#!/usr/bin/Rscript
#--------------------------------
# Jansen A. Simanullang, 20.02.2016
# rankall
# example usage:
#> setwd("[this source code directory path]")
#> source("rankall.R")
#> head(rankall("heart attack", 20), 10)
#> tail(rankall("pneumonia", "worst"), 3)
#> tail(rankall("heart failure"), 10)
#-------------------------------

rankall <- function(outcome, num = "best") {
  
  # 'rankhospital' 
  # find the best hospital in all state for a given outcome
  # as a function of 'outcome' and 'num'
  #---------------------------------------------------------
  # 1. Read from file to be taken as data:
    data <- read.csv("outcome-of-care-measures.csv")
  
  # 2. Get distinct 'States' from data:
    States <- levels(factor(data[, 7]))
  
  # 3. Define the possible acceptable 'Outcomes':
    Outcomes <- c("heart attack", "heart failure", "pneumonia")
  
  # 4. check validity of the input: 'state', 'outcome' and 'num':
  
    # 4.1 stops when the input 'outcome' is not exist within the 'Outcomes';
      if ((outcome %in% Outcomes) == FALSE) {stop(print("-- invalid outcome input! --"))}
  
    # 4.2 returns 'NA' if num is greater that the number of HospitalsRanked in the data.
      if (is.numeric(num) == TRUE) {
        if (length(data[,2]) < num) {return(NA)}
      }
  
  # 5. Define mapping of outcome column according to 'outcome' input:
    colNumber <- if (outcome == "heart attack") {11}
      else if (outcome == "heart failure") {17}
      else {23}
  
  # 6. Regard 'outcome' as numeric and 'Hospital.Name' as character:
  
    # 6.1 regard data in column 'colNumber' as numeric;
    
      data[, colNumber] <- suppressWarnings(as.numeric(levels(data[, colNumber])[data[, colNumber]]))
    
    # 6.2 regard data in column '2' as character;
      #> names(data)[2]
      #[1] "Hospital.Name"
      # since column #2 is Hospital.Name, it's should be considered as character:
    
      data[, 2] <- as.character(data[, 2])
  

  # 7. initialize empty AllStatesHospitalRanking:
      
    AllStatesHospitalRanking <- vector()
    
  # 8. compute AllStatesHospitalRanking.
    
    # 8.1 loop for all States to compute AllStatesHospitalRanking:
    
    for(i in 1:length(States)) {
        
      # 8.1.1. selected data for each state;
        selectedData <- subset(data, State == States[i])
        #selectedData <- data[grep(state, data$State), ]
        
      # 8.1.2. re-select data based on requested input 'outcome' and clean it from all 'na' values;
        selectedColumns <- suppressWarnings(as.numeric(selectedData[,colNumber]))
        selectedData <- selectedData[!(is.na(selectedColumns)), ]
        
      # 8.1.3. rank hospital by 'outcome':
        
        HospitalRankPerState <- selectedData[order(selectedData[, colNumber], selectedData[, 2]), ]
        
        # 8.1.3.1. if input 'num' == 'best' then then 'numRank' = first;
          if(num == "best") {numRank = 1}
          
        # 8.1.3.2. if input 'num' == 'worst' then 'numRank' = last;
          else if(num == "worst") {numRank = nrow(HospitalRankPerState)}
          
        # 8.1.3.3. if input 'num' == number then 'numRank' = 'num'.
          else{numRank = num}
          
          HospitalsRanked <- HospitalRankPerState[numRank, 2]
      
      # 8.1.4 append AllStatesHospitalRanking:
      
        AllStatesHospitalRanking <- append(AllStatesHospitalRanking, c(HospitalsRanked, States[i]))
      }
  
    #8.2 AllStatesHospitalRanking as data frame along with column names and row names:

      AllStatesHospitalRanking <- as.data.frame(matrix(AllStatesHospitalRanking, length(States), 2, byrow = TRUE))
      colnames(AllStatesHospitalRanking) <- c("hospital", "state")
      rownames(AllStatesHospitalRanking) <- States
  
    #8.3. return AllStatesHospitalRanking:

    return(AllStatesHospitalRanking)
}
