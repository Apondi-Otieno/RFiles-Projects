
library(tidyverse)

install.packages("nycflights13")

library(nycflights13)

glimpse(flights)


# Arguments
# - Dataset
# - Expression to manipulate the data


# Filter

filter(flights, month == 1)



# Logical operators


# OR 
filter(flights, month == 1 | dep_time == 517)

# AND
filter(flights, month == 1 & dep_time == 517)

# NOT
filter(flights, !(month == 1))

# AND NOT
filter(flights, month == 1 & !(dep_time == 517))


# Selecting multiple values
filter(flights, carrier %in% c("UA","AA"))



# Find the following:
# 1. Flew to Houston (HOU)

# 2. Had an arrival delay of two hours

# 3. Find flights flew from JFK to ATL on July 7th



# Arrange 

# ascending order
arrange(flights, dep_time)

# descending order
arrange(flights, desc(dep_time))


# SELECT 

# selecting by name
select(flights, year, month, day, dep_time)

# selecting columns between a range
select(flights, month:sched_dep_time)

# contains
select(flights, contains("dep"))

# matches
select(flights, matches("dep"))

# starts with
select(flights, starts_with("sched"))

# ends with
select(flights, ends_with("time"))

# Renaming columns
names(rename(flights, departure_time = dep_time))



# Mutate

View(mutate(flights, gain = arr_delay - dep_delay))

View(mutate(flights, delay <- sched_arr_time - arr_time))

transmute(flights, arrival <- sched_arr_time - arr_time)

mutate(flights, arrival <- sched_arr_time - arr_time)

# 1. Create a column called speed that calculates
# speed of the flight
transmute(flights, 
       speed_per_hour <- distance / air_time * 60
)


# Summarize

# Aggregation functions:
# - Count
# - Mean
# - Standard deviation

# Mean
by_month <- group_by(flights, month)
summarize(by_month, delay = mean(dep_delay, na.rm = TRUE))

carrier <- group_by(flights, carrier)
summarize(carrier, dist = mean(distance, na.rm=TRUE))

# Standard deviation
summarize(carrier, time = sd(air_time,na.rm=TRUE))

# Count
flights %>% group_by(carrier) %>%
  count()


# Pipe Operator

flights %>% group_by(carrier) %>%
  summarize(dist=mean(distance))

flights %>% group_by(origin) %>%
  summarize(average_delay = mean(arr_delay,na.rm=TRUE))


#. Create a column that says the plane was late if the
# arrival time was after the scheduled arrival time and 
# early if the arrival time is before the scheduled arrival
# time

flights %>% select(arr_time, sched_arr_time) %>%
  mutate(Status = ifelse(
    arr_time >= sched_arr_time , "Late", "On time"))




