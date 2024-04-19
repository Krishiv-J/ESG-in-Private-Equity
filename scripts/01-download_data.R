#### Preamble ####
# Purpose: Downloads the required raw data and saves as a csv
# Author: Krishiv Jain
# Date: 31 March 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

## Workspace setup ##
library(tidyverse)
library(haven)

## Download paper's raw data ##
esg_data <-read_dta("data/raw_data/2396_ESG_Data_v1.0.dta")

## Save data ##
write_csv(esg_data, "data/raw_data/raw_data.csv")