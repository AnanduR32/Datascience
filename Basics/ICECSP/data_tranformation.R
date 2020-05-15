## Loading the data 
library("nycflights13")
library(dplyr)
library()

## filtering the flights which were not calcnelled 
not_cancelled = filter(flights, !is.na(arr_time), !is.na(dep_time))

## selecting the most important columns from the not_cancelled dataframe
not_cancelled %>% select(arr_time, dep_time, sched_arr_time, dep_delay, arr_delay)       

## Figuring out the number of flights cancelled per day 
flights %>% 
  mutate(cancelled = (is.na(dep_time)|is.na(arr_time))) %>%
  group_by(year,month,day) %>%                      # grouping the records fights by year, then month and then day
  summarise(
    cancelled_num = sum(cancelled),                 # summarizing the number of flights cancelled
    flights_num = n()                               # summarizing the total number of flights on that day
  )

## Exploring which carrier has worst delays 
flights %>% 
  group_by(carrier) %>%
  summarise(
    arr_delay = mean(arr_delay, na.rm = T)
  ) %>%
  arrange(desc(arr_delay))

## figuring out if whether the destination airport or 
## the carrier is responsible for the delays 
flights %>% 
  group_by(dest) %>%
  summarise(
    arr_delay = mean(arr_delay, na.rm = T)
  ) %>%
  arrange(desc(arr_delay))
## We observe that CAE airport has an average delay of 41.8
## and F9 airport has average delay of 21.9

## What airline corresponds to "F9" carrier code
## Using the airline dataframe in the "nycflights13" library
filter(airlines, carrier == "F9")

## Which plane(talinum) has worst on-time record
flights %>% 
  filter(!is.na(tailnum)) %>%
  mutate(on_time = !is.na(arr_time)&(arr_delay<=0)) %>%
  group_by(tailnum) %>% 
  summarise(
    on_time = mean(on_time), 
    n = n()
  ) %>%
  filter(min_rank(on_time)==1)
