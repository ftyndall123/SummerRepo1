library(tidycensus)
library(rvest)
library(dplyr)
library(tidyverse)


# Show and use a census API key that gives you access to the ACS data.
# Do not use my API key, use and show your own key.

census_api_key("2398180071d436d7b99c3fed84a8602682576343")
install = TRUE

v15 <- load_variables(2015, "acs5", cache = TRUE)
view(v15)




#Using ACS census data from 2015, show and use R code to do the
#following to produce a tibble that shows the median income estimates
#and the margin of errors for white males age 35 - 44 in the counties
#of California. The required variable code starts with the characters BO1OO1.
#Use the table to find the other characters.

Cal <- get_acs(geography = "county",
               variables = c(medincome = "B01001"),
               state = " California",
               year = 2015)

Cal

