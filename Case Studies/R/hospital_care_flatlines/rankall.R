
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  dataset = read.csv("outcome-of-care-measures.csv",colClasses = "character")
  
  if(tolower(outcome) == "heart attack"){
    dataset = select(dataset,Hospital.Name,State,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)
  }else if(tolower(outcome) == "heart failure"){
    dataset = select(dataset,Hospital.Name,State,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)
  }else if(tolower(outcome) == "pneumonia"){
    dataset = select(dataset,Hospital.Name,State,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)
  }else{
    stop("Invalid Outcome")
  }
  dataset[,3]=as.numeric(dataset[,3])
  names(dataset) =  c("Name","State","Outcome")
  ## Check that state and outcome are valid
  dataset = dataset[complete.cases(dataset),]
  Not_avail = dataset[,3]=="Not Available"
  dataset = dataset[!Not_avail,]
  
  if(tolower(num)=="best"){
    dataset = dataset[order(dataset[,3],dataset[,1]),]
    out = lapply(split(dataset[1],dataset$State),function(x){x[1,]})
    out = out[]
  }else if(tolower(num)=="worst"){
    dataset = dataset[order(-dataset[,3],dataset[,1]),]
    out = lapply(split(dataset[1],dataset$State),function(x){x[1,]})
    out = out[]
  }else{
    dataset = dataset[order(dataset[,3],dataset[,1]),]
    num = as.integer(num)
    out = lapply(split(dataset[c(1)],dataset$State),function(x){x[num,]})
    out = out[]
  }
  out
}


