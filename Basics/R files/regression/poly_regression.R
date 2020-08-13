## Setting working directory
setwd(setwd_regression_ICE)

## Loading necessary libraries 
library(caTools)
library(data.table)
library(ggplot2)

## Loading data
dataset = read.csv("Position_Salaries.csv")
View(dataset)

## Plotting charts to analyze data 
plot(dataset)

ggplot(
  dataset, aes(
    x = Level,
    y = Salary 
  )
) + geom_point()

## There is already level variable defined
## The position variable is redundent, hence removing
dataset = dataset[2:3]

## Split the dataset
set.seed(10)
split = sample.split(dataset$Salary,SplitRatio = 0.7)

train = dataset[split,]
test = dataset[!split,]

## removing Salary field from test
test_ = test[1]

## Fitting the data using linear model
lreg = lm(formula = Salary~Level, data = train)

## Predicting 
y_pred = predict(lreg, newdata = test_)

## Comparing outcome and actual values 
out_lin = cbind(Actual = test$Salary, Predicted = y_pred)
View(out_lin)

## Summary of linear function 
summary(lreg)

## Using polynomial regressor 

## Quadratic model 
dataset$Level2 = dataset$Level^2
qreg = lm(formula = Salary~., data = dataset)
y_pred_q = predict(qreg, dataset)
summary(qreg)
predict(qreg, newdata = data.frame(Level=11,Level2=11^2))
## Visualizing the results
ggplot(
  dataset,aes(
    x=Level,
    y=Salary
  )
) + geom_point() + geom_line(
  aes(
    x=seq(1,10,1),y = y_pred_q
  )
)

## Cubic model 
dataset$Level3 = dataset$Level^3
creg = lm(formula = Salary~., data = dataset)
y_pred_c = predict(creg, dataset)
summary(qreg)
predict(qreg, newdata = data.frame(Level=11,Level2=11^2,Level3=11^3))
## Visualizing the results
ggplot(
  dataset,aes(
    x=Level,
    y=Salary
  )
) + geom_point() + geom_line(
  aes(
    x=seq(1,10,1),y = y_pred_c
  )
)





