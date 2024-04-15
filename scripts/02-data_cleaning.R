#### Preamble ####
# Purpose: Cleans the raw data set prior to analysis and model creation
# Author: Krishiv Jain
# Date: 31 March 2024
# Contact: krishiv.jain@mail.utoronto.ca
# License: MIT
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Read Data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")
employee_data <- read_csv("data/raw_data/employee_data.csv")

### Remove Unneeded Columns ###


## Removing "general" information ##

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
raw_data$VCGrowthCapital <- NULL
raw_data$Firm_age <- NULL

## Removing Calculated Greenwashing Columns ##

raw_data$E_GreenwashingScore_1 <- NULL
raw_data$E_GreenwashingScore_2 <- NULL
raw_data$S_GreenwashingScore_1 <- NULL
raw_data$S_GreenwashingScore_2 <- NULL
raw_data$Total_GreenwashingScore_1 <- NULL
raw_data$Total_GreenwashingScore_2 <- NULL
raw_data$Other_GreenwashingScore_1 <- NULL
raw_data$Other_GreenwashingScore_2 <- NULL
raw_data$High_Frameworks <- NULL
raw_data$Medium_Frameworks <- NULL
raw_data$Low_Frameworks <- NULL
raw_data$Low_Medium_Frameworks <- NULL

## Removing Information used to calculate High/Low Framework ##

raw_data$Other_AlignwithSDGs <- NULL
raw_data$Other_AdoptSASBstandards <- NULL
raw_data$S_SponsorLevel20 <- NULL
raw_data$E_AdoptTCFD <- NULL
raw_data$E_CarbonNeutralProtocolCert <- NULL
raw_data$E_SignatoryNetZeroAsset <- NULL  
raw_data$E_SignatorytoICI <- NULL
raw_data$Other_SignatoryPRI <- NULL
raw_data$Other_AdoptAICGuidelines <- NULL
raw_data$S_SignatoryILPADiversity <- NULL
raw_data$S_SignatoryCEOAction <- NULL



raw_data$Log_Staffcount <- NULL
raw_data$LogFundSize_Calvin <- NULL
raw_data$LogFundSize_Preqin <- NULL
raw_data$Public <- NULL
raw_data$FundSize_Calvin <- NULL
raw_data$Sum_wirr_all <- NULL
raw_data$Diversified <- NULL
raw_data$Healthcare <- NULL
raw_data$Technology <- NULL
raw_data$ConsumerGoods <- NULL
raw_data$OtherIndustry <- NULL
raw_data$MissingIRR <- NULL
raw_data$BuyoutFund <- NULL
raw_data$Sum_wtvpi <- NULL
raw_data$Totalfundsraised10yearsmn <- NULL

raw_data$E_ALLSignatory <- NULL
raw_data$S_ALLSignatory <- NULL
raw_data$E_navigationalpage <- NULL
raw_data$S_navigationalpage <- NULL
raw_data$S_DEIpolicy <- NULL
raw_data$S_DEIcommittee <- NULL
raw_data$S_ChiefDiversityOfficer <- NULL
raw_data$S_10pctWomeninBoard <- NULL
raw_data$S_10pctWomeninLeadership <- NULL
raw_data$E_HasDocumentsorPages <- NULL
raw_data$S_HasDocumentsorPages <- NULL
raw_data$E_HasDocsOrMedia	<- NULL
raw_data$E_HasDocsOrMedia_2	<- NULL
raw_data$S_HasDocsOrMedia	<- NULL
raw_data$S_HasDocsOrMedia_2 <- NULL


## Removing Weighted Scores ##

raw_data$E_WeightedESGScore_1 <- NULL
raw_data$E_WeightedESGScore_2 <- NULL
raw_data$E_WeightedESGScore_5 <- NULL
raw_data$G_WeightedESGScore_1 <- NULL
raw_data$G_WeightedESGScore_2 <- NULL
raw_data$G_WeightedESGScore_5 <- NULL
raw_data$S_WeightedESGScore_1 <- NULL
raw_data$S_WeightedESGScore_2 <- NULL
raw_data$S_WeightedESGScore_5 <- NULL
raw_data$Other_WeightedESGScore_1 <- NULL
raw_data$Other_WeightedESGScore_2 <- NULL
raw_data$Other_WeightedESGScore_5 <- NULL
raw_data$Total_WeightedESGScore_1 <- NULL
raw_data$Total_WeightedESGScore_2 <- NULL
raw_data$Total_WeightedESGScore_3 <- NULL
raw_data$Total_WeightedESGScore_4 <- NULL
raw_data$Total_WeightedESGScore_5 <- NULL
raw_data$Total_WeightedESGScore_6 <- NULL
raw_data$Total_WeightedESGScore_7 <- NULL
raw_data$Total_WeightedESGScore_8 <- NULL

# Add New Employee #
raw_data$Staffcounttotal <- NULL
raw_data$Staff <- employee_data$`No. of Employees`

# Add Average Fund Size #
raw_data$Average_Fund_Size <- (raw_data$FundSize_Preqin/raw_data$Totalnumberoffunds)

#### Save data ####
write_csv(raw_data, "data/analysis_data/cleaned_data1.csv")
write_parquet(raw_data, "data/analysis_data/cleaned_data1.parquet")