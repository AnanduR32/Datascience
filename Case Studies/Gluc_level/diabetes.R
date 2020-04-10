# ---------------------------------------- Diabetes ---------------------------------------------#
library(dplyr)
diabetes = read.csv("Diabetes/diabetes.csv")

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
dataset1 = diabetes[!row.has.na,]
View(dataset)
dim(dataset)

# My Method 
good = complete.cases(diabetes)
dataset2 = diabetes[good,]
dim(dataset2)

## Graphical analysis 
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

# Univariate Analyis 
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


