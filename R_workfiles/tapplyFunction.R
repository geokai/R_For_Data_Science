# George Kaimakis
# 11 May 2017
# My 2nd R file (week 1)

# Importing the data into a dataframe (variable)
my_DF <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/Intro_to_R_for_Data_Science/datasets/2008.csv")

# printing to console the first 6 lines of the dataset
head(my_DF)


# Using tapply()
# how the tapply function works:
# 3 pieces of information:
# 1. the vector of data we want to apply a function to
# 2. the way to break up the data into pieces
# 3. the function we want to apply to the data

# 4. we can put as the 4th element extra information
#    for instance, very commonly, we use na.rm = TRUE

# Find the average departure delay at each airport.
# Here are the airports with the largest average departure delays
tail(sort(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE)))

# Here are the airports with the smallest average departure delays
head(sort(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE)))

# Here are the airports with the largest average arrival delays
tail(sort(tapply(my_DF$ArrDelay, my_DF$Dest, mean, na.rm=TRUE)))

# Here are the airports with the samllest average arrival delays
head(sort(tapply(my_DF$ArrDelay, my_DF$Dest, mean, na.rm=TRUE)))


# To calculate the average of the distances of flights to
# each airport and determine which airport has the largest
# average distance of flights arriving at that aiport

# 1. the vector of data: my_DF$Distance
# 2. the grouping: my_DF$Dest
# 3. the function: mean
# 4. allow for void values: na.rm=TRUE

# for the largest average distance
tail(sort(tapply(my_DF$Distance, my_DF$Dest, mean, na.rm=TRUE)))

# for the smallest average distance
head(sort(tapply(my_DF$Distance, my_DF$Dest, mean, na.rm=TRUE)))


# Make a plot of the average departure delays for each airport of
# origin.
# Calculate the average departure delay for each airport:
# 1. the vector: my_DF$DepDelay
# 2. the grouping: my_DF$Origin
# 3. the function: mean
# 4. allow for void values: na.rm=TRUE

# for the mean departure delay
mean(sort(round(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE))))

# for the median departure delay
plot(sort(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE)))

