library(tidyverse)
oldfaithful <- "data/Old_Faithful_eruptions.tsv" %>%
  read_tsv(col_types="dcidddddddddddcccdddciicccc") %>%
  mutate(
    seconds = as.numeric(duration_seconds),
    time = as.POSIXct(eruption_time_epoch, origin="1970-01-01", tz="MST")
  )
# Note Yellowstone is Mountain Standard Time (UTC-7) most of the time.
oldfaithful %>%
  filter(seconds > 7000) %>%
  select(time, duration, duration_seconds)

boxplot(oldfaithful$seconds[oldfaithful$seconds < 1000])
plot(density(oldfaithful$seconds[oldfaithful$seconds < 1000], na.rm=TRUE))
