## setting the working directory

setwd(setwd_caseStudies)
setwd("property_price_prediction")

## Loading necessary libraries
## install.packages("naniar")
library(data.table)
library(dplyr)
library(ggplot2)
library(readr)
library(naniar)

## Loading data

train = read.csv("Property_Price_Train.csv")
test = read.csv("Property_Price_Test.csv")

## View data

View(train)

## Combining datasets

## removing the id variable from both train and test 
train$Id = NULL # removes the id column from train
test$Id = NULL  # removes the id column from test 

## Adding Sale_Price variable to test before combining
test$Sale_Price = NA
head(test)

## Complete data
data_complete = rbind(train,test)
dim(data_complete)

## storing number of observations in each dataset
ntrain = nrow(train)
ntest  = nrow(test)
ncomplete = nrow(data_complete)

## Exploring data
str(data_complete)

## Checking positions of missing value

## Visualizing missing value % using naniar package
vis_miss(data_complete)

## Locating position of variables that have around 50% of its
## values missing 

## Checking variables that have missing values
colSums(is.na(data_complete))

## Selecting only those columns that have missing value 
colWithMissingValues = sapply(data_complete, function(x){ sum(is.na(x))})
colWithMissingValues[colWithMissingValues>0]

## Data cleaning 

## Lane_Type with NA value actually represent house with no lane 

data_complete$Lane_Type = as.character(data_complete$Lane_Type)
data_complete$Lane_Type[is.na(data_complete$Lane_Type)] = "No Access"

## Basement_Height with NAs represent 'No basement'
data_complete$Basement_Height = as.character(data_complete$Basement_Height)
data_complete$Basement_Height[is.na(data_complete$Basement_Height)] = "No Basement"

## Similarly for Basement_Condition
data_complete$Basement_Condition = as.character(data_complete$Basement_Condition)
data_complete$Basement_Condition[is.na(data_complete$Basement_Condition)] = "No Basement"

## Similarly for exposure 
data_complete$Exposure_Level = as.character(data_complete$Exposure_Level)
data_complete$Exposure_Level[is.na(data_complete$Exposure_Level)] = "No Basement"

## Similarly for BsmtFinType1 and BsmtFinType2
data_complete$BsmtFinType1 = as.character(data_complete$BsmtFinType1)
data_complete$BsmtFinType1[is.na(data_complete$BsmtFinType1)] = "No Basement"

data_complete$BsmtFinType2 = as.character(data_complete$BsmtFinType2)
data_complete$BsmtFinType2[is.na(data_complete$BsmtFinType2)] = "No Basement"

## The variable Fireplace_quality has NAs for observations which don't actually have
## a fireplace, therefore replacing the NAs with "No Fireplace"

data_complete$Fireplace_Quality = as.character(data_complete$Fireplace_Quality)
data_complete$Fireplace_Quality[is.na(data_complete$Fireplace_Quality)] = "No Fireplace"

## Similarly for Garage variable 

data_complete$Garage = as.character(data_complete$Garage)
data_complete$Garage[is.na(data_complete$Garage)] = "No Garage"

##


## Selecting variables with more than 50% data values after cleaning

NA_n = rep(0, ncol(data_complete))
for(i in 1:ncol(data_complete)){
  NA_n[i] = sum( is.na(data_complete[,i] ))
}

pos_NA50 = which(NA_n>(0.5*ncomplete))
pos_NA50


## Removing variables with more than 50% data missing

data_complete = select(data_complete,-colnames(data_complete[,pos_NA50]))

## View data_complete 
View(data_complete)

## It is observed that columns - 7,58,73,74,75 has more than 50% data missing
## hence they are removed 

data_clean = select(data, -colnames(data[,c(7,58,73,74,75)]))
View(data_clean)


## Filling values in missing fields 

NA_f = rep(0, ncol(data_clean))
for(i in 1:ncol(data_clean)){
  NA_f[i] = sum( is.na(data_clean[,i] ))
}
pos = which(NA_f>0.5*nrow(train)) # index position of variables that 
## have more than 50% missing values

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
