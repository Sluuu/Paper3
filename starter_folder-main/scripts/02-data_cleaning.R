#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Sean Liu
# Date: 12 March 2024
# Contact: yuhsiang.liu@mail.utoronto.ca
# License: MIT
# Pre-requisites: You will have to run through 01-download_data.R and have it saved locally.
# Any other information needed? 

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

ces2022 <-
  ces2022 |>
  filter(votereg == 1,
         CC22_411 %in% c(1, 2)) |>
  mutate(
    voted_for = if_else(CC22_411 == 1, "Biden", "Trump"),
    voted_for = as_factor(voted_for),
    gender = if_else(gender4 == 1, "Male", "Female"),
    education = case_when(
      educ == 1 ~ "No HS",
      educ == 2 ~ "High school graduate",
      educ == 3 ~ "Some college",
      educ == 4 ~ "2-year",
      educ == 5 ~ "4-year",
      educ == 6 ~ "Post-grad"
    ),
    education = factor(
      education,
      levels = c(
        "No HS",
        "High school graduate",
        "Some college",
        "2-year",
        "4-year",
        "Post-grad"
      )
    )
  ) |>
  select(voted_for, gender, education)
###
ces2022

#### Save data ####
write_csv(cleaned_ces2022, "outputs/data/analysis_data.csv")
