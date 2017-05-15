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

# find the min and max flight distance to SJU in miles
min(my_DF$Distance[my_DF$Dest == "SJU"])
max(my_DF$Distance[my_DF$Dest == "SJU"])


# Make a plot of the average departure delays for each airport of
# origin.
# Calculate the average departure delay for each airport:
# 1. the vector: my_DF$DepDelay
# 2. the grouping: my_DF$Origin
# 3. the function: mean
# 4. allow for void values: na.rm=TRUE

# for the mean departure delay table
mean(sort(round(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE))))

# using 'abline()'
abline(h=mean(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE)))
?abline

# for the mean departure delay plot
plot(sort(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE)))


# Which airline have the best average Arrival Delay?
# Which airline have the worst average Arrival Delay?
sort(tapply(my_DF$ArrDelay, my_DF$UniqueCarrier, mean, na.rm=TRUE))

# 

# Which airline have the best average Departure Delay?
# Which airline have the worst average Departure Delay?
sort(tapply(my_DF$DepDelay, my_DF$UniqueCarrier, mean, na.rm=TRUE))

#

avgArrDly <- tapply(my_DF$ArrDelay, my_DF$UniqueCarrier, mean, na.rm=TRUE)
plot(avgArrDly)
axis(1, at = avgArrDly, labels = names(avgArrDly), las = 2)

sort(avgArrDly)

# and plot:
plot(sort(tapply(my_DF$ArrDelay, my_DF$UniqueCarrier, mean, na.rm=TRUE)))

# test for equal number of variables in each vector
length(my_DF$ArrDelay)
length(my_DF$UniqueCarrier)

# How many flights occur per month
table(my_DF$Month)
sort(tapply(my_DF$Month, my_DF$Month, length))

# How many flights each carrier had in total
sort(tapply(my_DF$UniqueCarrier, my_DF$UniqueCarrier, length))


# Which day of the week should we fly, if we want to minimize
# the expected arrival delay of the flight?
sort(tapply(my_DF$ArrDelay, my_DF$DayOfWeek, mean, na.rm=TRUE))
# Here 1 denotes Monday, 2 denotes Tuesday, ...., 7 denotes Sunday

# Answering the dame question, but restricting attention
# to flights that have IND as the destination airport.
# We get the average arrival day of the flights,
# for each day of the week, and restricting (only) to IND arrivals.
tapply(my_DF$ArrDelay[my_DF$Dest == "IND"],
       my_DF$DayOfWeek[my_DF$Dest == "IND"], mean, na.rm=TRUE)

# Just double-checking that we are working on two vectors
# that have the same lengths.
length(my_DF$ArrDelay[my_DF$Dest == "IND"])
length(my_DF$DayOfWeek[my_DF$Dest == "IND"])


sum(my_DF$Dest == "IND")


# On which day of the year were the expected ArrDelays the worst?
myDates <- paste(my_DF$Month, my_DF$DayofMonth, my_DF$Year, sep="/")
head(myDates)
tail(myDates)


length(my_DF$ArrDelay)
length(myDates)

# This is a leap year, 3 values for the result.
length(tapply(my_DF$ArrDelay, myDates, mean, na.rm=TRUE))

# Here are all 366 days in 2008,
# sorted according to the expected ArrDelay on that date.
sort(tapply(my_DF$ArrDelay, myDates, mean, na.rm=TRUE))

# The expected ArrDelay for each date,
# but only for the flights that are arriving at IND.
sort(tapply(my_DF$ArrDelay[my_DF$Dest == "IND"],
            myDates[my_DF$Dest == "IND"], mean, na.rm=TRUE))

# Checking that both vectors are the same length
length(my_DF$ArrDelay[my_DF$Dest == "IND"])
length(myDates[my_DF$Dest == "IND"])

# Quiz 9, Question 1
# to find which day of the year had the worst average departure delay times
# for all flights from all airports

# 1. vector: my_DF$DepDelay
# 2. grouping: day of the year (myDates)
# 3. function: mean

tail(sort(tapply(my_DF$DepDelay, myDates, mean, na.rm=TRUE)))


# Quiz 9, Question 2
# to find which day of the year had the worst average departure delay times
# for flights departing from O'Hare (ORD)

# 1. vector: my_DF$DepDelay
# 2. grouping: day of the year (myDates)
# 3. function: mean
# for index: [my_DF$Origin == "ORD"]

tail(sort(tapply(my_DF$DepDelay[my_DF$Origin == "ORD"],
                 myDates[my_DF$Origin == "ORD"], mean, na.rm=TRUE)))



# We can extend that example,
# now specify that the Dest airport is IND
# and that the Origin airport is ORD

head(my_DF$Dest == "IND")
head(my_DF$Origin == "ORD")

# This is a vestor that indentifies the flights
# which have Ind as Dest and have ORD as Origin
# It is a vector of 7 million TRUE's and FALSE's.
ordtoind <- my_DF$Dest == "IND" & my_DF$Origin == "ORD"

# We find the expected delay for flights from ORD to IND,
# categorized according to the date.
sort(tapply(my_DF$ArrDelay[ordtoind],
            myDates[ordtoind], mean, na.rm=TRUE) > 90)

# table: TRUE's & FALSE's
table(sort(tapply(my_DF$ArrDelay[ordtoind],
            myDates[ordtoind], mean, na.rm=TRUE) > 30))

# Quiz 10
# Flight from ATL to LAX in 2008.
# How many deys of the year were the average DepDelays
# MORE than 90 minuites?

# 1. vector: my_DF$DepDelay
# 2. grouping: day of the year (myDates)
# 3. function: mean
# for index: [my_DF$Origin == "ATL"] & [my_DF$Dest == "LAX"]

# Flights originating in ATL and arriving in LAX
ATLtoLAX <- my_DF$Origin == "ATL" & my_DF$Dest == "LAX"

# sorting for ATL to LAX by average DEpDelay
tail(sort(tapply(my_DF$DepDelay[ATLtoLAX],
                 myDates[ATLtoLAX], mean, na.rm=TRUE)))

# for average DepDelays greater than 90 mins
sum(tapply(my_DF$DepDelay[ATLtoLAX],
            myDates[ATLtoLAX], mean, na.rm=TRUE) > 90)

# Steve Cotton's solution:
table(tapply(my_DF$DepDelay[ATLtoLAX],
       myDates[ATLtoLAX], mean, na.rm=TRUE) > 90)

# DepDelays between 30 and 60 minuites for flights from ATL to LAX
table((tapply(my_DF$DepDelay[ATLtoLAX],
              myDates[ATLtoLAX], mean, na.rm=TRUE) > 30) &
          (tapply(my_DF$DepDelay[ATLtoLAX],
                  myDates[ATLtoLAX], mean, na.rm=TRUE) <60))



