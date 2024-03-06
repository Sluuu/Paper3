#### Preamble ####
# Purpose: Downloads and saves the data from 
# Author: Sean Liu
# Date: 12 March 2024
# Contact: yuhsiangg.liu@utoronto.ca 
# License: MIT
# Pre-requisites: 


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(dataverse)


#### Download data ####
ces2022 <-
  get_dataframe_by_name(
    filename = "CCES22_Common_OUTPUT_vv_topost.csv",
    dataset = "10.7910/DVN/PR4L8P",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) |>
  select(votereg, CC22_411, gender, educ)




#### Save data ####
write_csv(ces2022, "starter_folder-main/data/raw_data/ces2022.csv")

         
