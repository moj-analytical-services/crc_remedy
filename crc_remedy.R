#Run Initialisation.R in the folder before starting
#test run


# #Packages needed --------------------------------------------------------

#Installing useful packages
# install.packages("tidyverse")
# install.packages("openxlsx")
# install.packages("testthat")
# install.packages("readxl")
# install.packages("janitor")
# install.packages("aws.s3")

# Loading useful packages
library(tidyverse)
library(lubridate)
library(openxlsx)
library(testthat)
library(readxl)
library(dplyr)
library(tidyr)
library(aws.s3)
library(janitor)

#Load big dataset
#(This should be reproduced using R)


crc_dataset <- botor::s3_read(uri = "s3://alpha-piatool/crc_remedy/CRC Remedy Scenario Model - Cost Calculation Final.xlsx", 
                              fun = readxl::read_xlsx, sheet = "Main Table", skip = 3) %>% 
  janitor::clean_names() 


promotions <- crc_dataset %>% 
  filter(inscope_excluding_ineligible_cr_cs== "Potentially In scope by Promotion") 

sum(promotions$total_cost)
sum(crc_dataset$total_cost)



#%>% 
#   rename(employee_number = sop_ee_no, forename = first_name) %>% 
#   mutate(engaging_organisation = tolower(engaging_organisation), 
#          assignment_outcome = tolower(assignment_outcome),
#          forename = tolower(forename), 
#          surname = tolower(surname), 
#          national_insurance_number = toupper(national_insurance_number),
#          contract_type = str_replace(contract_type, " / ", " or "), 
#          employee_number = as.numeric(employee_number)) 
# 
# 
# 
