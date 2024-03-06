#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
ces2022 <-
  read_csv(
    "starter_folder-main/data/raw_data/ces2022.csv",
    col_types =
      cols(
        "votereg" = col_integer(),
        "CC22_411" = col_integer(),
        "gender4" = col_integer(),
        "educ" = col_integer()
      )
  )

ces2022

#### Save data ####
write_csv(cleaned_data, "outputs/data/analysis_data.csv")
