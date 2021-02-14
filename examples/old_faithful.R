library(tidyverse)
library(geysertimes)
# Only do the following once
# gt_get_data(dest_folder = here::here("data"))
oldfaithful <- gt_load_eruptions(path = here::here("data")) %>%
  filter(geyser == "Old Faithful", eruption_id == primary_id) %>%
  select(-geyser) %>%
  arrange(time)

oldfaithful %>%
  filter(duration_seconds > 7000) %>%
  select(time, duration, duration_seconds)

boxplot(oldfaithful$duration_seconds[oldfaithful$duration_seconds < 1000])
plot(density(oldfaithful$duration_seconds[oldfaithful$duration_seconds < 1000], na.rm=TRUE))

oldfaithful %>%
  mutate(
    waiting = lead(time) - time,
  ) %>%
  filter(
    waiting <= 5*60*60,
    duration_seconds < 8*60
  ) %>%
  ggplot(aes(x = duration_seconds, y=waiting)) +
  geom_point(alpha=0.2) +
  geom_smooth()
