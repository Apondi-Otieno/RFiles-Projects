
library(tidyverse)
library(dplyr)
glimpse(mtcars)

install.packages("nycflights13")

library(nycflights13)

flights

glimpse(flights) 

View(flights)

# arguments;
# dataset
# expression to manipulate the data


#filter

filter(flights,month == 1)

#to test

jan <- filter(flights, month == 1)

#logical operators

#or

filter(flights,month == 1 | dep_time ==517)


#and

filter(flights, month == 1 & dep_time ==517)

#not

filter(flights, !(month == 1))

# and not 

filter(flights, month == 1 & !(dep_time ==517))

# selecting multiple values
filter(flights, month %in% c(1,2,3,4,5)) 
    #selects flights in those months
filter(flights, carrier %in% c("UA", "AA")) 
    #selects flights in those airlines

# 1. flights that went to houston(hou)

filter(flights,dest == "HOU")
# 2. had an arrival delay of two hours
filter(flights, dep_delay ==2 )
# 3. flew from jfk to atl on july 7th
filter(flights,origin == "JFK" & month == 7 & day == 7)




# arrange -order values in ascending or descending order

arrange(flights, dep_time)

#descending order
arrange(flights,desc(dep_time))

#select by name
select(flights,year, month,day,dep_time)

#selecting columns between a range
select(flights, month:sched_dep_time)

#contains
select(flights,contains("dep"))


#matches
select(flights, matches("dep"))

#starts with
select(flights,starts_with("sched"))
select(flights,starts_with("time"))


#renaming columns
rename(flights,departure_time= dep_time)

# mutate
 mutate(flights,gain = arr_delay - dep_delay)
 
 #to see how long a flight took
 mutate(flights, delay  <- sched_arrr_time -arr_time)
 
 transmute(flights, arrival <- sched_arrr_time -arr_time)

#create a column called speed that calc speed of the flight
 
 # how do we create a column?
 
 transmute(flights,speed_per_hour <- distance/ (air_time*60)) #divide by 60 if time is in hrs
 
 # find the shortest and longest flights#
 
 #for the shortest
 arrange(flights, air_time)
 #for the longest
 arrange(flights,desc(air_time))
 
 
 (head(arrange(flights,air_time),1))
 
 
 
 #summarize
 # 1. aggregation functions
      #count
      #mean
      #standard deviation
      #
 # 

View(flights)

summarize(flights,day,count =n())

#pipe
flights
flights %% group_by(day)%%
  summarise(count=n())

#mean

by_month <-group_by(flights,month)
summarize(by_month,delay = mean(dep_delay, na,rn=TRUE))

carrier <- group_by(flights,carrier)
summarize(carrier,dist=mean(distance,na,rn=TRUE))

#sd

summarize(carrier, dist_sd = sd(disance,na,rm=TRUE))

flights %% group_by(carrier)%%
  summarise(dist = mean(distance,na,rm=TRUE))


# using flight data set

# 1. create a column that says the plane was later if the arrival time was after the scheduled
# arrival time

#renaming columns
rename(flights,departure_time= dep_time)

# mutate
mutate(flights,gain = arr_delay - dep_delay)



##########################################
# healthcare data set
##########################################


library(readr)
healthcare_facilities <- read_csv("Downloads/healthcare_facilities.csv")
View(healthcare_facilities)

# find the no of hospitals in each county  # use kenya hospital ke data

data %% group_by(County)%%
  summarise(count=n())

# number of level 2 hospitals in each county
data%%group_by(county)%%
  summarize(count = sum(kept.level == "level 2"))








