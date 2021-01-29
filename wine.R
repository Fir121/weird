library(tidyverse)
wine <- read_csv(here::here("data/winemag-data-130k-v2.csv"))

wine %>%
  select(points, price) %>%
  mutate(logprice = log(price)) %>%
  pairs()
