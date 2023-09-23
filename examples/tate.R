# Some analysis at https://josephlewis.github.io/aspect.html

library(tidyverse)
# Read data
tate <- read.csv(here::here("data/the-tate-collection.csv"), stringsAsFactors = FALSE, sep = ";") |>
  as_tibble() |>
  mutate(
    aspectratio = height / width
  )
# Keep only those whose units are known and with no missing values
# for years or height/width
tate <- tate |>
  filter(
    !is.na(year) & !is.na(acquisitionYear) & !is.na(width) & !is.na(height),
    units == "mm"
  )

tate[, c("year", "acquisitionYear", "width", "height", "aspectratio")] |>
  GGally::ggpairs()

# Weird aspectratio
tate |>
  filter(aspectratio > 3000)

tate |>
  mutate(postmodern = year >= 1950) |>
  ggplot(aes(xmin = 0, xmax = width, ymin = 0, ymax = height, color = postmodern)) +
  geom_rect(alpha = 0) +
  labs(colour = "Postmodern?", x = "Width", y = "Height")
