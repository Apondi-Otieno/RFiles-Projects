
library(tidyverse)
library(skimr)
library(psych)

# view all datasets in R
data()

#Reading data into R
data <- read.csv("data/kenya-hospital-ke-1.csv")

# Viewing data
View(data)

# Data dimensions
dim(data)

# Column names
names(data)

# glimpse your dataset
glimpse(data)

#head
head(data)

head(data,10)

#tail 
tail(data)

# number of columns
length(data)

# View type
class(data)

# View specific column
data$County

# unique values in that variable
unique(data$County)


#summary statistics

?describe

summary(data)

skim(data)

describe(data)

# convert to an integer
data$Beds <- as.integer(data$Beds)

describe(data$Beds)


#null values
is.na(data)

data[is.na(data$Location),]

View(data[is.na(data$Service_names),])









# find the no of hospitals in each county
# number of level 2 hospitals in each county


