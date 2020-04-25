## setting the working directory

setwd(setwd_caseStudies)
setwd("property_price_prediction")

## Loading necessary libraries

library(data.table)
library(dplyr)
library(ggplot2)

## Loading data

data = read.csv("Property_Price_Train.csv")

## View data

View(data)

## Removing missing variables 
NA_n = rep(0, ncol(data))
for(i in 1:ncol(data)){
  NA_n[i] = sum( is.na(data[,i] ))
}

pos_allNA = which(NA_n>0)

View(data.frame(cbind(NA_n,MissingRatio = NA_n/nrow(data)*100)))

## It is observed that columns - 7,58,73,74,75 has more than 50% data missing
## hence they are removed 

data_clean = select(data, -colnames(data[,c(7,58,73,74,75)]))
View(data_clean)

## Filling values in missing fields 

NA_f = rep(0, ncol(data_clean))
for(i in 1:ncol(data_clean)){
  NA_f[i] = sum( is.na(data_clean[,i] ))
}
pos = which(NA_f>0) # index position of variables that have missing values

df = as.data.frame(data_clean)

## Removing all variables with missing values 
data_clean_2 = select(data_clean, -colnames(data_clean[,pos]))


View(data_clean_2)

## Splitting the dataset into test and train
set.seed(30)

split = sample.split(data_clean_2$Sale_Price, SplitRatio = 0.7)

train = data_clean_2[split,]
test = data_clean_2[!split,]

## removing Sales_Price variable from test dataset

test_clean = select(test, -Sale_Price)
test_clean_2 = filter(test_clean, Exterior1st != "Stone", Roof_Quality != "R", Heating_Type!="OthW")
test_clean_2 = filter(test_clean, Condition2 != "RRAe", Roof_Quality != "CT", Roof_Quality != "M")
## fitting the model

lreg = lm(formula = Sale_Price~., data = train)

## Predicting the values 

y_pred = predict(lreg,newdata = test_clean_2)
summary(y_pred)

## Creating a summarized view of prediction vs true value 
out = (cbind(test$Sale_Price,predicted = y_pred, variation_percent = round(100*(abs(test$Sale_Price-y_pred)/test$Sale_Price),2)))

out = as.data.frame(out)

## percent average deviation from correct value 
deviate_percent = mean(out$variation_percent)
