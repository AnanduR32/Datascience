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

## Similarly for Garage_Build_Year and Garage_Finish_Year

data_complete$Garage_Built_Year = as.character(data_complete$Garage_Built_Year)
data_complete$Garage_Built_Year[is.na(data_complete$Garage_Built_Year)] = "No Garage"

data_complete$Garage_Finish_Year = as.character(data_complete$Garage_Finish_Year)
data_complete$Garage_Finish_Year[is.na(data_complete$Garage_Finish_Year)] = "No Garage"

## Similarly for Garage_Condition

data_complete$Garage_Condition = as.character(data_complete$Garage_Condition)
data_complete$Garage_Condition[is.na(data_complete$Garage_Condition)] = "No Garage"

## Garage_Quality
data_complete$Garage_Quality = as.character(data_complete$Garage_Quality)
data_complete$Garage_Quality[is.na(data_complete$Garage_Quality)] = "No Garage"

## Pool variables 
## Pool_Quality
data_complete$Pool_Quality = as.character(data_complete$Pool_Quality)
data_complete$Pool_Quality[is.na(data_complete$Pool_Quality)] = "No Pool"

## Fence variables
## Fence_Quality
data_complete$Fence_Quality = as.character(data_complete$Fence_Quality)
data_complete$Fence_Quality[is.na(data_complete$Fence_Quality)] = "No Fence"

## Miscellaneous_Feature  

data_complete$Miscellaneous_Feature = as.character(data_complete$Miscellaneous_Feature)
data_complete$Miscellaneous_Feature[is.na(data_complete$Miscellaneous_Feature)] = "None"

## Filling NAs in Lot_Extent with median value 
class(data_complete$Lot_Extent)
data_complete$Lot_Extent[is.na(data_complete$Lot_Extent)] = median(data_complete$Lot_Extent,na.rm = T)

## For variables with less than 1% missing values it is important to analyse the variables 
## thoroughly to replace the missing values with proper replacement

## Creating table between Brick_Vaneer_Area and Brick_Vaneer_Type
## To analyse relation between the two variables 
cross_brick_analysis = table(data_complete$Brick_Veneer_Area,data_complete$Brick_Veneer_Type)
cross_brick_analysis
cross_brick_margin = addmargins(cross_brick_analysis)
cross_brick_margin

## Brick_Vaneer_Area and Brick_Vaneer_Type
data_complete$Brick_Veneer_Type = as.character(data_complete$Brick_Veneer_Type)
data_complete$Brick_Veneer_Type[is.na(data_complete$Brick_Veneer_Type)] = "None"

data_complete$Brick_Veneer_Area[is.na(data_complete$Brick_Veneer_Type)] = 0

## Creating table between Electrical_System and Building_Class
## To analyse relation between the two variables 
cross_elec_analysis = table(data_complete$Electrical_System, data_complete$Building_Class)
cross_elec_analysis
cross_elec_margin = addmargins(cross_elec_analysis)
cross_elec_margin

## Electrical_System

data_complete$Electrical_System = as.character(data_complete$Electrical_System)
data_complete$Electrical_System[is.na(data_complete$Electrical_System)] = "SBrKr"

data_complete_backup = data_complete

data_complete = data_complete_backup

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

train = data_complete[1:ntrain,]
vis_miss(train)
test = data_complete[ntrain:ncomplete,]
vis_miss(test)

## Removing Sale_Price from the test dataset
test = select(test, -Sale_Price)

## Improper datacleaning 

train = train[complete.cases(train),]
test = test[complete.cases(test),]
test = filter(test,Condition1!="NoRMD")
test = filter(test,Condition2!="NoRMD")
test = filter(test,Functional_Rate!="Mod")
test = filter(test,Garage_Built_Year!="1895",Garage_Built_Year!= "1896",Garage_Built_Year!= "1919",Garage_Built_Year!= "1943",Garage_Built_Year!="1919")
test = filter(test,Sale_Condition!="AbnoRMDl",Sale_Condition!="NoRMDal")

## fitting the model

lreg = lm(formula = Sale_Price~., data = train)

## Predicting the values 

y_pred = predict(lreg,newdata = test)
y_pred
summary(y_pred)

## Creating a summarized view of prediction vs true value 
out = (cbind(test$Sale_Price,predicted = y_pred, variation_percent = round(100*(abs(test$Sale_Price-y_pred)/test$Sale_Price),2)))

out = as.data.frame(out)

## percent average deviation from correct value 
deviate_percent = mean(out$variation_percent)
