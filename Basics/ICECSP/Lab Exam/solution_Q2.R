## Loading necessary libraries 
library(dplyr)
library(ggplot2)
library(psych)
library(caTools)

## Loading data 
bike = read.csv("dataset4/bikeshare.csv.csv")
# Checking class if data.frame
class(bike)

## Check the head of df
head(bike)

## Create a scatter plot of count vs temp. Set a good alpha value
ggplot(
  bike,
  aes(x = temp,
      y = count)
) + geom_point(alpha=0.5,color = "orange")

##  Plot count versus datetime as a scatterplot with 
## a color gradient based on temperature. 
## You'll need to convert the datetime column
## into POSIXct before plotting
bike$datetime = as.POSIXct(bike$datetime, format = "%d-%m-%Y %H:%M")
ggplot(
  bike,
  aes(x = datetime,
      y = count)
) + geom_point(aes(color = temp),alpha=0.5)

## What is the correlation between temp and count?
with(bike, cor(count,temp))

## Create a boxplot, with the y axis indicating count 
## and the x axis having box for each season.
boxplot(count~season, data = bike)

##  Create an "hour" column that takes the hour from the datetime column.
bike["hour"] = format(bike$datetime, "%H")

## Creating plot for non working days
boxplot(count~season, data = bike[bike["workingday"]==0,])

## Use lm() to build a model that predicts count 
## based solely on the temp feature, name it temp.model
View(bike)
set.seed(10)

split = sample.split(bike$count,SplitRatio = 0.75)

train = bike[split,]
test = bike[!split,]

## Fitting the model 
temp.model = lm(formula = count~temp, data = train)

##  Get the summary of the temp.model
summary(temp.model)

## Finally build a model that attempts to predict count based
## off of the following features. Figure out if theres a way
## to not have to pass/write all these variables into the lm() function
lreg = lm(formula = count~., data = train)
summary(lreg)

# optimizing the model
lreg = lm(formula = count~datetime+workingday+humidity+casual+registered+hour, data = train)

## predicting values 
y_pred = predict(lreg,newdata = test[-c(12)]) #removed count variable during predict

## Evaluating output 
out = cbind(actual = test$count,predicted = y_pred)
View(out)

