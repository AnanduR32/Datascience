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

#### Emissions from coal combustion-related sources
combustionRelated = grepl("comb", SCC[, 'SCC.Level.One'], ignore.case=TRUE)
coalRelated = grepl("coal", SCC[, 'SCC.Level.Four'], ignore.case=TRUE) 
both = combustionRelated&coalRelated
reqSCC = SCC[both,'SCC']
dat_total_cc = subset(NEI, SCC %in% reqSCC)
dat_total_cc = tapply(dat_total_cc$Emissions,factor(dat_total_cc$year),sum)
png(file ="../plots/plot4.png")
plot(dates,
     dat_total_cc,
     cex=1.5,
     col = 'red',
     pch =19,
     xlab = "Years",
     ylab = "Emissions",
     main = "Emissions from coal combustion-related sources")
lines(dates,as.numeric(dat_total_cc),lwd=2, col = "orange")
dev.off()
unlink('data',recursive = T)