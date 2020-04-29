## Setting Working directory 
setwd(setwd_coursera)
setwd("getting_and_cleaning_data/Week 4")

## Loading necessary Libraries 
library(data.table)
library(dplyr)
## Quantmod package 
## install.packages("quantmod")
library(quantmod)

## Downloading necessary files
file1URL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
file2URL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file3URL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(file1URL,"acs.csv")
download.file(file2URL,"gdp.csv")
download.file(file3URL,"edu.csv")

## Loading files 
acs = fread("acs.csv")
gdp = fread("gdp.csv",skip = 9,nrows = 190,select = c(1,2,4,5),col.names = c("CountryCode","Rank","Long Name","gdp"))
edu = fread("edu.csv")

## Exploratory analysis on data 
str(acs);str(gdp);str(edu)

## For the acs dataset 
## Apply strsplit() to split all the names
## of the data frame on the characters "wgtp".
## What is the value of the 123 element of the resulting list?

strsplit(names(acs),"wgtp")[[123]]

## For the gdp dataset
## Remove the commas from the GDP numbers in millions of
## dollars and average them. What is the average?

gsub(",","",gdp$V5) %>% as.numeric %>% mean(na.rm=T)

## what is a regular expression that would allow you to 
## count the number of countries whose name begins with "United"?

grep("^United",gdp$`Long Name`,value = T)

## Combine the edu and gdp datasets by CountryCode
## Of the countries for which the end of the fiscal 
## year is available, how many end in June?

combined = merge(gdp,edu,by = "CountryCode")

length(grep("Fiscal year end: June 30",combined$`Special Notes`))

## You can use the quantmod (http://www.quantmod.com/) package to get
## historical stock prices for publicly traded companies on the NASDAQ and NYSE. 
## Use the following code to download data on Amazon's stock price
## and get the times the data was sampled.

amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

## How many values were collected in 2012? How many 
## values were collected on Mondays in 2012?

library(lubridate)
## To get number of stocks in 2012
table(year(sampleTimes)==year(ymd("20120101")))[[2]]
## To get number of stocks in 2012 on a monday
table(wday(sampleTimes[year(sampleTimes)==year(ymd("20120101"))])==2)[[2]]
