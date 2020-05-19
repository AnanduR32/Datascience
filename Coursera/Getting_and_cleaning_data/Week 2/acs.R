getwd()
setwd("~/GitHub/Data_Science_R/Case Studies")

## The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

## and load the data into R. The code book, describing the variable names is here:
  
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

## Create a logical vector that identifies the households on greater
## than 10 acres who sold more than $10,000 worth of agriculture products.
## Assign that logical vector to the variable agricultureLogical. 
## Apply the which() function like this to identify the rows of the 
## data frame where the logical vector is TRUE.

fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL,destfile = "acs.csv")
acs = read.csv("acs.csv",colClasses = character())

View(acs)
View(acs[c(acs$AGS,acs$ACR),])
filter(select(acs,AGS,ACR),AGS=="6",ACR=="3")

agricultureLogical = with(acs,AGS=="6" & ACR=="3")

View(agricultureLogical)

which(agricultureLogical)


## Using the jpeg package read in the following picture of your instructor into R

## https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg

## Use the parameter native=TRUE. What are the 30th and 80th 
## quantiles of the resulting data? (some Linux systems may 
## produce an answer 638 different for the 30th quantile)

picURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(picURL,destfile = "instructor.jpg",mode = "wb")

library(jpeg)
library(data.table)
img = readJPEG("instructor.jpg",native = T)
quantile(img,probs = c(0.30,0.80))

## Load the Gross Domestic Product data for the 190 ranked countries in this data set:

## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

## Load the educational data from this data set:
  
## https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

## Match the data based on the country shortcode. How many of the IDs match?
## Sort the data frame in descending order by GDP rank (so United States is last). 
## What is the 13th country in the resulting data frame?

gdpURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
eduURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(gdpURL,"gdp.csv")
download.file(eduURL,"edu.csv")

gdp = fread("gdp.csv",skip = 9,nrow= 190,select = c(1,2,4,5),col.names = c("CountryCode","Rank", "Economy", "Total"))
edu = fread("edu.csv")
View(gdp)
View(edu)

library("dplyr")
link_gdp_edu = inner_join(gdp,edu)
View(link_gdp_edu)
dim(link_gdp_edu)

select(arrange(link_gdp_edu,desc(Rank)),Economy)[13,]

## What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?

link_gdp_edu %>% group_by(`Income Group`) %>% summarize(m = mean(Rank))


## Cut the GDP ranking into 5 separate quantile groups. Make a table versus Income.Group. 
## How many countries are Lower middle income but among the 38 nations with highest GDP?
  
breaks = quantile(link_gdp_edu[,"Rank"],probs = seq(0,1,0.2),na.rm = T)
link_gdp_edu$quantileGDP = cut(link_gdp_edu[, "Rank"], breaks = breaks)

table(link_gdp_edu$`Income Group`,link_gdp_edu$quantileGDP)



