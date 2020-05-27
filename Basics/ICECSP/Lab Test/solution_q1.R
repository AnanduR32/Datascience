## loading the data
library(readxl)
library(dplyr)
library(lubridate)
library(glimpse)

customers = read_excel("datasets/Customers.xlsx")

## Analyzing the data 
head(customers)
# Analysis on structure of the xlsx file
str(customers)
# Viewing entire content of the file 
View(customers)
# number of rows in the table
nrow(customers)
# number of columns in table
ncol(customers)
# Viewing names of columns 
names(customers)
# Summary of the table
summary(customers)
# describing the data
describe(customers)


## Missing values in the customers dataframe
missing_Customer_value = is.na(customers$`Customer Value`)
table(missing)
# There are 36 missing values in the field of 10000 total records
# percent of missing value 
percent = (sum(missing_Customer_value)/nrow(customers))*100

## creating two subsets of unique and missing values
unique_values = subset(customers,!duplicated(customers$`Customer ID`))
duplicate_values = subset(customers,duplicated(customers$`Customer ID`))

## Creating a subset for customers who have Customer Value > 10000
valued_customers = subset(customers, customers$`Customer Value`>10000)

## Segmentation of customers based of customer value
temp = mutate(customers, Customer_value_segment=ifelse(customers$`Customer Value`>=25000,"High Value Segment",ifelse((customers$`Customer Value`>=10000)&(customers$`Customer Value`<25000),"Medium Value Segment","Low Value Segment")))
temp$Customer_value_segment = as.factor(temp$Customer_value_segment)
customers = temp

## Creating variables "average revenure per trip" and "balance points"
customers = mutate(customers,average_revenue_per_trip= `Customer Value`/`buy times`,Balance_Points=`Points earned` - `Points redeemed`)
head(customers)

## Days between last purchase date and today
days_between = abs(ymd(customers$`recent date`, format="yyyy/mm/dd") - today())

## % sales group by city, state, region
customers %>%
  group_by(Last_state,Last_city) %>%
  summarise(TotalSales=sum(`Customer Value`)) %>%
  transform(percentage_sales=TotalSales*100/sum(TotalSales))

## count of customers, average number of purchases and 
## average purchase transaction value by last state and city
customers %>% 
  group_by(Last_state,Last_city) %>%
  summarise(
    count=sum(as.numeric(`Customer ID`)), 
    avg_no_pur=mean(`buy times`), 
    avg_pur_tran=(sum(`Customer Value`)/count))

