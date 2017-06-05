df1 <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/Intro_to_R_for_Data_Science/dl_datasets/2006.csv")
df2 <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/Intro_to_R_for_Data_Science/dl_datasets/2007.csv")
df3 <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/Intro_to_R_for_Data_Science/dl_datasets/2008.csv")
dim(df1)
dim(df2)
dim(df3)

# Using rbind() we can aggregate two or more data frames into one new complete data frame
mynew_DF <- rbind(df1, df2, df3)
dim(mynew_DF)
# the original data frames can now be removed (delated from the Glabal Environment - memory)
rm(df1,df2,df3)
# having a look at the head of the new data frame
head(mynew_DF)
# ...and the tail
tail(mynew_DF)
# the data frame shows the columns as we expect to see them

# this will show the values in the Year column - unique() shows each unique entry once only
unique(mynew_DF$Year)


# Quiz 17
# How many flights departed altogether from LAX during the period
# 2006 to 2008?

sum(mynew_DF$Origin == "LAX")


# 4.3 Efficiently Storing Origin-to-Destination Flight Paths

# We can make a table with 315 rows and 321 columns,
# so that each entry corresponds to a unique Origin and Destination pair
mytable <- table(list(mynew_DF$Origin, mynew_DF$Dest))
head(mytable)
dim(mytable)
315*321

sum(mytable == 0)
sum(mytable != 0)

mynewtable <- table(paste(mynew_DF$Origin, mynew_DF$Dest, sep = " > "))
length(mynewtable)
head(mynewtable)
tail(mynewtable)
mynewtable

# Quiz 18
# Q1: How many flights were there from IND to ORD from 2006 to 2008?
mynewtable["IND > ORD"]

class(mynewtable)   # "table"
dim(mynewtable)     # [1] 6266
length(mynewtable)  # [1] 6266
# This is a single dimension 'list' of items

# Q2: Make a table that counts the number of entries (simultaneously)
# according to the origin, destination and year. How many flights were
# there from BOS to DEN in 2007? Use the same data frame we already
# built. Do not reload all of the 2007 data.

# create a new 'table' for "Origin", "Dest" and "Year" (2007)
table_2007 <- table(paste(mynew_DF$Origin, mynew_DF$Dest, mynew_DF$Year))

# to verify the table formed and looks resonable
head(table_2007)

table_2007["BOS DEN 2007"]

table_2007


# create a new subset for the year 2007 only from the main dataframe
only_2007 <- subset(mynew_DF, mynew_DF$Year == "2007")
head(only_2007)
tail(only_2007)

# create a new table with this(2007) data
mynewtable <- table(paste(only_2007$Origin, only_2007$Dest, sep = " > "))
head(mynewtable)
tail(mynewtable)

# extract the relevent info
mynewtable["BOS > DEN"]
mynewtable["ABE > CLE"]
mynewtable["YUM > PHX"]

# 4.5 Visualizing Flight Paths

# neither of these plots are very helpful
plot(mynewtable)
dotchart(mynewtable)

# we could try to sort the data first
dotchart(sort(mynewtable))

# we are focusing on the flights with IND as the origin
plot(mytable["IND", ])
dotchart(mytable["IND", ])

# save that flight data into a vector
v <- mytable["IND", ]

# now we only plot the flights from IND to airports that have at least one flight
dotchart(sort(v[v != 0]))

dotchart(sort(v[v > 4000]))


# 4.6 Create a Visualization



# 4.7 - Incoorporating Auxiliary Data about Airports

# Importing the data about the airports themselves (locations, etc.)
airportsDF <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/Intro_to_R_for_Data_Science/dl_datasets/airports.csv")
dim(airportsDF)

head(airportsDF, n=100)
airportsDF[airportsDF$iata == "IND", ]
airportsDF[airportsDF$iata %in% c("IND","ORD","MDW"), ]

# We made a vector to store the airport name, city, state
w <- paste(airportsDF$airport, airportsDF$city, airportsDF$state, sep = ", ")
head(w)
tail(w)

# We are going to make the "name" of each entry in the vector
# be the 3 letter airport code itself
names(w) <- airportsDF$iata
head(w)
tail(w)
class(w)
w[c("IND","ORD","MDW")]
# We can now use the airport 3 letter code to 'index' th entry in the vector
w["CMH"]
w["JFK"]

head(airportsDF)
head(w)
sum(airportsDF$city == "Chicago", na.rm = TRUE)
tapply(airportsDF$iata, airportsDF$city == "Chicago", length)
table(airportsDF$city == "Chicago")



# 4.9 Revising Visualizations of
# Flight Paths

# remember that this is the data we plotted in the dotchart
v[v > 4000]

# we still do not know where (city, state) these airports are located
# unless we just recognized the airport codes

w[names(v[v > 4000])]

# this is the data that we plotted
myvec <- v[v > 4000]
names(myvec) <- w[names(v[v > 4000])]

myvec
sort(myvec)
dotchart(myvec)
dotchart(sort(myvec))


# 4.10 Identifying Airports with
# Commercial Flights

head(airportsDF)
table(airportsDF$state)

subset(airportsDF, state == "IN")
dim(subset(airportsDF, state == "IN"))

indyairport <- subset(airportsDF, state == "IN")

# we can make a table that shows all of the flight counts
# (as origins) for all airports in the full data set from 2006 to 2008
# (not just Indiana airports)
table(mynew_DF$Origin)
table(mynew_DF$Origin)["IND"]
table(mynew_DF$Origin)["ORD"]

# we convert the class from factor to character
as.character(indyairport$iata)
# and make a table of the data
table(mynew_DF$Origin)[as.character(indyairport$iata)]
# save to a vector
v <- table(mynew_DF$Origin)[as.character(indyairport$iata)]
# we find all the entries that are not NAs
v[!is.na(v)]
# extract the names as characters
names(v[!is.na(v)])
# we use all of the above to create a subset of airports that have commercial flights in the state of Indiana
subset(airportsDF, iata %in% names(v[!is.na(v)]))


# 4.11 Quiz 20
# How many airports in California had at least one flight
# in the data set during the period, 2006 to 2008?

# create a vector containing all California airports
calairports <- subset(airportsDF, state == "CA")
# check
head(calairports)
# the number of airports:
dim(calairports)
# 205 airports in California
# convert the airport names to character
as.character(calairports$iata)
# create a new vector of all the CA airports
c <- table(mynew_DF$Origin)[as.character(calairports$iata)]
# the airports that have commercial flights - no NAs
c[!is.na(c)]
# create a subset of California airports that have commercial flights
com_CA <- subset(airportsDF, iata %in% names(c[!is.na(c)]))
dim(com_CA)
# [1] 2 7 - the dimension of the date frame, 26 rows (number of airports), with 7 variables

# 4.12 Creating and Applying Functions Built
# by the Learner

# lets build a function that for a state given by the user
# will identify all of the airports in the 2006 to 2008 data set
# that have commercial flights from that state

# start with "IN" as the state example
# succinctly, this summarizes what we di in the previous video
mystate <- "IN"
myairport <- subset(airportsDF, state == mystate)
v <- table(mynew_DF$Origin)[as.character(myairport$iata)]
subset(airportsDF, iata %in% names(v[!is.na(v)]))

# now we wrap this into a function that lets us do this for any state
# the name of the function I am creating is called "activairports"
# because that is the information it finds
# it only needs 1 input, namely, the state to look in
activeairports <- function(mystate) {
    myairport <- subset(airportsDF, state == mystate)
    v <- table(mynew_DF$Origin)[as.character(myairport$iata)]
    subset(airportsDF, iata %in% names(v[!is.na(v)]))
}

# seems to work well for the Indiana airports
activeairports("IN")
# how about Illinois?
activeairports("IL")
# what about California?
activeairports("CA")
dim(activeairports("CA"))

# 4.13 How Many Airports?
# "state.abb"
?state.abb
state.abb

# this applies the fuction, 'activeairports() to all the contents of the 'state.abb' vector (all the states)
sapply(state.abb, function(x) dim(activeairports(x))[1])
# this applies the function to only "CA"
sapply("CA", function(x) dim(activeairports(x))[1])
# this code gives the number of entries (length() of vector)
length(sapply(state.abb,function(x) dim(activeairports(x))[1]))
# the first part ([1]) of the matrix (the one dimension)
dim(activeairports("IN"))[1]











