library(data.table)

## Setting Working directory 
getwd()
setwd(paste0(getwd(),"/Basics/ICECSP/regression"))
setwd_regression_ICE = getwd()
data = fread("data.csv")


View(data)
