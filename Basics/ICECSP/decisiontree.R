## Setting working directory
setwd(setwd_ICECSP)

## Loading necessary libraries 
## install.packages("rpart")
library(caTools)
library(data.table)
library(ggplot2)
library(rpart)

## Loading data
dataset = read.csv("regression/Position_Salaries.csv")
View(dataset)

## There is already level variable defined
## The position variable is redundent, hence removing
dataset = dataset[2:3]

## Plotting charts to analyze data 
plot(dataset)

ggplot(
  dataset, aes(
    x = Level,
    y = Salary 
  )
) + geom_point()

## Performing feature scaling
dataset = scale(dataset)

## Split the dataset
set.seed(10)
split = sample.split(dataset$Salary,SplitRatio = 0.7)

train = dataset[split,]
test = dataset[!split,]

## Fitting a decision tree model
data =as.data.frame(dataset)
dtree = rpart(Salary~.,data, control = rpart.control(minsplit = 1))

dt_pred = predict(dtree,newdata = data.frame(Level=seq(1,10,1)))

## Visualizing the results
ggplot(
  data,aes(
    x=Level,
    y=Salary
  )
) + geom_point() + geom_line(
  aes(
    x=seq(1,10,1),y = dt_pred
  )
)
