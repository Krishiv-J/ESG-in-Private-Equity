#### Preamble ####
# Purpose: Simulates the data sets 
# Author: Krishiv Jain
# Date: 18 April 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)

#### SIMULATE DATA ####

set.seed(555) #random seed

# Stimulating the dataset

simulated_data <-  
  tibble(
    Firm = rep(1:100),    
    Funds = round(runif(100, min = 0, max = 200)),
    Fund_Size = runif(100, min = 100, max = 50000),
    IRR = runif(100, min = 0, max = 100),
    Staff_Count = round(runif(100, min = 0, max = 10000)),
    Average_Fund_Size = Fund_Size/Funds, 
    ESG_Score = round(runif(100, min = 0, max = 20)))

#### TEST DATA ####

##Check the minimum number is equal, or greater than, 0 ##
#Based on: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate
simulated_data$Funds |> min() >= 0
simulated_data$Staff_Count |> min() >= 0

##Check the class of the column is numeric##
simulated_data$Funds |> class() == "numeric"
simulated_data$Fund_Size |> class() == "numeric"
simulated_data$IRR |> class() == "numeric"
simulated_data$Staff_Count |> class() == "numeric"
simulated_data$Average_Fund_Size |> class() == "numeric"
simulated_data$ESG_Score |> class() == "numeric"

## Check that the columns only have whole numbers ##
#Based on: https://stackoverflow.com/q/3476782/23271634
is.wholenumber <- function(x, tol = .Machine$double.eps^0.5) abs(x - round(x)) < tol
is.wholenumber(simulated_data$ESG_Score)
is.wholenumber(simulated_data$Staff_Count)
