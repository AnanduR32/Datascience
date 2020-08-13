
## Logistic Regression 

## Set working directory 
setwd(setwd_regression_ICE)

## Loading the data

logData = read.csv("Social_Network_Ads.csv")

## Removing unnecessary variable "ID"

logData$User.ID = NULL

head(logData)

## Creating gender as factor
logData$Gender = factor(logData$Gender, levels = c("Male","Female"), labels = c(1,0))

## Creating Purchased as factor
logData$Purchased = factor(logData$Purchased, levels = c(0,1),labels = c(0,1))

## Exploring the data
str(logData)
summary(logData)

## Feature Scaling 
logData[2:3] = scale(logData[2:3])

View(logData)

## Creating the train and test datasets
set.seed(23)

split = sample.split(logData$Purchased,SplitRatio = 0.75)
train = logData[split,]
test = logData[!split,]
nrow(test)
class(test)
## Fitting the logistic model
logreg = glm(formula = Purchased~., data = train, family = binomial)

## Checking model, remove insignificant variables 
summary(logreg)

## recreating model
logreg = glm(formula = Purchased~Age+EstimatedSalary, data = train, family = binomial)

## Predicting y_pred
y_pred = predict(logreg,newdata = test, type = 'response')

## if threshold 50%
y_pred = ifelse(y_pred>0.5,1,0)
class(y_pred)
y_pred = as.data.frame(y_pred)
dim(y_pred)
## Comparing values 
out = cbind(actual = test$Purchased, predicted = y_pred)

## Analysing the accuracy 
cross = table(out)
accuracy = (cross[1,1]+cross[2,2])/sum(colSums(cross))*100
accuracy
