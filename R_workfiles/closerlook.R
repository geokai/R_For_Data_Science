# Most popular airports
sort(table(my_DF$Origin))
?sort

# look at the origin airports in order
# from least popular to most popular
sort(table(my_DF$Origin))

# by using the decreasing=T parameter when we sort
# These are the most popular ten airports,
# according to the number of origins of flights
sort(table(my_DF$Origin), decreasing = T)[1:10]
sort(table(my_DF$Dest), decreasing = T)[1:10]

# Remember that we have about 7 million flights altogether in 2008
dim(my_DF)

# These are the names of the 10 most popular airports in 2008
mostpopular <- names(sort(table(my_DF$Dest), decreasing = T)[1:10])

# We check each flight to see whether its origin was
# one of these 10 most popular airports

# to see if the first 20 airports are in the 10 most popular airports
(my_DF$Origin %in% mostpopular)[1:20]

# 2.3 million fo the 7 million flights had their origin
# in one of these popular cities
sum(my_DF$Origin %in% mostpopular)

# same concept, for the destinations
sum(my_DF$Dest %in% mostpopular)

# Find flights for which the origin and the destination
# were among the 10 most popular airports
sum(my_DF$Origin %in% mostpopular | my_DF$Dest %in% mostpopular)
# Half a million of the flights had both the origin and destination
# at one of the 10 most popular airports.

dim(sort(table(my_DF$Origin)))
names(sort(table(my_DF$Origin), decreasing=T)[104:303])


# Quiz 11
# These are the 200 least popular airports in - the sort is in (default) ascending
leastpopular <- names(sort(table(my_DF$Origin))[1:200])
length(leastpopular)

sum(my_DF$Origin %in% leastpopular)
# There were 551776 flights that originated from the 200 least popular airports

dim(my_DF)              # the dimension of a data frame - 7009728
length(my_DF)           # length of a data frame - 29
length(mostpopular)     # length of a vector - 10
dim(mostpopular)        # dimension of a vector - NULL
class(mostpopular)      # class of a vector - "character"

length((my_DF$Origin %in% mostpopular)[1:100]) # 100


head(my_DF$Origin == "IND") # this results in a TRUE/FALSE list
tail(my_DF$Origin == "IND") # this results in a TRUE/FALSE list


sum(my_DF$Origin == "IND")  # sum adds up the total: TRUE = 1, FALSE = 0
    # 42750 flights with origin as IND
sum(my_DF$Dest == "IND")  # sum adds up the total: TRUE = 1, FALSE = 0
    # 42732 flights with destination as IND



# Here is the table of how many flights originate at each airport
table(my_DF$Origin)

# We can index a vector according to the names of the elements
# in the vector
table(my_DF$Origin)["IND"]

# We can manually type the names of elements we want to extract
table(my_DF$Origin)[c("IND", "ORD", "JFK", "EWR", "IAD")]

# or we can save the indices of elements we want to extract
# into a vector, such as mostpopular:
mostpopular

# and use that whole vector as a set of indices into another vector
table(my_DF$Origin)[mostpopular]

# we can do this on the fly as well, for instance:
myairports <- c("IND", "ORD", "JFK", "EWR", "IAD")
myairports
# and use this as an index into the table of contents
table(my_DF$Origin)[myairports]
# and sorted:
sort(table(my_DF$Origin)[myairports], decreasing = TRUE)


# Quiz 12
# How many flights landed at Ronald Reagan Washington National (DCA)
# or Washington Dulles Airport (IAD) in 2008?
# Use one command to get results simultaneously.

# we want flights to all destinations and indexing only DCA and IAD:
table(my_DF$Dest)[c("DCA", "IAD")]
#
#

# Here are two ways to check the first 20 flights
# and see which ones departed on time (or early)
head(my_DF$DepDelay < 0, n=20)
(my_DF$DepDelay < 0)[1:20]

# This tells us how many flights at each airport
# departed on time or early
tapply(my_DF$DepDelay <= 0, my_DF$Origin, sum, na.rm=TRUE)
# This is the total number of flights
# that departed from each airport
table(my_DF$Origin)

# We can restrict attention to only the 10 most popular airports
tapply(my_DF$DepDelay <= 0, my_DF$Origin, sum, na.rm=TRUE)[mostpopular]
table(my_DF$Origin)[mostpopular]

# We divide each element in the first vector
# by the analogous element in the second vector
# This gives us basically 10 divisions in a row
tapply(my_DF$DepDelay <= 0, my_DF$Origin, sum, na.rm=TRUE)[mostpopular] / 
    table(my_DF$Origin)[mostpopular]
# and as a result, we know the percentage of the flights
# at each of the 10 most popular airports
# that departed on time or early

# double check the result for Atlanta (looks right)
233718 / 414513
#
#

# m A's (student) calcs:

# table showing the percentage of on time departures for every airport
percent_on_time <- tapply(my_DF$DepDelay <= 0, my_DF$Origin, sum, na.rm=TRUE) / 
    table(my_DF$Origin)

sort(percent_on_time)

# Create a histogram of the percent of on time flights
hist(percent_on_time)

# The airports with 90% or better on time departures
sort(percent_on_time[which(percent_on_time >= 0.9)])

# check results
sum(tapply(my_DF$DepDelay <= 0, my_DF$Origin, sum, na.rm=T) / table(my_DF$Origin) >= 0.9)


#
# Quiz 13
# What percentage of flights departed from IND on time or early?

# target all departure delays that left on time (or early)
# group by origin
# calculate the sum (discard the NAs) per origin airport
# index "IND" only
# divide by total number of flights originating from IND
# to give us the percentage of on-time flights
tapply(my_DF$DepDelay <= 0, my_DF$Origin, sum, na.rm=TRUE)["IND"] / 
    table(my_DF$Origin)["IND"]
#
#

# Re-visiting the plot

# We had already analyzed (in an earlier session)
# how many flights occur altogether, during each hour of the day
v <- table(cut(my_DF$DepTime, breaks=seq(0, 2400, by=100), dig.lab = 4, labels = NULL))

# Here is  another way to do that, by dividing each 4-digit time
# by 100, and then rounding the resulting  fraction up to the
# next closest integer
w <- table(ceiling(my_DF$DepTime / 100))

# all of the results from the two methods agree; none disagree
sum(v != w)
sum(v == w)

# Here is the analogous plot
# and the x-axis looks better than it did the first time
# that we visited this question
plot(w)
plot(v, las = 2)
#
#
v
w

# We can break the data in DepDelay vector
# according to which city or origin or according to the month
tapply(my_DF$DepDelay, my_DF$Origin, length)
tapply(my_DF$DepDelay, my_DF$Month, length)

# We now know how many flights occur from each airport in each month
tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month), length)

# We can extract the data from a particular row (i.e., origin airport)
# and from a particular column (i.e., the month)
tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month), length)["IND",6]
tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month), length)["ATL",3]

# notice that we need to give two dimensions when we extract data from a matrix
# we need to specify both the row and the column

# Here is the number of flights from three particular airports
# during the months 7, 8,9,10 (July through October)
tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month),
       length)[c("ATL","AUS","BDL"), c(7,8,9,10)]
# same effect, just writting 7:10 to get the vector c(7,8,9,10)
tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month),
       length)[c("ATL","AUS","BDL"), 7:10]


# how many flights departed altogether from ATL, AUS & BDL during
# the months of July 2008 through October 2008?
sum(tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month),
       length)[c("ATL","AUS","BDL"), 7:10])


# Leaving a specification blank:
# create a table with 3 rows (ATL, ORD & DFW)
# showing monthly counts of flights departing from each
# airport during 2008
tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month),
       length)[c("ATL","ORD","DFW"),]

# We can check that the result is a matrix
class(tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month), length)[c("IND","ORD"), ])


# how big is the matrix? should be 2-by-12
dim(tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month), length)[c("IND","ORD"), ])


# Calculating Percentages of Flights with Long Delays

# We make a data frame with all of the flights that are
# delayed more than 30 minutes when departing
longdelayDF <- subset(my_DF, my_DF$DepDelay > 30)
dim(longdelayDF)

# double-check
head(longdelayDF$DepDelay)

# The counts of all of the flights, from ORD or IND, according to month
tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month), length)[c("IND","ORD"), ]

# same thing, but now for the flights with delays or more than 30 minutes
tapply(longdelayDF$DepDelay, list(longdelayDF$Origin,longdelayDF$Month), length)[c("IND","ORD"), ]

# We can divide wntry by entry , to get the percentage of flights
# that have really long delays (more than 30 minutes) from IND or ORD
# broken up, month by month
M2 <- tapply(my_DF$DepDelay, list(my_DF$Origin,my_DF$Month), length)[c("IND","ORD"), ]      # the larger
M1 <- tapply(longdelayDF$DepDelay, list(longdelayDF$Origin,longdelayDF$Month), length)[c("IND","ORD"), ]    # the smaller

# here is the division; it yields the percentage of flights with long delays
M1/M2

# We can plot this with a dotchart
?dotchart
dotchart(M1/M2)

# M3 has the percentages of flights with long delays from IND or ORD, month-by-month
M3 <- M1/M2
dotchart(M3)
M3
M3["ORD", ] - M3["IND", ] > 0

# Quiz 15

# 1
# How Many flights departed altogether from IND or ORD in 2008 with
# a delay of more than 30 minutes each? * Use 'sum()' function
sum(tapply(longdelayDF$DepDelay, list(longdelayDF$Origin,longdelayDF$Month), length)[c("IND","ORD"), ])

#2
# In which month of 2008 was the percentage of long delays (i.e., flights with more than 30 minutes delays) the highest
# all flights for each month, sorted with decending order
# all flights departure delays more than 30 min divided by all flights departure delays to yield the percentage delay
# then sort in ascending/descending order
sort(tapply(longdelayDF$DepDelay, longdelayDF$Month, length) / tapply(my_DF$DepDelay, my_DF$Month, length), decreasing = TRUE)
# (This one stumped me - had to look at the comments, must sort this out *)


# Analyzing Flights by Time of Day for Departure

# Break the day into 4 parts:
# early morning (1) corresponds to times midnight to 6 AM
# late morning (2) corrsponds to times 6 AM to 12 noon
# early evening (3) corrsponds to times 12 noon to 6 PM
# late evening (4) corrsponds to times 6 PM to 12 midnight
v <- ceiling(my_DF$DepTime/600)

# build a vector called parts of day
# initially we put 7000000 NA values inside
partsofday <- rep(NA, times=dim(my_DF)[1])
head(partsofday)
length(partsofday)

partsofday[v == 1] <- "early morning"   # 00:00 - 06:00
partsofday[v == 2] <- "late morning"    # 06:00 - 12:00
partsofday[v == 3] <- "early evening"   # 12:00 - 18:00
partsofday[v == 4] <- "late evening"    # 18:00 - 00:00

table(partsofday)

# double-check that the length of partsofday vector is the same
# as the number of rows in the data frame my_DF
length(partsofday)
dim(my_DF)

# and then we can create a new column in the my_DF data frame called "timeofday"
# and we can store this information we just found into this column
my_DF$timeofday <- partsofday

# now our data frame my_DF has 30 columns instead of 29 columns
dim(my_DF)

# just check to make sure that the first 6 flights were done properly
head(my_DF$timeofday)
head(my_DF$DepTime)

tail(my_DF$timeofday)
tail(my_DF$DepTime)


# Quiz 16

# How many flights departed from IND early in the morning?

sum((my_DF$timeofday == "early morning") & (my_DF$Origin == "IND"), na.rm = TRUE)
# (derived from comments *)


# Analyzing Flights by Time of Day for Departure and Origin Airport

# We can tabulate how many flights occur, by splitting the flights according to
# both the city of origin and also the time of day when the flight departed
tapply(my_DF$DepDelay, list(my_DF$Origin, my_DF$timeofday), length)

# We get matrix with all of the results
class(tapply(my_DF$DepDelay, list(my_DF$Origin, my_DF$timeofday), length))
dim(tapply(my_DF$DepDelay, list(my_DF$Origin, my_DF$timeofday), length))
# We have a matrix with 303 rows (one row per city)
# and four columns (one column per time of day)

# We can restrict attention to the flights that departed from IND, CVG, or JFK
tapply(my_DF$DepDelay, list(my_DF$Origin, my_DF$timeofday), length)[c("IND","CVG","JFK"), ]
# Here we did not specify the columns, so as a result, we get all four possible columns

