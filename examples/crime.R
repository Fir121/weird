# Downloaded from
# https://ucr.fbi.gov/crime-in-the-u.s/2018/crime-in-the-u.s.-2018/topic-pages/offenses-known-to-law-enforcement
# N0 data from Iowa
library(tidyverse)

# Table 8
offences2018 <- readxl::read_excel(
    here::here("data/crime/Table_8_Offenses_Known_to_Law_Enforcement_by_State_by_City_2018.xls"),
    skip=3
  ) %>%
  janitor::clean_names() %>%
  fill(state, .direction="down") %>%
  filter(!str_detect(state,"^[0-9]")) %>%
  filter(state != "IOWA7") %>%
  mutate(across(violent_crime:arson2, ~ ./population*1e3))

offences2018 %>%
  ggplot(aes(x=violent_crime, y=rape1)) +
  geom_point() +
  scale_x_log10() + scale_y_log10()

library(lookout)

# Very slow!
lookout(offences2018 %>% select(violent_crime) %>% filter(!is.na(violent_crime)))
