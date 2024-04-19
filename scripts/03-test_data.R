#### Preamble ####
# Purpose: Testing the data set
# Author: Krishiv Jain
# Date: 18 April 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: Downloaded the cleaned data file from the analysis_data folder to run these tests


#### Workspace setup ####
library(tidyverse)
library(here)

#### READ DATA ####
cleaned_data <- read_csv(here("data/analysis_data/cleaned_data1.csv"))

#### TEST DATA ####

##Check the minimum number is equal, or greater than, 0 ##
#Based on: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate
cleaned_data$Totalnumberoffunds |> min() >= 0
cleaned_data$Staff_Count |> min() >= 0

##Check the class of the column is numeric##
cleaned_data$Totalnumberoffunds |> class() == "numeric"
cleaned_data$FundSize_Preqin |> class() == "numeric"
cleaned_data$Sum_wirr_preqin |> class() == "numeric"
cleaned_data$Staff_Count |> class() == "numeric"
cleaned_data$Average_Fund_Size |> class() == "numeric"
cleaned_data$ESG_Score |> class() == "numeric"

## Check that the columns only have whole numbers ##
#Based on: https://stackoverflow.com/q/3476782/23271634
is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol
is.wholenumber(cleaned_data$Staff_Count)
is.wholenumber(cleaned_data$ESG_Score)