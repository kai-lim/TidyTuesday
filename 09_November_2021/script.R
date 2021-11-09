#set main workin directory
here::here()
# Go to directory for this week
setwd(here("09_November_2021"))

# download the data of this week

# Data accessed via the afrimapr or afrilearndata packages

# afrilearndata
remotes::install_github("afrimapr/afrilearndata")
# afrihealthsites`
remotes::install_github("afrimapr/afrihealthsites")

library(afrilearndata)
library(sf)

plot(sf::st_geometry(africountries))
plot(sf::st_geometry(africontinent))
help("afrilandcover")
