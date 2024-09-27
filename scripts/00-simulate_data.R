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
      x = c(
        "Bloor Station", "Kennedy BD Station", "Finch Station", "Union Station",
        "Dundas Station", "Kipling Station", "College Station", "Eglinton Station"
      ),
      size = 1000,
      replace = TRUE
    ),

    # Simulating delay types randomly
    "Type of Delay" = sample(
      x = c("Signal Issue", "Mechanical Failure", "Weather Conditions", "Passenger Assistance"),
      size = 1000,
      replace = TRUE
    ),

    # Simulating delay duration in minutes
    "Delay Duration (Minutes)" = sample(
      x = 1:60,
      size = 1000,
      replace = TRUE
    )
  )

write.csv(simulated_ttc_delay_data, "data/00-simulated_data/simulated_data.csv", row.names = F)
