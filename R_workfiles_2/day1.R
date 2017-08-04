# George Kaimakis
# 03.08.2017
# first R file, week 1

# Importing the data into a dataframe (variable)
my_DF <- read.csv("/Users/geomatus3/1.Projects/•FutureLearn/R_intro_data_science/dl_datasets/2008.csv")

head(my_DF, 10)

# these two functions in unison will give show us how many Dest and Origin vectors there are
length(unique(my_DF$Dest))
length(unique(my_DF$Origin))

# logical operators: TRUE and FALSE
head(my_DF$Origin == "IND")
# number of (sum) vectors
sum(my_DF$Origin == "IND")
sum(my_DF$Dest == "IND")

# new variables
lax_in <- sum(my_DF$Dest == "LAX")
lax_out <- sum(my_DF$Origin == "LAX")
lax_def <- lax_in - lax_out
lax_def

# use of operators
sum(my_DF$Dest == "ATL") - sum(my_DF$Origin == "ATL")

# logical operator application to find sum of flights from IND to ORD
sum((my_DF$Origin == "IND") & (my_DF$Dest == "ORD"))




