#set main workin directory
here::here()
# Go to directory for this week
setwd(here::here("12_04_2022"))

indoor_pollution <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-04-12/indoor_pollution.csv')
tuesdata <- tidytuesdayR::tt_load('2022-04-12')
