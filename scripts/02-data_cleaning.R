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

ttc_delay_raw_data <- read_csv("data/01-raw_data/raw_data.csv")

# This code is based on knowledge from Alexander (2023).

ttc_delay_cleaned_data <-
  ttc_delay_raw_data |>
  # Selecting columns of interest
  select(`Station`, `Min Delay`, `Date`, `Time`, `Line`) |>
  # Renaming the columns for clarity
  rename(`Delay Duration (Minutes)` = `Min Delay`) |>
  # Converting station names to title case
  mutate(Station = str_to_title(Station)) |>
  # Filtering out rows with missing values in key columns
  filter(!is.na(`Delay Duration (Minutes)`), !is.na(Station)) |>
  # Converting the delay duration column to numeric (if necessary)
  mutate(`Delay Duration (Minutes)` = as.numeric(`Delay Duration (Minutes)`)) |>
  # Converting date to proper date format
  mutate(Date = as.Date(Date, format = "%Y-%m-%d")) %>% 
  # Remove observations with missing values
  na.omit()


#### Saving the Cleaned Dataset ####
write_csv(ttc_delay_cleaned_data, "data/02-analysis_data/analysis_data.csv")
