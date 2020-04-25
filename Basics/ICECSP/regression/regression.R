library(data.table)
library(dplyr)
library(ggplot2)
## Setting Working directory 
getwd()
setwd(paste0(getwd(),"/Basics/ICECSP/regression"))
setwd_regression_ICE = getwd()

## Loading data 
data = fread("data.csv")

## View data
View(data)

## Treating missing values 
data$Age = as.numeric(data$Age)
data$Salary = as.numeric(data$Salary)
new_data = mutate(data,Age=ifelse(is.na(data$Age),mean(data$Age,rm.na=T),data$Age),Salary = ifelse(is.na(data$Salary),mean(data$Salary,rm.na=T),data$Salary))

data$Salary <- ifelse(is.na(data$Salary),mean(data$Salary,rm.na=T),data$Salary)

View(new_data)


## Predicting Salary using simple linear regression model 
data_sal = read.csv("salary_data.csv")
View(data_sal)


## Finding the type of correlation using ggplot

ggplot(
  data_sal,
  aes(
    x = YearsExperience , y = Salary
  )
) + geom_point(
) + geom_smooth(
  method="lm",formula = y~x,se=F
)

## Breaking the data into test and train
## package caTools required

install.packages("caTools")
library(caTools)    

set.seed(123)

split = sample.split(data_sal$Salary,SplitRatio = 0.7)
View(split)

train = data_sal[split,] # or subset(data_sal, split == T) 
View(train)

test = data_sal[!split,] # or subset(data_sal, split == F)
View(test)

## Fit the model 

lreg = lm(formula = Salary~YearsExperience, data = train)
plot(lreg)
summary(lreg) # pvalue - probability of the variable not being of significance

## Removing the y variable from test dataset
test_clean = select(test,YearsExperience)
View(test_clean)

## predicting the salaries 
y_pred = predict(lreg,newdata = test_clean)
View(y_pred)

test_pred = cbind(test,predicted = y_pred)
View(test_pred)
