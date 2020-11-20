# Question 1
## Packages
library(AppliedPredictiveModeling)
library(rattle)
data(segmentationOriginal)
library(caret)

## Segmenting data into train and test
inTrain = createDataPartition(segmentationOriginal$Case, p = 0.7, list = F)
training = subset(segmentationOriginal, Case=="Train")
testing = subset(segmentationOriginal, Case=="Test")

set.seed(125)

## Modelling
cartMdl = train(Class~., method = "rpart", data = training)
print(cartMdl$finalModel)

## Visualizing the tree
fancyRpartPlot(cartMdl$finalModel)

# Question 2
## Packages
library(pgmm)
data(olive)
olive = olive[,-1]
head(olive)

## Modelling
treeMdl = train(Area~., method = "rf", data = olive, verbose = F)

## Prediction dataset
newdata = as.data.frame(t(colMeans(olive)))

## Predicting 
pred = predict(treeMdl, newdata = newdata)
pred

# Question 3
## Packages
library(ElemStatLearn)
data(SAheart)
set.seed(8484)

## Data segmentation
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]
