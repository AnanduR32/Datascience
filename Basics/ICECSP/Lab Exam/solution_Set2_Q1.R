##
library(dplyr)
customer = read.csv("datasets/Customer Acquisition.csv.csv")
repayment = read.csv("datasets/Repayment.csv.csv")
spend = read.csv("datasets/spend.csv.csv")

complete = merge(customer,spend,by="Customer")
complete = merge(complete,repayment,by = "Customer")
View(complete)
complete %>% 
  group_by(City,Month.y) %>%
  summarize(
    total=sum(Amount.y)
  )

## distinct customer count 
unique(complete$Customer)
unique(complete$Product)

## average monthly spend
complete %>%
  group_by(Month.y) %>%
  summarize(
    avg_monthly = mean(Amount.x)
  )
## average monthly repayment
complete %>%
  group_by(Month.y) %>%
  summarize(
    avg_monthly = mean(Amount.y)
  )

## Top 5 Type
complete %>%
  group_by(Type) %>%
  summarize(
    popularity = sum(Amount.x)
  ) %>% 
  arrange(desc(popularity))

## City max spend 
complete %>%
  group_by(City) %>%
  summarize(
    popularity = sum(Amount.x)
  ) %>% 
  arrange(desc(popularity))

## Age group spending most 
complete %>%
  group_by(Age) %>%
  summarize(
    popularity = sum(Amount.x)
  ) %>% 
  arrange(desc(popularity))

## Top 10 customers in terms of repayment 
complete %>%
  group_by(Customer) %>%
  summarize(
    topCustomers = sum(Amount.y)
  ) %>%
  arrange(desc(topCustomers))

## City-wise spend on each product on yearly basis 
complete$Month.x = as.POSIXct(complete$Month.x,format = "%d-%b-%y")
complete["year"] = format(complete$Month.x, "%Y")
complete %>%
  group_by(c(year,City)) %>%
  summarize(
    spend = sum(Amount.x)
  ) %>%
  arrange(desc(spend))

