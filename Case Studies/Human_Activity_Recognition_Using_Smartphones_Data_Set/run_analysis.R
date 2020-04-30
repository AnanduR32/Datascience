## -------------------------------------- Loading necessary Libraries ------------------------------------------- ## 
library(ggplot2)
library(data.table)
library(dplyr)
library(lubridate)
library(reshape2)

## ---------------------------------------- Navigating to directory---------------------------------------------- ## 

## Saving main directory path
setwd_future = getwd()

## Navigating to project directory
setwd("Case Studies/Human_Activity_Recognition_Using_Smartphones_Data_Set")

## Saving location of project directory
setwd_UCI_HAR = getwd()

## ------------------------------------------- Downloading Data ------------------------------------------------- ## 


fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists('./UCI HAR Dataset')){
  download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}


## --------------------------------------- Loading necessary Datasets ------------------------------------------- ## 

## Loading features
features = read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features = as.character(features[,2])

## Training data
x_train = read.table('./UCI HAR Dataset/train/X_train.txt')
train_activity = read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
train_subject = read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')

train =  data.frame(train_subject,train_activity,x_train)
names(train) = c(c('subject', 'activity'), features)

## Testing data
x_test = read.table('./UCI HAR Dataset/test/X_test.txt')
test_activity = read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
test_subject = read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

test = data.frame(test_subject,test_activity,x_test)
names(test) = c(c('subject', 'activity'), features)

## ---------------------------------- Merging train and test datasets ------------------------------------------- ## 
mergedDT = rbind(train,test)

## ----------------- Extracting measurements on the mean and standard deviation for each measurement ------------ ##
reqDatafields = grep("mean|std",features)
reqData = mergedDT[,reqDatafields]

## ------------------ Naming the activities in the data set using descriptive activity names ---------------------## 

## loading activity labels 
activity_labels = read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity_labels = as.character(activity_labels[,2])
reqData$activity = activity_labels[reqData$activity]

## ------------------ Naming the variables in the data set using descriptive variable names ----------------------## 

## Creating new column names 
og_names = names(reqData)
updt_names = gsub("[(][)]", "", og_names)
updt_names = gsub("^t", "TimeDomain_", updt_names)
updt_names = gsub("^f", "FrequencyDomain_", updt_names)
updt_names = gsub("Acc", "Accelerometer", updt_names)
updt_names = gsub("Gyro", "Gyroscope", updt_names)
updt_names = gsub("Mag", "Magnitude", updt_names)
updt_names = gsub("-mean-", "_Mean_", updt_names)
updt_names = gsub("-std-", "_StandardDeviation_", updt_names)
updt_names = gsub("-", "_", updt_names)
names(reqData) = updt_names

## -------------------------------------------- Reshaping the dataset ------------------------------------------- ##
## Creating a second, independent tidy data set with the average of each variable for each activity and each subject

baseData = melt(reqData,(id.vars=c("subject","activity")))
secondDataSet = dcast(baseData, subject + activity ~ variable, mean)
write.table(secondDataSet, "tidy_data.txt",row.names = F)
