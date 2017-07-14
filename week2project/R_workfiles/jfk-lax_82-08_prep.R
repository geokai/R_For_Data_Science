# George Kaimakis
# # 15.05.2017

# Intro To R For Data Science

# This file is for creating the new data files (csv), Origin JFK and Dest LAX for years;
# 1988, 1992, 1996, 2000, 2004, 2008


# Importing the data into a dataframe (variable) for each year (overwrite to avoid memory problems)
main_DF <- read.csv("../../dl_datasets/2008.csv")
main_DF <- read.csv("../../dl_datasets/2004.csv")
main_DF <- read.csv("../../dl_datasets/2000.csv")
main_DF <- read.csv("../../dl_datasets/1996.csv")
main_DF <- read.csv("../../dl_datasets/1992.csv")
main_DF <- read.csv("../../dl_datasets/1988.csv")

# check to confirm the correct year
head(main_DF)
# remove to avoid memory problems
rm(main_DF)

# year 2008:
# Create a subset of my_DF with Origin; JFK and Dest; LAX
jfk_lax_2008 <- subset(main_DF, (main_DF$Origin == "JFK") & (main_DF$Dest == "LAX"))
# 8078 obs, 29 var
jfk_lax_2004 <- subset(main_DF, (main_DF$Origin == "JFK") & (main_DF$Dest == "LAX"))
# 8514 obs, 29 var
jfk_lax_2000 <- subset(main_DF, (main_DF$Origin == "JFK") & (main_DF$Dest == "LAX"))
# 9277 obs, 29 var
jfk_lax_1996 <- subset(main_DF, (main_DF$Origin == "JFK") & (main_DF$Dest == "LAX"))
# 7954 obs, 29 var
jfk_lax_1992 <- subset(main_DF, (main_DF$Origin == "JFK") & (main_DF$Dest == "LAX"))
# 6248 obs, 29 var
jfk_lax_1988 <- subset(main_DF, (main_DF$Origin == "JFK") & (main_DF$Dest == "LAX"))
# 4963 obs, 29 var

# check to confirm the correct year
head(jfk_lax_2008)
head(jfk_lax_2004)
head(jfk_lax_2000)
head(jfk_lax_1996)
head(jfk_lax_1992)
head(jfk_lax_1988)


# Create a csv file of the (subset) 2008 data frame and save it to the 'dataset' directory
write.csv(jfk_lax_2008, file = "../datasets/jfk-lax_2008/jfkTolax2008.csv", quote = FALSE, row.names = FALSE, na = "NA")

# Create a csv file of the (subset) 2004 data frame and save it to the 'dataset' directory
write.csv(jfk_lax_2004, file = "../datasets/jfk-lax_2004/jfkTolax2004.csv", quote = FALSE, row.names = FALSE, na = "NA")

# Create a csv file of the (subset) 2000 data frame and save it to the 'dataset' directory
write.csv(jfk_lax_2000, file = "../datasets/jfk-lax_2000/jfkTolax2000.csv", quote = FALSE, row.names = FALSE, na = "NA")

# Create a csv file of the (subset) 1996 data frame and save it to the 'dataset' directory
write.csv(jfk_lax_1996, file = "../datasets/jfk-lax_1996/jfkTolax1996.csv", quote = FALSE, row.names = FALSE, na = "NA")

# Create a csv file of the (subset) 1992 data frame and save it to the 'dataset' directory
write.csv(jfk_lax_1992, file = "../datasets/jfk-lax_1992/jfkTolax1992.csv", quote = FALSE, row.names = FALSE, na = "NA")

# Create a csv file of the (subset) 1988 data frame and save it to the 'dataset' directory
write.csv(jfk_lax_1988, file = "../datasets/jfk-lax_1988/jfkTolax1988.csv", quote = FALSE, row.names = FALSE, na = "NA")


