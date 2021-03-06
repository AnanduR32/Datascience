## ------------------------------------------- Setting directory ----------------------------------------------- ##
## Saving root directory
setwd_future = getwd()
## Navigating to project directory
setwd("Basics/Exploratory_Data_Analysis/avg_pm_25")
## Storing project directory
setwd_exploratory_avg_pm_25 = getwd()

## ---------------------------------------------- Loading Data ------------------------------------------------- ##
## Loading data
pollution = read.csv("avgpm25.csv",colClasses = c("numeric","character","factor","numeric","numeric"))

## ------------------------------------------ Exploratory analysis --------------------------------------------- ##
## Reading head
head(pollution)

## One dimensional analysis

## Summary 
summary(pollution$pm25)

## Boxplot
boxplot(pollution$pm25, col = "blue")
## Overlaying additional feature to the plot in this case a horizontal line at horizontal height = 12
## Which is the national upperlimit standard for pm2.5 levels in a state
abline(h=12)

## Histogram
hist(pollution$pm25, col = "blue")
## Adding rug to the histogram, to see where exactly the points are on the histogram
rug(pollution$pm25)

## Changing number of breaks in histogram
hist(pollution$pm25, col = "blue", breaks = 25)

## Overlaying additional feature to the plot in this case a vertical line at vertical height = 12
## and another vertical line at median position
abline(v = 12, col = "black", lwd = 3)
abline(v = median(pollution$pm25), col = "red", lwd = 4)

## Barplot - summary plot for categorical data 
barplot(table(pollution$region), col = "orange", main = "Number of counties in each region")

## Two dimensional analysis

## Multiple boxplot
boxplot(pm25~region, data = pollution, col = "purple")

## Multiple histogram
par(mfrow=c(2,1),mar = c(4,4,2,1))
hist(pollution[pollution$region=="west",]$pm25, col = "green", main = "west")
hist(pollution[pollution$region=="east",]$pm25, col = "green", main = "east")

## Scatterplot
with(pollution, plot(latitude, pm25))
abline(h=12,lwd=3,lty=4)

## Adding color based on a factor
with(pollution, plot(latitude, pm25,col = region))
abline(h=12,lwd=3,lty=4)

## Multiple scatterplot
par(mfrow=c(1,2),mar = c(5,4,2,1))
with(subset(pollution, region == "west"), plot(latitude, pm25,col = region, main = "west"))
with(subset(pollution, region == "east"), plot(latitude, pm25,col = region, main = "east"))


