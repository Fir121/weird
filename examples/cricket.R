library(cricketdata)
batting <- fetch_cricinfo(matchtype="test", sex="men", activity="batting", type="career")

batting %>%
  select(Innings, Runs, Average, Hundreds, Ducks) %>%
  GGally::ggpairs()
