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

#### Visualization of total emissions per year from all sources
dat_total = tapply(NEI$Emissions,factor(NEI$year),sum)
png(file ="../plots/plot1.png")
plot(dates,
     dat_total,
     cex=1.5,
     col = 'red',
     pch =19,
     xlab = "Years",
     ylab = "Emissions",
     main = "Visualization of total emissions per year from all sources")
lines(dates,as.numeric(dat_total),lwd=2, col = "orange")
dev.off()
unlink('data',recursive = T)