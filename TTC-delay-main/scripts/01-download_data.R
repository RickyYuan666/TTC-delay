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
  filter(name == "a.csv") %>%  # Replace "a.csv" with the actual name if necessary
  get_resource()

#### Save data ####
# Save the downloaded raw data to the correct path with forward slashes
write_csv(ttc_delay_data, "C:/Users/win/Desktop/STA304 Paper1/TTC-delay/starter_folder-main/data/a.csv")

#### Load data ####
# Load the saved dataset for analysis
data <- read_csv("C:/Users/win/Desktop/STA304 Paper1/TTC-delay/starter_folder-main/data/a.csv")

# Display the first few rows of the data to confirm successful loading
head(data)

         
