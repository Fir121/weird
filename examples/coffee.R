#https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-07-07/readme.md
# https://github.com/jldbc/coffee-quality-database

library(tidyverse)
coffee <- tidytuesdayR::tt_load('2020-07-07')$coffee_ratings

coffee %>%
  select(total_cup_points, aroma, sweetness, moisture, color, balance, uniformity) %>%
  filter(total_cup_points > 50) %>%
  GGally::ggpairs()
