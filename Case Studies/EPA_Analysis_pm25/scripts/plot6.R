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

#### Comparing the emissions between Baltimore City and Los Angeles County
dat_losAngeles = subset(NEI, fips == "06037")
em_losAngeles = as.numeric(tapply(dat_losAngeles$Emissions,factor(dat_losAngeles$year),sum))
dat_balt_losAngeles_df = data.frame(dates, Emissions.Baltimore = em_balt, Emissions.LosAngeles = em_losAngeles)
head(dat_balt_losAngeles_df)
rng = range(dat_balt_losAngeles_df$Emissions.Baltimore,dat_balt_losAngeles_df$Emissions.LosAngeles)
png(file ="../plots/plot6.png")
plot(
  ylim = rng,
  x = dates,
  type = "n",
  xlim = c(1998,2009),
  xlab = "Years",
  ylab = "Emissions",
  main = "Compare Baltimore City and Los Angeles County emissions")
points(dates,dat_balt_losAngeles_df$Emissions.Baltimore, cex = 1.5, col = "red", pch=19)
points(dates,dat_balt_losAngeles_df$Emissions.LosAngeles, cex = 1.5, col = "purple", pch=19)
lines(dates,dat_balt_losAngeles_df$Emissions.Baltimore, lwd = 2, col = "orange")
lines(dates,dat_balt_losAngeles_df$Emissions.LosAngeles, lwd = 2, col = "blue")
legend("topright", legend=c("Baltimore City","Los Angeles"),col = c("red","purple"),pch =19)
dev.off()
unlink('data',recursive = T)