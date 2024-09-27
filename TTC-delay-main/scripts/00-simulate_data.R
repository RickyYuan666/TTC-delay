#### Preamble ####
# Purpose: Simulates transit delay data
# Author: Ricky Yuan
# Date: 26 September 2024
# Contact: ricky.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the janitor (Firke 2023) and tidyverse (Wickham et al. 2019) packages.

#### Loading Packages ####

# install.packages("janitor")
# install.packages("tidyverse")
library(janitor)
library(tidyverse)

#### Data Simulation ####

set.seed(909)

# This code was adapted from Alexander (2023).

simulated_ttc_delay_data <-
  tibble(
    # Simulating 1000 delay data points
    "ID" = 1:1000,
    
    # Simulating station names randomly
    "Station" = sample(
      x = c("Bloor Station", "Kennedy BD Station", "Finch Station", "Union Station", 
            "Dundas Station", "Kipling Station", "College Station", "Eglinton Station"),
      size = 1000,
      replace = TRUE),
    
    # Simulating delay types randomly
    "Type of Delay" = sample(
      x = c("Signal Issue", "Mechanical Failure", "Weather Conditions", "Passenger Assistance"),
      size = 1000,
      replace = TRUE),
    
    # Simulating delay duration in minutes
    "Delay Duration (Minutes)" = sample(
      x = 1:60,
      size = 1000,
      replace = TRUE)
  )

#### Testing the Simulated Dataset ####

# This code was adapted from Alexander (2023).

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

# Checking that there are only 8 stations present
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
