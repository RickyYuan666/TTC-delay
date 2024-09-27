### Preamble ####
# Purpose: Downloads and loads the TTC Subway Delay Data
# Author: Ricky Yuan
# Date: 26 September 2024
# Contact: ricky.yuan@mail.utoronto.ca
# License: MIT
# Pre-requisites: tidyverse, opendatatoronto packages

#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)

#### Download data ####
# Search for the TTC Subway Delay Data package on OpenDataToronto
ttc_delay_package <- search_packages("TTC Subway Delay Data")

# Retrieve a list of all resources (datasets) available within the found package
ttc_delay_resources <- ttc_delay_package %>%
  list_package_resources()

# Display the available resources within the package
ttc_delay_resources

# Select the relevant dataset (adjust the index based on the correct dataset name)
ttc_delay_data <- ttc_delay_resources %>%
  filter(name == "ttc-subway-delay-data-2024") %>%
  get_resource()

#### Save data ####
# Save the downloaded raw data to the correct path with forward slashes
write_csv(ttc_delay_data, "data/01-raw_data/raw_data.csv")
