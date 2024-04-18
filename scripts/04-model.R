#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(modelsummary)
library(dplyr)
library(tidyr)
library(gtsummary)



#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_data1.csv")

### Model data ####

model <- stan_glm(
  ESG_Score ~ Totalnumberoffunds + FundSize_Preqin + Sum_wirr_preqin + Staff_Count + Average_Fund_Size,
  data = analysis_data,
  family = neg_binomial_2(link = "identity"),
  seed = 555
)

modelsummary(model)

tbl_regression(esg_model)


#### Save model ####
saveRDS(
  esg_model,
  file = "models/esg_model.rds"
)


