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

#### Indicating trends in emissions of different Source Types in Baltimore City 
library(reshape2)
data_melt = reshape2::melt(dat_balt[,4:6],id.vars = c('year','type'))
data_cast = reshape2::dcast(data_melt, year+type~ variable, fun.aggregate = sum)
png(file ="../plots/plot3.png")
library(ggplot2)
ggplot(
  data_cast,
  aes(
    x = factor(year),
    y = Emissions,
    color = type,
    group = type
  ),
) + geom_point(cex = 2) +
  geom_line(cex =1.4) + 
  theme_bw() + guides(fill=FALSE)+
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
dev.off()
unlink('data',recursive = T)