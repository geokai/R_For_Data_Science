# George Kaimakis
# some data analysis about Indianapolis flights

# inported all of the data from 2008 data set
# of the ASA Data Expo 2009
my_DF <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/R_intro_data_science/dl_datasets/2008.csv")

# here are the first six flights
head(my_DF)
# and the last six flights
tail(my_DF)

# In particular, here are airports that were the
# origins of the first six flights
head(my_DF$Origin)
# and the airports that were the origins of the last six flights
tail(my_DF$Origin)

# Here are the destination airports of the
# first and last six flights, respectively.
head(my_DF$Dest)
tail(my_DF$Dest)

# Here is the information about the first six flights that
# had IND as the origin
head(my_DF$Origin == 'IND')

sum(my_DF$Origin == 'IND')
    # FALSE values converted to 0's
    # TRUE values converted to 1's
    # sum just adds up the total,
    # which yields the number of flights departing from Indy in 2008
# There were 42750 such flights,
# which had IND as the origin

# Similarly, we had 42732 flights with IND as the destination
sum(my_DF$Dest == 'IND')


# how many flights departed form O'Hare airport in 2008
sum(my_DF$Origin == 'ORD')
# how many flights arrived at O'Hare airport in 2008
sum(my_DF$Dest == 'ORD')
# how many flights departed form indi and arrived in O'Hare airports in 2008
sum((my_DF$Origin == 'IND') & (my_DF$Dest == 'ORD'))

# Created a smaller data frame with *only* the flights
# in which IND is the origin city
my_indi_origins <- subset(my_DF, my_DF$Origin == "IND")

# Similarly we made a smaller data frame with the flights
# for which IND is the destination city
Indi_dests <- subset(my_DF, my_DF$Dest == "IND")

# Here are the first 6 flights of each of those new data frames.
head(my_indi_origins)
head(Indi_dests)


head(my_indi_origins$Month)
tail(my_indi_origins$Month)

# How many flights had IND as the origin city
# during each month of the year
table(my_indi_origins$Month)
# Now we can plot that data easily
plot(table(my_indi_origins$Month))

# Similarly for the flights for which IND was the destination
table(Indi_dests$Month)
plot(table(Indi_dests$Month))


tup <- subset(my_DF, my_DF$Origin == "TUP")

sum(table(tup$Origin)) # to sum the ones and zeros in the table:

# returns the average (mean) of the departure delays of the subset
mean(tup$DepDelay)

# Again, here are the first 6 flights for which IND is the origin
head(my_indi_origins)


sum(my_indi_origins$DepTime < 600, na.rm=TRUE)
    # this is the number of flights that departed before 6 AM
    # again, sum up TRUE's and FALSE's as 1.s and 0's resp.

sum(my_indi_origins$DepTime < 600, na.rm=TRUE)
# similarly, flights that departed before 12 noon, 6 PM, 12 midnight
sum(my_indi_origins$DepTime < 1200, na.rm=TRUE)     # 18705
sum(my_indi_origins$DepTime < 1800, na.rm=TRUE)     # 35004
sum(my_indi_origins$DepTime < 2400, na.rm=TRUE)     # 42011

# Note to purselves: the na.rm means to remove any values that
# were not known, i.e., that were appearing as "NA"

# Altogether we had 42011 flights departing by midnight
# and 739 flights that had NA for the departure time.
sum(is.na(my_indi_origins$DepTime)) # is.na checks for the number of NAs in the dataset:

42011 + 739 # = 42750 - sanity check of the numbers - 739 na's

# Quiz 5
los_angles <- subset(my_DF, my_DF$Dest == "LAX")

# how many flights arrived at LAX in 2008?
dim(los_angles)     # 215685

# how many flights departed from ATL and landed at LAX in 2008?
atl_lax <- subset(my_DF, (my_DF$Origin == "ATL") & (my_DF$Dest == "LAX"))
dim(atl_lax)    # 5406

# among the flights from ATL to LAX in 2008, how many departed before 12 noon?
sum(atl_lax$DepTime < 1200, na.rm=TRUE)     # 2133




