## Using sqldf package to execute SQL queries on dataframes 
# install.packages("sqldf")
detach("package:RMySQL", unload=TRUE)
library(sqldf)

## Downloading and loading data 
setwd(paste0(getwd(),"/Basics/reading_data/db"))
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url, destfile = "americanCommunitySurvey.csv")
acs = read.table("americanCommunitySurvey.csv",header = T,sep=",")
View(acs)

## performing sql queries using sqldf package
sqldf("select pwgtp1 from acs where AGEP<50")
sqldf("select distinct AGEP from acs")



