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

## png 1
png("plot1.png", width=480, height=480)
hist(dataset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()

## png 2
png("plot2.png", width=480, height=480)
plot(x = dataset$DateTime,
     y = dataset$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

## png 3 
png("plot3.png", width=480, height=480)
plot(dataset$DateTime, dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dataset$DateTime, dataset$Sub_metering_2,col="red")
lines(dataset$DateTime, dataset$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()

## png 4
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(powerDT[, dateTime], powerDT[, Global_active_power], type="l", xlab="", ylab="Global Active Power")
plot(powerDT[, dateTime],powerDT[, Voltage], type="l", xlab="datetime", ylab="Voltage")
plot(powerDT[, dateTime], powerDT[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(powerDT[, dateTime], powerDT[, Sub_metering_2], col="red")
lines(powerDT[, dateTime], powerDT[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1),
       bty="n",
       cex=.5) 

# Plot 4
plot(powerDT[, dateTime], powerDT[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
