# George Kaimakis
# 15.05.2017

# Intro To R For Data Science

# Week 2, Step 2.14

# Create your own data frame and carry out your own data analysis.

# The task:
# (for years 1988, 1992, 1996, 2000, 2004 and 2008)

# To show the change of number of flights with origin JFK and destination LAX
# over a period from 1988 to 2008 in 4 year steps.
# To compare the change of departure and arrival delays for flights
# departing from JFK and arriving at LAX from the years 1988 to 2008
# in 4 year steps.

# Read in each years dataset as a data frame
# 1988
jfk_lax_1988 <- read.csv("../datasets/jfk-lax_1988/jfkTolax1988.csv")
# 1992
jfk_lax_1992 <- read.csv("../datasets/jfk-lax_1992/jfkTolax1992.csv")
# 1996
jfk_lax_1996 <- read.csv("../datasets/jfk-lax_1996/jfkTolax1996.csv")
# 2000
jfk_lax_2000 <- read.csv("../datasets/jfk-lax_2000/jfkTolax2000.csv")
# 2004
jfk_lax_2004 <- read.csv("../datasets/jfk-lax_2004/jfkTolax2004.csv")
# 2008
jfk_lax_2008 <- read.csv("../datasets/jfk-lax_2008/jfkTolax2008.csv")


head(jfk_lax_1988)
rm(jfk_lax_1988)

