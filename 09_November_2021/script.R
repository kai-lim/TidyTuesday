#set main workin directory
here::here()
# Go to directory for this week
setwd(here::here("09_November_2021"))

# download the data of this week

# Data accessed via the afrimapr or afrilearndata packages

# afrilearndata
#remotes::install_github("afrimapr/afrilearndata")
# afrihealthsites`
#remotes::install_github("afrimapr/afrihealthsites")
library(afrilearndata)
library(sf) #deals with vector data (points, lines and polygons)
library(raster) # deals with raster data (e.g., gridded population density data)
library(tmap)
library(mapview) #interactive mapping
library(rgdal) #seems to be needed for mapview raster
library(viridis)
library(wesanderson)
# I used this crash course to learn how to plot maps etc: https://andysouth.shinyapps.io/afrilearnr-crash-course/#section-intro-to-afrilearnr-this-crash-course 

# and this one too: https://andysouth.shinyapps.io/intro-to-spatial-r/#section-quiz

plot(africapitals) #has 4 columns, hence 4 plots
plot(sf::st_geometry(africapitals)) # only show the spatial parts without the attributes

# needed so that this matches the gdal version
sf::st_crs(africapitals) <- 4326
sf::st_crs(afrihighway) <- 4326
sf::st_crs(africountries) <- 4326
sf::st_crs(africontinent) <- 4326 

#use tmap package to etend what is available from sf
tm_shape(afriairports)+  # define the data to be used
  tm_symbols(size=0.1,col="type") #define how to present the data

tm_shape(afrihighway)+
  tm_lines(col="blue")

tm_shape(africountries)+
  tm_polygons(col="pop_est")

tm_shape(afripop2000)+
  tm_raster(breaks=c(0,1,10,100,1000,10000),
            palette = rev(viridis(6)))


# static (plot) view:
tmap_mode('plot') 
map<-tmap::tm_shape(afripop2020) +
  tm_raster(palette = viridis(n=6), breaks=c(0,2,20,200,2000,25000)) +
  tm_shape(africountries) +
  tm_borders("white", lwd = 0.1) +
  tm_shape(afrihighway) +
  tm_lines(col = "skyblue") + 
  tm_shape(africapitals) +
  tm_symbols(col = "blue", alpha=0.4, scale = .6 )+
  tm_legend(show = FALSE)

map

tmap_save(map,"map.png")

# interactive view:
tmap_mode('view') 

tmap::tm_shape(afripop2020) +
  tm_raster(palette = rev(viridisLite::magma(5)), breaks=c(0,2,20,200,2000,25000)) +
  tm_shape(africountries) +
  tm_borders("white", lwd = .5) +
  #tm_text("iso_a3", size = "AREA") +
  tm_shape(afrihighway) +
  tm_lines(col = "red") + 
  tm_shape(africapitals) +
  tm_symbols(col = "blue", alpha=0.4, scale = .6 )+
  tm_legend(show = FALSE)
