## Loading necessary libraries 
library(dplyr)
library(ggplot2)
library(psych)
library(caTools)

## Loading data 
adult = read.csv("datasets/adult_sal.csv")

## Checking class if data.frame
class(adult)

## Head of data 
head(adult)

## Checking the head,str, and summary of the data
head(adult)
str(adult)
summary(adult)

## Using table() to check the frequency of the type_employer column
table(adult$type_employer)

## Null values in type_employer
sum(adult$type_employer == "?")

## Two smallest groups in type_employer
plot(adult$type_employer)
# From the plot it is clear that the without pay and not working are the two 
# smallest groups in the type_employer

## Combine the two smallest groups into a single group called "Unemployed"
adult$type_employer = as.character(adult$type_employer)
adult$type_employer[adult$type_employer == "Without-pay" | adult$type_employer == "Never-worked"] <- "Unemployed"

## Combine State and Local gov jobs into a category 
## called SL-gov and combine self-employed jobs into
## a category called self-emp
adult$type_employer[adult$type_employer == "State-gov" | adult$type_employer == "Local-gov"]  <- "SL-gov" 
adult$type_employer[adult$type_employer == "Self-emp-inc" | adult$type_employer == "Self-emp-not-inc"]  <- "self-emp" 

## Use table() to look at the marital column
table(adult$marital)

## Check the country column using table()
table(adult$country)

## Grouping the countries together according to continent 
adult$country <- as.character(adult$country)
names(table(adult$country))

# Creating string vectors for each continent 
north.america = c("Canada", "Cuba", "Dominican-Republic", "El-Salvador", "Guatemala", "Haiti", "Honduras", "Jamaica", "Mexico", "Nicaragua", "Outlying-US(Guam-USVI-etc)", "Puerto-Rico", "Trinadad&Tobago", "United-States")
asia = c("Cambodia", "China", "Hong", "India", "Iran", "Japan", "Laos", "Philippines", "Taiwan", "Thailand", "Vietnam")
south.america = c("Columbia", "Ecuador", "Peru")
europe = c("England", "France", "Germany", "Greece", "Holand-Netherlands", "Hungary", "Ireland", "Italy", "Poland", "Portugal", "Scotland", "Yugoslavia")
other = c("South", "?")

adult$country[adult$country %in% north.america] = "North-America"
adult$country[adult$country %in% asia]  = "Asia"
adult$country[adult$country %in% south.america] = "South-America" 
adult$country[adult$country %in% europe] =  "Europe"  
adult$country[adult$country %in% other] = "Other"

## Using table to confirm groupings 
table(adult$country)

##  Check the str() of adult again.
str(adult)
## Reverting columns datatypes back to factor type
adult$country = as.factor(adult$country)
adult$type_employer = as.factor(adult$type_employer)

##  Use ggplot2 to create a histogram of ages, colored by income.
ggplot(
  adult,
  aes(x = age)
) + geom_histogram(aes(fill = income), color = "black", bins = 30)

## Plot a histogram of hours worked per week
ggplot(
  adult,
  aes(x = hr_per_week)
) + geom_histogram(color ="black", bins = 30)

## Rename the country column to region column to better reflect the factor levels
names(adult)[15] = "region"

## Create a barplot of region with the fill color defined by income class.
## Optional: Figure out how rotate the x axis text for readability
ggplot(
  adult,
  aes(x = region)
) + geom_bar(aes(fill=income))

## Split the data into a train and test set using the caTools library
View(adult)
set.seed(10)

split = sample.split(adult$income,SplitRatio = 0.75)

train = adult[split,]
test = adult[!split,]

logreg = glm(formula = income~., data = train, family = binomial)

# Checking model to remove insignificant variables 
summary(logreg)

# Fitting model again
logreg = glm(formula = income~age+education+fnlwgt+education+capital_gain+capital_loss+sex+hr_per_week+relationship+occupation, data = train, family = binomial)

summary(logreg) # shows it is a better fit 

# Evaluating the model
y_pred = predict(logreg,newdata = test, type = 'response')
y_pred = ifelse(y_pred<=0.5,"<=50K",">50K")
y_pred = as.data.frame(y_pred)
out = cbind(actual = test$income, predicted = y_pred)


## Analysing the accuracy 
cross = table(out)
accuracy = (cross[1,1]+cross[2,2])/sum(colSums(cross))*100
accuracy

