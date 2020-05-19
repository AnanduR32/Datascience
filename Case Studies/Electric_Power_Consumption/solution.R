## ----------------------------------------- Loading necessary packages ------------------------------------ ##
library(data.table)
library(dplyr)

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

if (!file.exists('./household_power_consumption_data')){
  download.file(fileurl,'./household_power_consumption_data.zip', mode = 'wb')
  unzip("household_power_consumption_data.zip", exdir = getwd())
}
unlink("./household_power_consumption_data.zip")

## ---------------------------------------------- Loading the data ----------------------------------------- ##

dataset = fread("household_power_consumption.txt",sep = ";",)
View(dataset)
