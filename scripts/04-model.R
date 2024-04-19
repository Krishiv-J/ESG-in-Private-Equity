#### Preamble ####
# Purpose: Creates a GLM for the cleaned dataset
# Author: Krishiv Jain
# Date: 18 April 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: The clean dataset from the analysis_data folder


# Load required libraries
library(tidyverse)
library(rstanarm)
library(broom.mixed)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_data1.csv")

### Model data ####
model <- stan_glm(
  ESG_Score ~ Totalnumberoffunds + FundSize_Preqin + Sum_wirr_preqin + Staff_Count + Average_Fund_Size,
  data = analysis_data,
  family = neg_binomial_2(link = "identity"),
  seed = 555
)

#### Save model ####
saveRDS(
  esg_model,
  file = "models/esg_model.rds"
)


