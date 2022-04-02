# https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-02-25/readme.md
# https://github.com/WSJ/measles-data
library(tidyverse)
measles <- read.csv("https://raw.githubusercontent.com/WSJ/measles-data/master/all-measles-rates.csv") %>%
  as_tibble()

measles %>%
  select(mmr, overall, xmed, xper, xrel) %>%
  mutate(xmed = log(xmed), xper = log(xper), xrel = log(xrel)) %>%
  GGally::ggpairs()

measles %>%
  filter(xper == max(xper, na.rm = TRUE))

measles %>%
  filter(overall > 99, xrel > 50)
