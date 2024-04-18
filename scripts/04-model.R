#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


# Load required libraries
library(tidyverse)
library(rstanarm)
library(broom.mixed)
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

# Extract coefficients using broom::tidy
tidy_model <- broom.mixed::tidy(model)

# Create summary table using gtsummary
summary_table <- tidy_model %>%
  select(term, estimate, std.error) %>%
  tbl_summary(
    by = NULL,
    statistic = list(estimate ~ "{mean} ({sd})"),
    digits = list(all_continuous() ~ 2)
  )

# Print summary table
summary_table


#### Save model ####
saveRDS(
  esg_model,
  file = "models/esg_model.rds"
)


