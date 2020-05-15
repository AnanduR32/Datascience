library(dplyr)
library(readxl)
library(lubridate)

## loading data
customers = read_excel("datasets/Customers1.xlsx")
prod_cat = read_excel("datasets/Prod_cat.info.xlsx")
transactions = read_excel("datasets/Transaction.xlsx")
customers = as.data.frame(customers)
transactions = as.data.frame(transactions)

## using base package 
customer_final = merge(customers,transactions, by.x = "customer_Id", by.y ="cust_id")
customer_final = merge(customer_final,prod_cat, by.x = "prod_cat_code", by.y = "prod_cat_code")
## using dplyr 
customer_final = left_join(transactions,customers, by = c("cust_id" = "customer_Id"))
customer_final = left_join(customer_final,prod_cat, by = c("prod_cat_code" = "prod_cat_code"))

# Column names of the customers_final
names(customer_final)
# column names along with datatype
str(customer_final)

# top 10 observations 
head(customer_final,10)
# bottom 10 observations 
tail(customer_final,10)

## Five-number-summery using summary function
# To get count of categorical variables we convert them to factors
customer_final$DOB = dmy(customer_final$DOB)
customer_final$prod_subcat = as.factor(customer_final$prod_subcat)
customer_final$prod_cat = as.factor(customer_final$prod_cat)
customer_final$Store_type = as.factor(customer_final$Store_type)
customer_final$tran_date = dmy(customer_final$tran_date)
customer_final$Gender = as.factor(customer_final$Gender)
# Answer for 5number summary and count of each category
summary(customer_final)

bad_days = is.na(customer_final$tran_date)
customer_final = customer_final[!bad_days,]

## Generating histograms for continous variables 
hist(customer_final$customer_Id)
hist(customer_final$city_code)
hist(customer_final$transaction_id)
hist(customer_final$prod_subcat_code)
hist(customer_final$prod_cat_code)
hist(customer_final$Qty)
hist(customer_final$Rate)
hist(customer_final$Tax)
hist(customer_final$total_amt)
hist(customer_final$prod_sub_cat_code)

plot(as.factor(customer_final$DOB))
plot(customer_final$prod_subcat)
plot(customer_final$prod_cat)
plot(customer_final$Store_type)
plot(as.factor(customer_final$tran_date))
plot(customer_final$Gender)

## Time period of all transaction 
days_between = abs(customer_final$tran_date - today())
customer_final = mutate(customer_final,time_period = days_between)
View(customer_final)

## Count of customers whose total amount negative  
count(customer_final[customer_final$total_amt<0,])

## Analyzing which product category popular among the genders
temp = na.omit(customer_final)
temp %>% group_by(prod_cat,Gender) %>% View


