## Set Directory
setwd(setwd_hospital)

library(dplyr)

## Reading the dataset for outcome of individual cares 
outcome = read.csv("outcome-of-care-measures.csv", colClasses = "character")

## Viewing the dataset
View(outcome)

## There are several columns in this dataset 
## we shall concentrate on columns 11 and 19
ncol(outcome)

## See names of each column
names(outcome)

## Plotting a histogram of the 30-day death rates from heart attack 
## Using column 11 of the dataset
outcome[, 11] = as.numeric(outcome[, 11]) 
# Necessary since all columns were read as characters 
hist(outcome[,11])

## Function to identify the best hospital based on
## Lower mortality rate in a particular state 
