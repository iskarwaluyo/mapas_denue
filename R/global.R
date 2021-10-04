library(plyr) # CARGAR LIBRER?A plyr
library(readr) # CARGAR LIBRER?A readr
library(rgdal)
library(dplyr)
library(ggplot2)
library(rio)
library(RCurl)
library(geojsonio)
library(leaflet)
library(shiny)
library(shinythemes)

load(url("https://raw.github.com/iskarwaluyo/mapas_denue/main/DATOS/RDdata/data_base.RData"))
load(url("https://raw.github.com/iskarwaluyo/mapas_denue/main/DATOS/RDdata/select_liverpool_general.RData"))
load(url("https://raw.github.com/iskarwaluyo/mapas_denue/main/DATOS/RDdata/select_a.RData"))
load(url("https://raw.github.com/iskarwaluyo/mapas_denue/main/DATOS/RDdata/pop_ups.RData"))