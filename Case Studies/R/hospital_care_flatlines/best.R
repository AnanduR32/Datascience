
best = function(state, outcome) {
  ## Read outcome data
  dataset = read.csv("outcome-of-care-measures.csv",colClasses = "character")
  if(sum(dataset$State==state)<1) stop("Invalid State")
  dataset = dataset[dataset$State==state,]
  if(tolower(outcome) == "heart attack"){
    dataset = select(dataset,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
  }else if(tolower(outcome) == "heart failure"){
    dataset = select(dataset,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
  }else if(tolower(outcome) == "pneumonia"){
    dataset = select(dataset,Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
  }else{
    stop("Invalid Outcome")
  }
  dataset[,2]=as.numeric(dataset[,2])
  names(dataset) =  c("Name","Outcome")
  ## Check that state and outcome are valid
  dataset = dataset[complete.cases(dataset),]
  Not_avail = dataset[,2]=="Not Available"
  dataset = dataset[!Not_avail,]
  
  ## Return hospital name in that state with lowest 30-day death rate
  dataset = dataset[order(dataset[,2],dataset[,1]),]
  name = dataset[1,1]
  name
}


