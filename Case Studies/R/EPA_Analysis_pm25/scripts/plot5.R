#### Getting the data 
fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
if(!file.exists(
  "./data/summarySCC_PM25.rds"
)|!file.exists(
  "./data/Source_Classification_Code.rds"
)
){
  download.file(fileUrl,"data.zip")
  unzip("data.zip",exdir = "./data")
  unlink("data.zip")
}
#### Reading the data
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Exploratory Analysis 
dates = c(1999,2002,2005,2008)

#### Emissions from motor vehicle sources Baltimore City
motoVehicleRelated = grepl("vehicle", SCC[, 'SCC.Level.Two'], ignore.case=TRUE)
reqSCC = SCC[motoVehicleRelated,'SCC']
dat_balt_mv = subset(dat_balt, SCC %in% reqSCC)
dat_balt_mv = tapply(dat_balt_mv$Emissions,factor(dat_balt_mv$year),sum)
png(file ="../plots/plot5.png")
plot(dates,
     dat_balt_mv, 
     cex=1.5,
     col = 'red',
     pch =19,
     xlab = "Years",
     ylab = "Emissions",
     main = "Emissions from motor vehicle sources Baltimore City")
lines(dates,as.numeric(dat_balt_mv), lwd = 2, col = "orange")
dev.off()
unlink('data',recursive = T)