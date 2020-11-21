library(caret)
library(AppliedPredictiveModeling)

## Run 1
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

## Run 2
library(caret)
library(gbm)

set.seed(62433)

library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)

inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

mdl_rf = train(diagnosis~., method = "rf", data = training)
mdl_gb = train(diagnosis~., method = "gbm", data = training, verbose = F)
mdl_ld = train(diagnosis~., method = "lda", data = training, verbose = F)
pred_rf = predict(mdl_rf, newdata = testing)
pred_gb = predict(mdl_gb, newdata = testing)
pred_ld = predict(mdl_ld, newdata = testing)
combDF = data.frame(pred_rf, pred_gb, pred_ld, diagnosis = testing$diagnosis)
mdl_cd = train(diagnosis~., method = "rf", data = combDF)
pred_cd = predict(mdl_cd, newdata = combDF)
confusionMatrix(pred_rf, testing$diagnosis)$overall[1]
confusionMatrix(pred_gb, testing$diagnosis)$overall[1]
confusionMatrix(pred_ld, testing$diagnosis)$overall[1]
confusionMatrix(pred_cd, testing$diagnosis)$overall[1]


