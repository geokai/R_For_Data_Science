# tapply function

# good practice to have the import at the top of the file
my_DF <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/R_intro_data_science/dl_datasets/2008.csv")


# how the tapply function works:
# 1. the vector of data we want to apply a functon to
# 2. the way to break up the data into pieces
# 3. the function we want to apply to the data

# 4. we can put as the 4th element extra information
#    for instance, very common;y, we use na.rm = TRUE

# find the average deaparture delays at each airport
# Here are the airports with the largest average departure delays
tail(sort(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE)))


# Here are the airports with the smallest average departures delays
head(sort(tapply(my_DF$DepDelay, my_DF$Origin, mean, na.rm=TRUE)))


# Here are the airports with the largest average arrival delays
tail(sort(tapply(my_DF$ArrDelay, my_DF$Origin, mean, na.rm=TRUE)))


# Here are the airports with the smallest average arrival delays
head(sort(tapply(my_DF$ArrDelay, my_DF$Origin, mean, na.rm=TRUE)))


# quiz 7

tail(sort(tapply(my_DF$Distance, my_DF$Dest, mean, na.rm=T)), 1)


# Which day of the week should we fly, if we want to minimize
# the expected arrival delay of the flight?

days <- c('mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun')

# work out the x axis marks to names of days
tapply(my_DF$ArrDelay, my_DF$DayOfWeek, mean, na.rm = TRUE)
plot(tapply(my_DF$ArrDelay, my_DF$DayOfWeek, mean, na.rm = TRUE), xlab = 'day of week', ylab = 'ave delay in mins', type = 's')
?plot

# Answering the same question, but restricting attention
# to flights that have IND as the destination airport
# We get the average arrival day of the flights,
# for each day of the week, and restricting (only) to IND arrivals.
tapply(my_DF$ArrDelay[my_DF$Dest == 'IND'],
       my_DF$DayOfWeek[my_DF$Dest == 'IND'], mean, na.rm = TRUE)

# this shows the vectors are of the same length as required for the tapply
# Just double-checking that we are working on two vectors
# that have the same lengths.
length(my_DF$ArrDelay[my_DF$Dest == 'IND'])
length(my_DF$DayOfWeek[my_DF$Dest == 'IND'])


# Which airlines have the best arrival delays?
# Which have the worst average Arrival Delays?
tapply(my_DF$ArrDelay, my_DF$UniqueCarrier, mean, na.rm=TRUE)


# In which month are there the most lfights
table(my_DF$Month)
tapply(my_DF$Month, my_DF$Month, length)


# quiz 8
# Which airline has the worst average departure delay?

sort(tapply(my_DF$DepDelay, my_DF$UniqueCarrier, mean, na.rm = TRUE))


# On which days of the year were the expected ArrDelays the worst?
mydates <- paste(my_DF$DayofMonth, my_DF$Month, my_DF$Year, sep="/")

# Compare the lengths of the vectors:
length(my_DF$ArrDelay)
length(mydates)

# 

# This is a leap year, so we get 366 values for the result.
length(tapply(my_DF$ArrDelay, mydates, mean, na.rm=TRUE))

# Here are all 366 days in 2008,
# according to the expected ArrDelay on that date.
sort(tapply(my_DF$ArrDelay, mydates, mean, na.rm=TRUE))

# The expected ArrDelay for each date,
# but only for the flights that are arriving to IND.
sort(tapply(my_DF$ArrDelay[my_DF$Dest == 'IND'],
            mydates[my_DF$Dest == 'IND'], mean, na.rm=TRUE))

# quiz 9
# Q1
# On which day of the year were the average departure dalays the worst:

sort(tapply(my_DF$DepDelay, mydates, mean, na.rm=TRUE))

# Q2
# On which day of the year were the average departure times the worst
# for flights departing from O'Hare (ORD)

sort(tapply(my_DF$DepDelay[my_DF$Origin == "ORD"],
            mydates[my_DF$Origin == "ORD"], mean, na.rm=TRUE))


# We car extend that example,
# now specify that the Deat airport is IND
# and that hte Origin airport is ORD

# This is a vector that identifies the flights
# which have OND as Dest and have ORD as the Origin
# It is a vector of 7 million TRUE's and FALSE's.
ordtoind <- my_DF$Dest == "IND" & my_DF$Origin == "ORD"

# We find the expected arrival delay for flights
# from ORD to IND, categortized according to the date.

sort(tapply(my_DF$ArrDelay[ordtoind],
            mydates[ordtoind], mean, na.rm=TRUE))


# Quiz 10
# Concider flights that deaparted from ATL and landed at LAX in 2008.
# For how many days of the year were the average departure delays
# more than 90 minutes?

atlTolax <- my_DF$Origin == "ATL" & my_DF$Dest == "LAX"

sum(tapply(my_DF$DepDelay[atlTolax], mydates[atlTolax], mean, na.rm=TRUE) > 90)










