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

#### Examining the trend of emissions over time in Baltimore City
dat_balt = subset(NEI, fips == "24510")
em_balt = as.numeric(tapply(dat_balt$Emissions,factor(dat_balt$year),sum))
dat_balt_df = data.frame(dates, Emissions = em_balt)
png(file ="../plots/plot2.png")
plot(
  dat_balt_df,
  cex=1.5,
  col = 'red',
  pch =19, 
  xlab = "Years",
  ylab = "Emissions",
  main = "Examining the trend of emissions over time in Baltimore City")
lines(dat_balt_df,lwd=2, col = "orange")
dev.off()
unlink('data',recursive = T)