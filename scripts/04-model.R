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


#### Read data ####
analysis_data <- read_csv("data/analysis_data/cleaned_data1.csv")



analysis_data1 <- analysis_data %>% 
  filter(ESG_Score != 0)



### Model data ####
first_model <-
  stan_glm(
    formula = flying_time ~ length + width,
    data = analysis_data,
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )

esg_neg_binomial <- stan_glm(
  ESG_Score ~ Totalnumberoffunds + FundSize_Preqin + Sum_wirr_preqin + Staff_Count + Average_Fund_Size,
  data = analysis_data1,
  family = neg_binomial_2(link = "log"),
  seed = 555
)


esg_neg_binomial5 <- stan_glm(
  ESG_Score ~ Totalnumberoffunds + FundSize_Preqin + Sum_wirr_preqin + Staff_Count + Average_Fund_Size,
  data = analysis_data1,
  family = neg_binomial_2(link = "identity"),
  seed = 555
)


esg_neg_binomial1 <- stan_glm(
  ESG_Score ~ Totalnumberoffunds,
  data = analysis_data1,
  family = neg_binomial_2(link = "identity"),
  seed = 555
)

esg_neg_binomial2 <- stan_glm(
  ESG_Score ~  Sum_wirr_preqin + Staff_Count + Average_Fund_Size,
  data = analysis_data1,
  family = neg_binomial_2(link = "log"),
  seed = 555
)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


