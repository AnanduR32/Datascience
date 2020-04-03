
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

## Performing Operations on the dataset 

## select

View(select(flights,carrier,arr_delay,dep_delay))

## arrange -arrange the dataset in the ascending or descending order with respect to a particular parameter
## It is used for the sorting of the data

## Ascending order
asc_arr_delay = arrange(flights,arr_delay)
View(asc_arr_delay)
## Descending order
desc_arr_delay = arrange(flights,desc(arr_delay))
View(desc_arr_delay)

## Write code to print vairables carrier, arr_delay and dep_delay 
## which are sorted by dep_delay in descending order
View(arrange(select(flights,carrier,arr_delay,dep_delay),desc(dep_delay)))
View(select(arrange(flights,desc(dep_delay)),carrier,arr_delay,dep_delay))

## distinct

## filter

View(filter(flights,carrier=="UA"))
View(filter(flights,arr_delay>1000))

## summarise

## sample_n

## sample_frac

## mutate

## tranmute 

## joins







# -----------------------------END--------------------------------------------------#
