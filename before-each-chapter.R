rm(list=ls(all=TRUE))

set.seed(1967)
library(tidyverse)

knitr::opts_chunk$set(
  comment = "#>",
  collapse = TRUE,
  echo = TRUE,
  cache = TRUE,
  out.width = "100%",
  fig.align = 'center',
  fig.width = 7,
  fig.asp = 0.618  # 1 / phi
)

# Set some defaults
# Colours to be viridis for continuous scales and Okabe for discrete scales
html <- TRUE
options(
  digits = 4,
  width=58 + html*20,
  ggplot2.continuous.colour="viridis",
  ggplot2.continuous.fill = "viridis",
  ggplot2.discrete.colour = c("#E69F00", "#56B4E9", "#009E73", "#CC79A7", "#D55E00", "#0072B2", "#F0E442"),
  ggplot2.discrete.fill = c("#E69F00", "#56B4E9", "#009E73", "#CC79A7", "#D55E00", "#0072B2", "#F0E442")
)
ggplot2::theme_set(theme_get() + theme(text = element_text(family = 'Carlito')))

# Avoid some conflicts
conflicted::conflict_prefer("select","dplyr")
conflicted::conflict_prefer("filter","dplyr")

