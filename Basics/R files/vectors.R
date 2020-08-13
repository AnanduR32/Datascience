2**5

# Creating vector stock.prices
stock.prices = c(23,27,23,21,24)

# Mean of stock.prices
mean(stock.prices)

# Standard Deviation in stock.prices
sd(stock.prices)

# Sum of stock.prices
sum(stock.prices)

# Assigning name to list elements
names(stock.prices) = c("Mon","Tue","Wed","Thur","Fri")

# Average stock price for the week
mean(stock.prices)

# Creating logical vector represent days with stock price
# greater than 23
over.23 = stock.prices>23

# Filtering stock.prices using over.23 logic vector
stock.prices = stock.prices[over.23]

# Find day on which stock price was greatest 
names(stock.prices[stock.prices==max(stock.prices)])

# Variable named var
var = "Welcome"

# Datatype of var
class(var)

# Console Window
# It is the R window/shell where we can type and execute R codes
# And simultaneously view the results of the code

# Number of packages in R
nrow(installed.packages())
# 31 packages currently installed in R

# CRAN - Comprehensive R Archive Network

# R is just the console to type, execute and view output of R code
# R console provides complete UI and functionalities to easily 
# browse through all R files, packages and so on
