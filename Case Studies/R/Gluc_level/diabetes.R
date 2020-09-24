# ---------------------------------------- Diabetes ---------------------------------------------#
library(dplyr)
diabetes = read.csv("Case Studies/Gluc_level/diabetes.csv")

## Viewing the complete contents of the dataset 
View(diabetes)

## Installing psych package 
install.packages("psych")
library(psych)
describe(diabetes)
View(describe(diabetes))

glimpse(diabetes)

## Removing unusable columns 
NA_n = rep(0, ncol(diabetes))
for(i in 1:ncol(diabetes)){
  NA_n[i] = sum( is.na(diabetes[,i] ))
}
# Column 15 and 16 has more than 50% of data missing, hence we remove those columns
diabetes = diabetes[c(-15,-16)]

## Removing rows having missing values
# Sir's Method
row.has.na = apply(diabetes,1,function(x){any(is.na(x))})
dataset = diabetes[!row.has.na,]
View(dataset)
dim(dataset)

# My Method 
good = complete.cases(diabetes)
dataset2 = diabetes[good,]
dim(dataset2)

# ----------------------------------- Graphical analysis ---------------------------------------------#
library(ggplot2)

diabetic = diabetes[diabetes[["glyhb"]]>5.6,]
View(diabetic)

ggplot(
  diabetes, aes(
    x = result, color=cut
    )
  ) + geom_histogram(
    aes(fill = factor(result)),
    color = 'white', binwidth = 1, fill = 'orange'
    )

## ---------------------------------- Univariate Analyis --------------------------------------------##
# glyhb
plot(dataset2$glyhb)
# age 
plot(dataset2$age)
# gender
plot(dataset2$gender)
# location
plot(dataset2$location)
# frame
plot(dataset2$frame)
# Cholestrole 
plot(dataset2$chol)


## ---------------------------------- Bivariate analysis --------------------------------------------##

plot(dataset2$stab.glu,dataset2$glyhb)

## Plot using linear model method 
ggplot(
  dataset2,aes(
    x=stab.glu,y = glyhb,color=diagnosis
  )
) + geom_point() + geom_smooth(method='lm')

## Extracting all numeric fields in the dataset 

dataset_numeric = dataset2[,-c(7,9,12,18)]
View(dataset_numeric)

glimpse(dataset_numeric)

## Creating multiple graphs using loop

par(mfrow = c(1,2))
for(i in 2:13){
  boxplot(dataset_numeric[,i],main = names(dataset_numeric))
}

for(i in 2:13){
  hist(dataset_numeric[,i],main = names(dataset_numeric[i]),xlab = names(dataset_numeric[i]))
}


ggplot(
  dataset_numeric,aes(
    x = age, y = glyhb, color=factor(result)
  )
) + geom_point()+geom_smooth(method = "lm")

## Visualize the package in form of percentages
# Installing vtree package
install.packages("vtree")
library(vtree)

vtree(dataset, "gender")
vtree(dataset, "gender location")
vtree(dataset, "gender location", horizon=F)
vtree(dataset, "gender location", horizon=F, height = 250, width = 850)
vtree(dataset, "gender location", horizon=F, height = 250, width = 850)

dataset$result = as.factor(unlist(dataset$result))
dataset$result = factor(dataset$result,level = c(0,1), labels = c("positive","negative"))


