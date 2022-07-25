# 1a Show and use a census API key that gives you access to the Census Bureau data. Do not use my API key, use and show your own key.

library(tidycensus)
library(tidyverse)
library(dplyr)
library(ggplot2)

census_api_key("2153faf1e1d25707ef71c8c464cb4c2c08be4e76")
install = TRUE


## 1b Using the link provided in your notes, secure a Census Bureau API key. Run the census code  that requires usage of the API key and then use R coding to produce a table that shows the totals for Asian Males for ages 67 to 69 by state for the year 2000. The identifier code is P012D021



totalasianmen <- get_decennial(geography = "state",
                               variables = "P012D021",
                               year = 2000)
totalasianmen



# 1c Show and use R code to find the mean, median, ,max, min, Q1, and Q3 for the median ages.

summary(totalasianmen$value)


# 1D Show and use R code (tidyverse/dplyr) coding to find the top ten states with
# highest populations of Asian Males whose ages are between 67 and 69.

select_state <- select(totalasianmen, NAME, value)

Topten_highest_population <- arrange(select_state, desc(value))
Topten_highest_population

# 2a Using the link provided in your notes, use and show R coding to produce
# a table that shows the median ages for Hispanic or Latino women for the year
#2010
# (Hint: the 8 character variable code starts with characters P013.
# Search in your table to get the other four characters.
# (Hint: Ctrl F speeds up the search process)


age_hispanic_women <- get_decennial(geography = "state",
                          variables = "P013H003",
                          year = 2010)
age_hispanic_women


# 2b Show and use R code to find the mean, median, ,max, min, Q1, and Q3 for
# the median ages

summary(age_hispanic_women$value)

# 2c Use ggplot coding to produce a Histogram of vertical orientation for the
# median ages for the table that you produced for 2a.

ggplot(age_hispanic_women, aes(x=value)) + geom_histogram()


# Produce a coding chunk using dplyr functions to generate a table that gives
# results for values that are greater than or equal to a median age of 25

great_age <- filter(age_hispanic_women, value >= 25)

great_age
