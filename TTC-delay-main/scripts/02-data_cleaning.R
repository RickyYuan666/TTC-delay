### Preamble ####
# Purpose: Cleans the raw TTC Subway delay data
# Author: Ricky Yuan
# Date: 26 September 2024
#### Preamble ####
# Purpose: Cleans the raw TTC delay dataset obtained in "01-download_data.R".
# Author: Ricky Yuan
# Date: September 29, 2024
# Contact: ricky.yuan@mail.utoronto.ca
# Pre-requisites: Run the file "01-download_data.R".

#### Loading Packages ####

# install.packages("tidyverse")
library(tidyverse)

#### Cleaning the Dataset ####

ttc_delay_raw_data <- read_csv("C:/Users/win/Desktop/TTC-delay-main/outputs/data/ttc_delay_raw_data.csv")

# This code is based on knowledge from Alexander (2023).

ttc_delay_cleaned_data <-
  ttc_delay_raw_data |>
  
  # Selecting columns of interest
  select(`ID`, `Station`, `Type of Delay`, `Min Delay`, `Date`, `Time`) |>
  
  # Renaming the columns for clarity
  rename(`Delay Duration (Minutes)` = `Min Delay`,
         `Delay Type` = `Type of Delay`) |>
  
  # Converting station names to title case
  mutate(Station = str_to_title(Station)) |>
  
  # Filtering out rows with missing values in key columns
  filter(!is.na(`Delay Duration (Minutes)`), !is.na(Station), !is.na(`Delay Type`)) |>
  
  # Converting the delay duration column to numeric (if necessary)
  mutate(`Delay Duration (Minutes)` = as.numeric(`Delay Duration (Minutes)`)) |>
  
  # Converting date to proper date format
  mutate(Date = as.Date(Date, format = "%Y-%m-%d")) |>
  
  # Cleaning and categorizing delay types for better analysis
  mutate(`Delay Type` = case_when(
    str_detect(`Delay Type`, "Signal") ~ "Signal Issue",
    str_detect(`Delay Type`, "Mechanical") ~ "Mechanical Failure",
    str_detect(`Delay Type`, "Weather") ~ "Weather Conditions",
    str_detect(`Delay Type`, "Passenger") ~ "Passenger Assistance",
    TRUE ~ "Other"
  ))

#### Saving the Cleaned Dataset ####

write_csv(ttc_delay_cleaned_data, "C:/Users/win/Desktop/TTC-delay-main/outputs/data/cleaned_data.csv")
