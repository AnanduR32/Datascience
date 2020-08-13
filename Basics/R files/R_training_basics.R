# -------------------------------- Assignment to variables -------------------------------#

a = 15 #will be treated as a numeric class datatype by default
## To explicitely specify the datatype to integer an "L" suffic is assigned as,
## a = 15L
## the above assignment will treat a as an integer type data variable

b = 13
c = a + b;
name <- 'Anandu'

comp = 3 + 4i
class(comp)

print('hello');

## Inf is a special number representing infinity
## NaN is another special numeber that represents missing value

## 
# R objects have attributes such as 
# * names, dimnames (dimension names)
# * dimensions (matrices, arrays)
# * class 
# * length
# * Other user specified attributes/metadata
##

# ---------------------------------- Creating vectors ------------------------------------#

stu.countries = c("India","Pakistan","China","USA");
rm(stu.countries)

vect_1<-c(1:10)

## While vectors can have only one type of datatypes for all its elements, 
## whereas lists can have different datatypes for its elements 

## adding dimensions to vectors 
dim(vect_1) = c(2,5)
## Creates a 2x5 matrix with values of vect_1 arranged column-wise

## Lists 
x = list(2, "a", TRUE, 4+3i) # or x = list(2, "a", T, 4+3i)
print(x)
## Note : Elements are indexed using double brackets 


## Factors 
# They represent categorical data 
# Can be ordered or unordered
# Factors is an integer vector in which each integer has a label
# They are self-describing
x = factor(c("yes","no","no","yes"))
unclass(x)
# Order of levels set using "level()" function parameter
# which is important to specify the baseline level 
y = factor(c("yes","no","no","yes"),levels = c("yes","no"))
## Look at the environment quadrant and observe the data object 


# ---------------- ---------- Assigning names -----------------------------------#

## All objects can have names

## List elements can have names 
y = list(a = 1, b = 2, c = 3)
print(y)
##

row.names(google) = rn

google = c(1:5)
facebook = c(6:10)

stocks = c(google,facebook)
stocks_mat = matrix(stocks,ncol=2)
rn = c("Day 1","Day 2","Day 3","Day 4","Day 5")
n= c("google","facebook")
colnames(stocks_mat) = n
row.names(stocks_mat) = rn
print(stocks_mat)

amazon = c(11:15)
stocks_mat = cbind(stocks_mat,amazon)

m = matrix(1:4,nrow = 2)
dimnames(m) = list(c("a","b"),c("c","d"))
print(m)

# ----------------------- Deriving various results from matrices -------------------------#

rowMeans(stocks_mat)
colMeans(stocks_mat)
rowSums(stocks_mat)
colSums(stocks_mat)

stocks_mat = rbind(stocks_mat,colMeans(stocks_mat))
stocks_mat = cbind(stocks_mat,rowMeans(stocks_mat))

colnames(stocks_mat) = c(n,"Amazon","Average")

round(stocks_mat,0) #round to 0 decimal place 


# ---------------------------------- Creating Dataframes ---------------------------------#
std_id=c(1:5)
std_names=c("a","b","c","d","e")
isMale=c(T,T,F,F,F)

df = data.frame(std_id,std_names,isMale)
print(df)
View(df)
print(df$std_names)

cbind(df,Marks=25:29)

summary(df)
View(summary(df))
data()
df_airline = AirPassengers
df_airline
View(df_airline)

head(df_airline,12)
tail()
View(mtcars)
head(mtcars,12)

df_cars=mtcars
df_cars[df_cars$mpg>20,]
df_cars[df_cars$gear==4,]
df_cars[df_cars[,10]==4,c("mpg","disp","gear")]


write.csv(df_cars,"R:/cars.csv")

iris
View(iris)
data_iris=data.frame(iris)
df_iris_setosa = data_iris[data_iris$Species=="setosa",]
write.csv(df_iris_setosa,"iris_setosa.csv")
iris[iris$Species=="setosa"]
setosa=matrix("")
View(read.csv("iris_setosa.csv"))
View(df_iris_setosa)
x=20
if(x%%2==0){
  print("Yes")
}

## Modifying the dataframe - Adding new field
mutate(dataset, Performance = hp/wt)

# -------------------------- Conditional statemenets -------------------------------#

x = 15;
if(x<5){
  print("x is less than 5")
}else if(x>=5 & x<10){
  print("X between 5 and 10")
}else{
  print("x greater than 10")
}
# --------------------------Iteratable Loops ---------------------------------------#

country = "India"
GDP = 6
if(country=="India"& GDP>7){
  print("good")
}else if(GDP>5 & GDP<7){
  print(paste0("Medium",GDP))
}else{
  print("bad")
}

# ------------------------- Factorial of number ------------------------------------#

n = 0;
limit = 10;
if(n>0){
  while(n<=limit){
    i = 1;
    result = 1;
    while(i<n){
      result = result * i;
      i=i+1;
    }
    print(paste("The factorial of",n,"is",result))
    n=n+1;
  }
}else{
  print("The factorial of -ve number does not exist")
}

i = 0
range = c(1:10)
for(i in range){
  print(i)
}


# -------------------------------- END --------------------------------------------#


  
