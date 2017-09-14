# George Kaimakis
# some data analysis about Indianapolis flights


my_DF <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/R_intro_data_science/dl_datasets/2008.csv")

#
# Most popular airports
sort(table(my_DF$Origin))

# look at the origin aiports in order
# from most popular to least popular
# by using the 'decreasing=TRUE' parameter when we sort
sort(table(my_DF$Origin), decreasing=TRUE)[1:10]
# These are the most popular ten airports,
# according to the number of origins of flights

sort(table(my_DF$Dest), decreasing=TRUE)[1:10]

# Remember that we have about 7 million flights altogether in 2008
dim(my_DF)

# These are the names of the 10 most popular airports in 2008
# names is a function:
#
names(sort(table(my_DF$Origin), decreasing=TRUE))   # this gives all the names only
# now assign to a variable:
mostpopular <- names(sort(table(my_DF$Dest), decreasing=TRUE)[1:10])
mostpopular <- names(sort(table(my_DF$Origin), decreasing=TRUE)[1:10])



# We check each flight to see whether its origin was
# one of these 10 most popular airports
# we use %in% instead of == because we are asking if something is 'in' a group, not equals to a group

# 2.3 million of the 7 million flights had their origin
# in one of these popular cities
sum(my_DF$Origin %in% mostpopular)

# same comcept, for the destination
sum(my_DF$Dest %in% mostpopular)

# Find flights for which the origin and the destination
# were among the 10 most popular airports
sum(my_DF$Origin %in% mostpopular & my_DF$Dest %in% mostpopular)
# Half a million of the flights had origin and destination
# at one of the 10 most popular airports



# Quiz 11
# 200 least popular airports according to the number of flighs
leastpopular <- names(sort(table(my_DF$Origin))[1:200])
sum(my_DF$Origin %in% leastpopular)



# this gives us the position of an entry, 'BOS' in this case
which(names(sort(table(my_DF$Origin), decreasing=TRUE)) == 'BOS')

# using this list:
list <- c('BOS', 'ATL', 'LAX')
# we get the positional index of each but not in the order given in the list
# using the 'which' function:
which(names(sort(table(my_DF$Origin), decreasing=TRUE)) %in% list)
# [1] 1  5 18
# these results are in the wrong order to the places in the list
# find how to return the place with its position in the list given.

?which





