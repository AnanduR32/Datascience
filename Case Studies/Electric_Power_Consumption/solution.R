## ----------------------------------------- Loading necessary packages ------------------------------------ ##
library(data.table)
library(dplyr)
library(lubridate)

## ----------------------------------------- Setting working directory ------------------------------------- ##
## Navigating to project directory 
setwd(setwd_future)
{
  if(!file.exists("Case Studies/Electric_Power_Consumption")){
    dir.create("Case Studies/Electric_Power_Consumption")
  }
  setwd("Case Studies/Electric_Power_Consumption")
  setwd_moneyball_project = getwd()
}

## -------------------------------------------- Downloading the data --------------------------------------- ##

fileurl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists('./data.txt')){
  download.file(fileurl,'./household_power_consumption_data.zip', mode = 'wb')
  unzip("household_power_consumption_data.zip", exdir = getwd())
}
unlink("./household_power_consumption_data.zip")

## ---------------------------------------------- Subsetting data ------------------------------------------ ##
## Opening complete dataset for reading
tmpfile <- file("household_power_consumption.txt", "r")
cat(grep("^[1|2]/2/2007",readLines(tmpfile), value=TRUE), sep="\n", file="data.txt")
close(tmpfile)

## ---------------------------------------------- Loading the data ----------------------------------------- ##

colNames = as.character(fread("household_power_consumption.txt", sep = ";", nrows = 1,header = F,colClasses = rep("character",9)))
dataset = fread("data.txt",sep = ";")
unlink("household_power_consumption.txt")
colnames(dataset) = colNames
View(dataset)
## Correcting dataset formats
dataset$DateTime = as.POSIXct(paste(dataset$Date,dataset$Time),format = "%d/%m/%Y %H:%M:%S")
dataset$Date = NULL
dataset$Time = NULL


## ------------------------------------------- Constructing the plots -------------------------------------- ##

## png.1


