remotes::install_github("robjhyndman/weird-package")
library(weird)

oldfaithful %>%
  filter(duration > 7000)

oldfaithful %>%
  filter(duration < 1000) %>%
  ggplot(aes(x=duration)) +
  geom_boxplot()

oldfaithful %>%
  filter(duration < 1000) %>%
  ggplot(aes(x=duration)) +
  geom_density() +
  geom_rug()

oldfaithful %>%
  filter(duration < 1000) %>%
  ggplot(aes(x = duration, y=waiting)) +
  geom_point(alpha=0.2) +
  geom_smooth()
