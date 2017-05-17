# George Kaimakis
# # 15.05.2017

# Intro To R For Data Science

# This file is for creating the new data files (csv), Origin JFK and Dest LAX for years;
# 1988, 1992, 1996, 2000, 2004, 2008


# Importing the data into a dataframe (variable) for each year
main_DF <- read.csv("../../datasets/2008.csv")
# year 2008:
# Create a subset of my_DF with Origin; JFK and Dest; LAX
jfk_lax_2008 <- subset(main_DF, (my_DF$Origin == "JFK") & (my_DF$Dest == "LAX"))
# 8078 obs, 29 var

# Create a csv file of the (subset) new data frame and save it to the 'dataset' directory
write.csv(jfk_lax, file = "../datasets/jfk-lax_2008/jfkTolax2008.csv", na = "NA")


main_DF <- read.csv("../../datasets/2004.csv")
# year 2004:
# Create a subset of my_DF with Origin; JFK and Dest; LAX
jfk_lax_2004 <- subset(main_DF, (my_DF$Origin == "JFK") & (my_DF$Dest == "LAX"))
# .... obs, 29 var

# Create a csv file of the (subset) new data frame and save it to the 'dataset' directory
write.csv(jfk_lax, file = "../datasets/jfk-lax_2004/jfkTolax2004.csv", na = "NA")


main_DF <- read.csv("../../datasets/2000.csv")
# year 2000:
# Create a subset of my_DF with Origin; JFK and Dest; LAX
jfk_lax_2000 <- subset(main_DF, (my_DF$Origin == "JFK") & (my_DF$Dest == "LAX"))
# .... obs, 29 var

# Create a csv file of the (subset) new data frame and save it to the 'dataset' directory
write.csv(jfk_lax, file = "../datasets/jfk-lax_2000/jfkTolax2000.csv", na = "NA")

