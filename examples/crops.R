library(tidyverse)
cropyields <- tidytuesdayR::tt_load('2020-09-01', download_files = "key_crop_yields")$key_crop_yields %>%
  filter(Year == 2018) %>%
  janitor::clean_names()
  
cropyields %>%
  select(-(1:3)) %>%
  GGally::ggpairs()

cropyields %>%
  select(entity, cocoa_beans_tonnes_per_hectare) %>%
  filter(cocoa_beans_tonnes_per_hectare > 2)
