setwd(paste0(getwd(),"/GitHub/Data_Science_R/Coursera"))
getwd()

## The American Community Survey distributes downloadable data about United States 
## communities. Download the 2006 microdata survey about housing for the state of Idaho
## How many housing units in this survey were worth more than $1,000,000?

fileURLQ1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileURLQ1,destfile = "dataQ1.csv")

dataQ1 = data.table::fread("dataQ1.csv")
View(dataQ1)

View(dataQ1[VAL==24,.N])

## Download the Excel spreadsheet on Natural Gas Aquisition Program
## Read rows 18-23 and columns 7-15 into R
## What is the value of:
##    sum(dat$Zip*dat$Ext,na.rm=T) 

fileURLQ2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

install.packages("devtools")
devtools::install_github("colearendt/xlsx")

library(xlsx)

download.file(fileURLQ2,destfile = "dataQ2.xlsx")

dataQ2 = read.xlsx("dataQ2.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)

## Read the XML data on Baltimore restaurants from here:
## How many restaurants have zipcode 21231?

fileURLQ3 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

library(XML)
dataQ3 = xmlTreeParse(sub("s","",fileURLQ3),useInternalNodes = T)
rootNode = xmlRoot(dataQ3)

zipcodes = xpathSApply(rootNode,"//zipcode",xmlValue)

library(data.table)
DT = data.table(zip = zipcodes)
DT[zip=="21231",.N]
