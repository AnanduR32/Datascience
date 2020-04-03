
# ------------------------- Data Manipulation --------------------------------------#
# DPLYR
install.packages("dplyr");
library(dplyr)
dplyr::filter
# ?stats::filter
# optional
# install.packages("tidyverse");
install.packages("nycflights13");

# Importing the dataset to the environment 
library(nycflights13)

# Displaying the data 

View(flights)
# It provides information about the structure of the object.
str(flights)
nrow(flights)

# Performing Operations on the dataset 

## select

View(select(flights,carrier,arr_delay,dep_delay))

## arrange 

### arrange the dataset in the ascending or descending order with respect to a particular parameter
### It is used for the sorting of the data

### Ascending order
asc_arr_delay = arrange(flights,arr_delay)
View(asc_arr_delay)
### Descending order
desc_arr_delay = arrange(flights,desc(arr_delay))
View(desc_arr_delay)

### Write code to print vairables carrier, arr_delay and dep_delay 
### which are sorted by dep_delay in descending order
View(arrange(select(flights,carrier,arr_delay,dep_delay),desc(dep_delay)))

## distinct

### Outputs the unique values in the dataframe
View(distinct(flights,carrier))
### When multiple parameters are specified the unique values are joined by inner joins constraint 
View(distinct(flights,carrier,origin))

## filter

View(filter(flights,carrier=="UA"))
View(filter(flights,arr_delay>1000))
View(filter(flights,arr_delay>400,carrier=="UA"))
View(filter(flights,arr_delay>450 | (carrier=="UA" & arr_delay>300)))

### Question : write a code to print variables carrier, arr_delay and dep_delay
### which are sorted by dep_delay in descending orer 
### and shows the data for airlines UA and MQ only
View(
  arrange(
    select(
      filter(flights,carrier == "UA" | carrier == "MQ"),
      carrier,arr_delay,dep_delay),
    desc(dep_delay)
    )
  )

### pipe operator  %>%
flights %>% filter(carrier == "UA" | carrier == "MQ") %>% select(carrier,arr_delay,dep_delay) %>% arrange(desc(dep_delay)) %>% View


## summarise

vector = c(1:10)
sum(vector,na.rm=T)
mean(vector)

summarise(flights,mean(dep_delay)) #Gives value as NA because there are NA values in the field
summarise(flights,mean(dep_delay, na.rm = T))

## sample_n

### To pick some random sample of the data 
sample_n(
  flights, 10
)

## sample_frac

### Instead of using a number as parameter we specify a fraction of the original dataset that has to be chosen as the sample dataset
View(sample_frac(flights, 0.1))

## mutate

### Used to add a calculated field -- Output adds the new field to the existing frame
View(mutate(flights,ratio = arr_delay/dep_delay))

## tranmute 
View(transmute(flights,ratio = arr_delay/dep_delay))

### Same as mutate but in output it displays just the calculated field

## Group by

summarise(
  group_by(flights,carrier),
  mean(arr_delay, na.rm = T)
  )

### Question : Write code to find the total flights to each of the origin

#### My code 
summarise(
  group_by(
    flights, origin
  ),
  sum(
    flight, na.rm = T
    )
)
#### Sir's code 
summarise(
  group_by(
    flights, origin
  ),
  length(
    origin
  )
)


## joins

names = c("Anandu","Aishwarya","Kenny","Smitha");
id_n = c(1,2,3,4)
id_a = c(1,3,4,6)
ages = c(22,21,23,20)
df_names = data.frame(names,id_n)
df_ages = data.frame(id_a,ages)
View(df_ages)
View(df_names)

inner_join(df_names,df_ages, by = c("id_n" = "id_a"))
left_join(df_names,df_ages, by = c("id_n" = "id_a"))
right_join(df_names,df_ages, by = c("id_n" = "id_a"))# 
full_join(df_names,df_ages, by = c("id_n" = "id_a")) # All data from both the tables 
anti_join(df_names,df_ages, by = c("id_n" = "id_a")) # data in first table which is not in second table 
semi_join(df_names,df_ages, by = c("id_n" = "id_a")) # Common matching fields but only those which are present in first table

# ------------------------ Graphical Presentations ---------------------------------#
install.packages("ggplot2")

## ggplot - grammar of graphics plot
## A plot has :
### Mandatory
##    1. Data - what you put on the axis 
##    2. Aesthetics - the elements in chart
##    3. Geometry type of chart 
### Optional
##    4. Facet - breaking the chart into multiple subcharts 
##    5. Theme
##    6. Statistics

library(ggplot2)

## ggplot2movies package for the 'movies' dataset to be used for this tutorial on using ggplot2 package in R
install.packages("ggplot2movies")
library(ggplot2movies)
View(movies)
nrow(movies)

## Creating a histogram to find the frequency distribution of movie ratings
ggplot(movies, aes(x = rating, color=cut)) + geom_histogram(color = 'white',bins = 10, fill = 'orange')
## Question : Create a histogram on the mtcars dataset to show how many cars have milage different groups
View(mtcars)
ggplot(mtcars, aes(x = mpg, color=cut)) + geom_histogram(color = 'white',binwidth = 5, fill = 'orange', alpha = 0.8) + ggtitle('Mileage Ranges for Cars') + labs(x = 'mileage', y = 'frequency')

## Scatterplot 
### Scatterplot to find the correlation between the weights and mileage of vehicles 
ggplot(
  mtcars, aes(
    x = wt, y = mpg, color=cut
    )
  ) + geom_point(
    color = 'black', size = 4,aes(
      color = cyl
      )
    ) + ggtitle(
      'Wight and mileage correlation'
      ) + labs(
        x = 'weight', y = 'mileage'
        )

ggplot(
  mtcars, aes(
    x = wt, y = mpg, color=cut
    )
  ) + geom_point(
    size = 4,aes(
      color = cyl
      )
    ) + ggtitle(
      'Wight and mileage correlation'
      ) + labs(
        x = 'weight', y = 'mileage'
        )

## Question: Modify the scatterplot to show different shapes based on the number of cylinders 

ggplot(
  mtcars, aes(
    x = wt, y = mpg, color=cut
    )
  ) + geom_point(
    size = 4,aes(
      color = cyl, shape = factor(
        cyl
        )
      )
    ) + ggtitle(
      'Wight and mileage correlation'
      ) + labs(
        x = 'weight', y = 'mileage'
        )

## Bar chart of count of class of vehicles in the mpg dataset 
View(mpg)
ggplot(
  mpg,
  aes(
    x = class
  )
) + geom_bar(
  color = 'black',
  fill = 'orange'
)

## Stacked bar chart by stacking the drive-train type frontwheel rearwheel or all wheel drive
ggplot(
  mpg,
  aes(
    x = class
  )
) + geom_bar(
  color = 'black',
  aes(
    fill = drv
    )
)

ggplot(
  mpg,
  aes(
    x = class
  )
) + geom_bar(
  color = 'black',
  aes(
    fill = drv
  ),
  position = "dodge"
)

ggplot(
  mpg,
  aes(
    x = class
  )
) + geom_bar(
  color = 'black',
  aes(
    fill = drv
  ),
  position = "fill"
)

## Boxplot chart using mtcars dataset - In terms of  Mileage and cyliners

ggplot(
  mtcars,
  aes(
    x = factor(cyl), # factor converts numeric variable into groups - continous variable to discrete 
    y = mpg
  )
) + geom_boxplot(
  aes(fill=cyl)
)
ggplot(
  mtcars,
  aes(
    x = factor(cyl), # factor converts numeric variable into groups - continous variable to discrete 
    y = mpg
  )
) + geom_boxplot(
  aes(fill=factor(cyl))
) + coord_flip() + theme_grey()

### Getting more themes 
install.packages('ggthemes')


# -----------------------------END--------------------------------------------------#
