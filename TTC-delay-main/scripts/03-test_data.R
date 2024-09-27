#### Preamble ####
# Purpose: Runs tests on the simulated dataset and the cleaned TTC delay dataset
# to check the validity of the entries.
# Author: Ricky Yuan
# Date: September 26, 2024
# Contact: ricky.yuan@mail.utoronto.ca
# Pre-requisites: Run the files "01-download_data.R", "02-data_cleaning.R", and "00-simulate_data.R".

#### Loading Packages ####

# install.packages("tidyverse")
library(tidyverse)

#### Testing the Simulated Dataset ####

# This code was adapted from Alexander (2023).

# Load the simulated dataset
simulated_ttc_delay_data <- read_csv("C:/Users/win/Desktop/TTC-delay-main/outputs/data/simulated_ttc_delay_data.csv")

# Running the tests on the simulated dataset

# Checking the class of some of the columns

simulated_ttc_delay_data$Station |> class() == "character"
simulated_ttc_delay_data$`Type of Delay` |> class() == "character"
simulated_ttc_delay_data$`Delay Duration (Minutes)` |> class() == "integer"

# Checking that the minimum value in the ID column is at least 1
simulated_ttc_delay_data$ID |> min() >= 1

# Checking that the simulated stations are within the valid set
simulated_ttc_delay_data$Station |>
  unique() |>
  sort() == sort(c("Bloor Station", "Kennedy BD Station", "Finch Station", 
                   "Union Station", "Dundas Station", "Kipling Station", 
                   "College Station", "Eglinton Station"))

# Checking that only 8 stations are present
simulated_ttc_delay_data$Station |>
  unique() |>
  length() == 8

# Checking that only valid delay types are present
simulated_ttc_delay_data$`Type of Delay` |>
  unique() |>
  sort() == sort(c("Signal Issue", "Mechanical Failure", "Weather Conditions", "Passenger Assistance"))

# Checking that only 4 delay types are present
simulated_ttc_delay_data$`Type of Delay` |>
  unique() |>
  length() == 4


#### Testing the Cleaned Dataset ####

# Loading the cleaned dataset
cleaned_ttc_delay_data <- read_csv("C:/Users/win/Desktop/TTC-delay-main/outputs/data/cleaned_data.csv")

# Running the tests on the cleaned dataset

# Checking the class of some of the columns

cleaned_ttc_delay_data$Station |> class() == "character"
cleaned_ttc_delay_data$`Type of Delay` |> class() == "character"
cleaned_ttc_delay_data$`Delay Duration (Minutes)` |> class() == "numeric"

# Checking that the minimum value in the ID column is at least 1
cleaned_ttc_delay_data$ID |> min() >= 1

# Checking that the only 8 stations are present
cleaned_ttc_delay_data$Station |>
  unique() |>
  sort() == sort(c("Bloor Station", "Kennedy BD Station", "Finch Station", 
                   "Union Station", "Dundas Station", "Kipling Station", 
                   "College Station", "Eglinton Station"))

# Checking that only valid delay types are present
cleaned_ttc_delay_data$`Type of Delay` |>
  unique() |>
  sort() == sort(c("Signal Issue", "Mechanical Failure", "Weather Conditions", "Passenger Assistance"))

# Checking that the delay duration values are reasonable
cleaned_ttc_delay_data$`Delay Duration (Minutes)` |> max() <= 60
cleaned_ttc_delay_data$`Delay Duration (Minutes)` |> min() >= 0


