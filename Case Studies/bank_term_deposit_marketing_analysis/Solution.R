## Installing the readxl package to read excel file format
## *.xlsx to R environment
install.packages("readxl")

## Load package
library(readxl)

## install tidyverse package 
install.packages("tidyverse")

## Load package
library(tidyverse)

## Storing the path to banking case study
setwd("Case Studies/bank_term_deposit_marketing_analysis")
setwd_banking = getwd()

## Setting up path to excel sheet 
path = "bank_term_deposit_marketing_analysis.xlsx"
## To see the sheets in the excel file we are to read
excel_sheets(path)

## Reading the excel sheet 
data_full = read_excel(path)

## Viewing entire excel file
## Simply shows all sheets in excel file
View(data_full)

## reading "CLIENT_INFO" sheet specifically
data_client_info = read_excel(path,"CLIENT_INFO")

## Understanding the data
## View data_client_info
View(data_client_info)
## Structure of data_client_info
str(data_client_info)
## Summary of data_client_info
summary(data_client_info)

## Reading entire excel file - all its sheets and values
data_full = path %>% excel_sheets() %>% set_names() %>% map(read_excel,path = path)
## Viewing entire excel file
View(data_full)

## Extracting just the necessary sheets from excel and reducing to single
## Dataframe using the left_join reduce function
dataset = data_full[4:7] %>% reduce(left_join)
View(dataset)

## To find which month has the highest duration of customer calls
barplot(tapply(dataset$DURATION,dataset$MONTH,sum))


