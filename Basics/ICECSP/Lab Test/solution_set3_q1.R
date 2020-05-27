## loading necessary libraries
library(readxl)
library(dplyr)
library(lubridate)
library(ggplot2)
library(reshape2)
library(gridExtra)

## Loading data
sales = read_excel("datasets/SalesData.xlsx")

View(sales)
str(sales)
summary(sales)

sales$Region = as.factor(sales$Region)
sales$Tier = factor(sales$Tier,level = c("High","Med","Low"), label = c("High","Medium","Low"))
sales$Division = as.factor(sales$Division)

region_sales = sales %>%
  group_by(Region) %>%
  summarise(
    sale15avg = mean(Sales2015),
    sale16avg = mean(Sales2016),
    sale15total = sum(Sales2015),
    sale16total = sum(Sales2016)
  )

aggregate(sales[, 9:10], list(sales$Region), mean)

## Region - Year wise sales visualization
## Compare Sales by region for 2016 with 2015 using bar chart 
select(sales,Region,Sales2015,Sales2016)

sales_melt = melt(sales,id = c("Region"),measure.vars = c("Sales2015","Sales2016")) 

sales_melt = subset(sales_melt,value>0)

ggplot(data=sales_melt, aes(x=Region, y=value,fill=variable)) +
  geom_bar(stat = "identity",position = "dodge") 

## Tier - Year wise sales visualization
sales_melt = melt(sales,id = c("Tier"),measure.vars = c("Sales2015","Sales2016")) 
sales_melt = subset(sales_melt,value>0)
sales_melt = na.omit(sales_melt)
ggplot(data=sales_melt, aes(x=Tier, y=value,fill=variable)) +
  geom_bar(stat = "identity",position = "dodge") 

## Tier - Region wise visualization for comparison of year wise sales  
## Compare the total sales of 2015 and 2016 with respect to Region and Tiers  
sales_melt = melt(sales,id = c("Region","Tier"),measure.vars = c("Sales2015","Sales2016")) 
sales_melt = subset(sales_melt,value>0)
sales_melt = na.omit(sales_melt)

plot1 = ggplot(data=sales_melt[sales_melt$variable=="Sales2015",], aes(x=Tier, y=value,fill=Region)) +
  geom_bar(stat = "identity",position = "dodge") + ylim(0, 175000) + ggtitle("For year 2015")
plot2 = ggplot(data=sales_melt[sales_melt$variable=="Sales2016",], aes(x=Tier, y=value,fill=Region)) +
  geom_bar(stat = "identity",position = "dodge") + ylim(0, 175000) + ggtitle("For year 2016")
grid.arrange(plot1,plot2,ncol = 2)

## Visualizing contributing factors to sales for each region in 2016 
## What are the contributing factors to the sales for each region in 2016. Visualize  
## it using a Pie Chart
ggplot(data=sales, aes(x="", y=Sales2016, fill=Region)) +
  geom_bar(stat = "identity") + coord_polar("y", start=0) + theme_minimal()

