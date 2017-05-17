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


