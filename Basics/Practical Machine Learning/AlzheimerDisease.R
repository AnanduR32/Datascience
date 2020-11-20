library(caret)
library(AppliedPredictiveModeling)
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]
idx = grep("^IL",names(training))

training = subset(training, select=c(idx,diagnosis))
testing = subset(testing, select=c(idx,diagnosis))

preObj = preProcess(training[,-13],method = "pca", thres = 0.8)
train_PC = predict(preObj, training[,-13])
train_PC = mutate(train_PC, diagnosis = training$diagnosis)
test_PC = predict(preObj, testing[,-13])

fit1 = train(diagnosis~., method = "glm", data = training, preProcess = c("center", "scale"))
fit2 = train(diagnosis~., method = "glm", data = train_PC)

pred1 = predict(fit1, testing[,-13])
pred2 = predict(fit2, test_PC)

confusionMatrix(pred1, testing$diagnosis)
confusionMatrix(pred2, testing$diagnosis)


