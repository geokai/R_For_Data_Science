# George Kaimakis
# 07 May 2017
# My first R file (week 1)

?read.csv


# Importing the data into a dataframe (variable)
my_DF <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/Intro to R for Data Science/2008.csv")

# printing to console the first 6 lines of the dataset
head(my_DF)

# printing the first 6 Origin values of the dataframe
head(my_DF$Origin)
tail(my_DF$Origin)
head(my_DF$Dest)
tail(my_DF$Dest)

# these two functions in unison will give show us how many Dest and Origin vectors there are
length(unique(my_DF$Dest))
length(unique(my_DF$Origin))

# logical operators: TRUE and FALSE
head(my_DF$Origin == "IND")
# number of (sum) vectors
sum(my_DF$Origin == "IND")
sum(my_DF$Dest == "IND")

head(my_DF$Origin == "ACY")
sum(my_DF$Origin == "ACY")

sum(my_DF$Origin == "ACK")
sum(my_DF$Origin == "EWR")
sum(my_DF$Dest == "EWR")
sum(my_DF$Origin == "EWR")
sum(my_DF$Dest == "OAK")

sum(my_DF$Origin == "LGA") + sum(my_DF$Origin == "JFK")
sum(my_DF$Dest == "LGA") + sum(my_DF$Dest == "JFK")

sum(my_DF$Origin == "SLC")
sum(my_DF$Dest == "SLC")

# new variables
lax_in <- sum(my_DF$Dest == "LAX")
lax_out <- sum(my_DF$Origin == "LAX")
lax_def <- lax_in - lax_out
lax_def

# use of operators
sum(my_DF$Dest == "ATL") - sum(my_DF$Origin == "ATL")

sum(my_DF$Origin == "ORD")
sum(my_DF$Dest == "ORD")

# logical operator application to find sum of flights from IND to ORD
sum((my_DF$Origin == "IND") & (my_DF$Dest == "ORD"))

# creating samller dataframes from the main overall dataframe, using 'subset'
my_indi_origins <- subset(my_DF, my_DF$Origin == "IND")

idiannapolisDestinations <- subset(my_DF, my_DF$Dest == "IND")

# reading first/last 6 lines of subsets
head(my_indi_origins)
tail(my_indi_origins)
head(idiannapolisDestinations)

# creating a table of the subset by month
table(my_indi_origins$Month)
# creating a plot of the same data
plot(table(my_indi_origins$Month))

table(idiannapolisDestinations$Month)
plot(table(idiannapolisDestinations$Month))

# subset of all flights with 'TUP' Origin
TUP_Origin <- subset(my_DF, my_DF$Origin == "TUP")
# use of 'mean' function on the departure delay time - this gave a negative meaning a mean early departure
mean(TUP_Origin$DepDelay)

# to find all flights before 0600 - this resulted in NA due to unknown values
sum(my_indi_origins$DepTime < 600)
?sum

# the use of the parameter 'na.rm = TRUE' is used to omit unknown values
sum(my_indi_origins$DepTime < 600, na.rm = TRUE)
sum(my_indi_origins$DepTime < 1200, na.rm = TRUE)
sum(my_indi_origins$DepTime < 1800, na.rm = TRUE)
sum(my_indi_origins$DepTime < 2400, na.rm = TRUE)

# sum of unknown departure time flights
sum(is.na(my_indi_origins$DepTime))
# simple calc
42011 + 739

# to return a list of all the header names (list of variables)
colnames(my_DF, do.NULL = TRUE, prefix = "col")
colnames(my_DF[5])
colnames(my_DF)

# subset of all flights to LAX
LAX_Dest <- subset(my_DF, my_DF$Dest == "LAX")

# number of flights from ATL to LAX
sum((my_DF$Origin == "ATL") & (my_DF$Dest == "LAX"))
# as a subset
ATL_LAX <- subset(my_DF, (my_DF$Origin == "ATL") & (my_DF$Dest == "LAX"))
# number of flights before noon from the ATL_LAX subset, omitting unknown values
sum(ATL_LAX$DepTime < 1200, na.rm = TRUE)


## ATL_LAX departure times grouped by hour ##


# this table shows ALL the departure times - not grouped by hour
table(ATL_LAX$DepTime)
?table
# and the plot
plot(table(ATL_LAX$DepTime))



?cut
?round
# this rounds up and down depending on the number - < or > 5
round(657/100, digits = 0)
637/100
?floor
# this will always go down (floor) regardless of the number
floor(657/100)  # (6.57) will eval to 6

# this table shows the depatures grouped by hour 0 to 23 and number of flights within each hour period
table(floor(ATL_LAX$DepTime/100))
# plot on an houly basis
plot(table(floor(ATL_LAX$DepTime/100)))
# the number of flights for a particular hour

