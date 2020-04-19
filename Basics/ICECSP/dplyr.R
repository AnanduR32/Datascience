## Loading the dplyr package
library(dplyr)

## Loading the data 
data(mtcars)

## Display cars with mph>20, 6 cylinders
filter(mtcars,mpg>20,cyl==6) 

## Reorder dataframe by cyl first, then decreasing weight(wt)
head(arrange(mtcars,cyl,desc(wt)))

## Select columns mpg and hp
head(select(mtcars,mpg,hp))

## Select distinct values of gear column
distinct(select(mtcars,gear))

## Creating new column Performance = hp/wt
head(mutate(mtcars,Performance=hp/wt))

## Find mean mpg value 
summarise(mtcars,mean_mpg=mean(mpg))

## Use pipe operator to obtain mean hp value for cars
## with cylinders 6
mtcars %>% filter(cyl == 6) %>% summarise(mean_hp = mean(hp))

## Creating two dataframes
df1 = data.frame(ID=1:5,Salary=seq(1000,5000,1000))
df2 = data.frame(ID=c(1,2,3,4,6),Bonus=c(200,300,500,700,800))

## To identify the ID that do not have salary 
anti_join(df2,df1,by="ID")

## To identify the ID that don't have bonus
anti_join(df1,df2,by="ID")

## Identify IDs that have both bonus and salary
inner_join(df1,df2,by="ID")
