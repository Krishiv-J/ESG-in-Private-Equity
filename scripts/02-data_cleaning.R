#### Preamble ####
# Purpose: Cleans the raw data set prior to analysis and model creation
# Author: Krishiv Jain
# Date: 31 March 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

# Remove Unneeded Columns #

raw_data$established <- NULL
raw_data$International <- NULL
raw_data$Auditor_pct <- NULL
raw_data$Avg_vintage <- NULL
raw_data$Scale_number_portfolio_companies <- NULL
raw_data$EastCoast <- NULL
raw_data$WestCoast <- NULL
raw_data$OtherUSLocation <- NULL
raw_data$Total_EorSDocsOrMedia <- NULL
raw_data$Total_EorSDocsOrMedia_2 <- NULL
raw_data$Total_GreenwashingScore_1 <- NULL
raw_data$Total_GreenwashingScore_2 <- NULL
raw_data$Other_GreenwashingScore_1 <- NULL
raw_data$Other_GreenwashingScore_2 <- NULL
raw_data$VCGrowthCapital <- NULL
raw_data$Firm_age <- NULL
raw_data$Log_Staffcount <- NULL
raw_data$LogFundSize_Calvin <- NULL
raw_data$LogFundSize_Preqin <- NULL
raw_data$Public <- NULL
raw_data$FundSize_Calvin <- NULL
raw_data$Sum_wirr_preqin <- NULL
raw_data$Diversified <- NULL
raw_data$Healthcare <- NULL
raw_data$Technology <- NULL
raw_data$ConsumerGoods <- NULL
raw_data$OtherIndustry <- NULL
raw_data$MissingIRR <- NULL
raw_data$BuyoutFund <- NULL
raw_data$Sum_wtvpi <- NULL
raw_data$Totalfundsraised10yearsmn <- NULL


## New Employee Added ##
raw_data$Totalfundsraised10yearsmn <- NULL

#### Save data ####
write_csv(raw_data, "data/analysis_data/cleaned_data1.csv")
