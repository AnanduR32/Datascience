## Set working directory 
setwd(setwd_bank_cred_default_pred)

## Load necessary libraries 
library(caTools)
library(rpart)
library(data.table)
library(readxl)

## Load data 
description = read_excel("data_description.csv",skip = 4)
dataset = read.csv("BankCreditCard.csv")
View(description)
View(dataset)
