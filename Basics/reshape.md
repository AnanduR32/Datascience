# ----------------------------- Melt and cast --------------------------------------#

## install.packages("reshape")
library(reshape)

View(mtcars)
mtcars$carname = rownames(mtcars)

## Performing melt operation
carsMelt = melt(mtcars,id = c("carname","gear","cyl"),measure.vars = c("mpg","hp"))

## Performing analysis with 'cyl' value - casting with id cyl
## By default gives count of variable type for the specified id
cylData = cast(carsMelt, cyl ~ variable)
## Applying mean function to summarise the dataset 
cylDataMean = cast(carsMelt, cyl ~ variable, mean)

## Example 2 
gearData = cast(carsMelt, gear ~ variable)

