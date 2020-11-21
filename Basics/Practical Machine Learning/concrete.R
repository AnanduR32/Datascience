set.seed(233)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

install.packages("elasticnet")
library(elasticnet)

names(training)

mdl = train(CompressiveStrength~., method = "lasso", data = training)
plot.enet(mdl$finalModel, xvar = "penalty", use.color = TRUE)

## 2
file_URL = "https://d396qusza40orc.cloudfront.net/predmachlearn/gaData.csv"
download.file(file_URL, destfile = "./data/gaData.csv")

install.packages("forecast")
library(lubridate); library(forecast)
dat = read.csv("./data/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr)

mdl_fc = bats(tstrain)
plot(forecast(mdl_fc))
fcast = forecast(mdl_fc, level = 95, h = dim(testing)[1])
plot(fcast); lines(ts(training$visitsTumblr), col = "red")
sum(fcast$lower < testing$visitsTumblr & testing$visitsTumblr < fcast$upper)/dim(testing)[1]

## 3
set.seed(325)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]

library(e1071)
mdl_svm = svm(CompressiveStrength~., method = "svm", data = training)
accuracy(predict(mdl_svm, testing),testing$CompressiveStrength)
