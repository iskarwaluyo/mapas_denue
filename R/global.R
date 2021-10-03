library(plyr) # CARGAR LIBRERÃA plyr
library(readr) # CARGAR LIBRERÃA readr
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



pop_bolsas <- paste0("<b><br/> Municipio: </b>", select_liverpool_bolsas$municipio,
                    "<b><br/> Nombre: </b>", select_liverpool_bolsas$nom_estab,
                    "<b><br/> Personas ocupadas: </b>", select_liverpool_bolsas$per_ocu,
                    "<b><br/> Tipo de actividad: </b>", select_liverpool_bolsas$nombre_act,
                    "<b><br/> Correo: </b>", select_liverpool_bolsas$correoelec,
                    "<b><br/> Telefono: </b>", select_liverpool_bolsas$telefono)

pop_sastres <- paste0("<b><br/> Municipio: </b>", select_liverpool_sastres$municipio,
                     "<b><br/> Nombre: </b>", select_liverpool_sastres$nom_estab,
                     "<b><br/> Personas ocupadas: </b>", select_liverpool_sastres$per_ocu,
                     "<b><br/> Tipo de actividad: </b>", select_liverpool_sastres$nombre_act,
                     "<b><br/> Correo: </b>", select_liverpool_sastres$correoelec,
                     "<b><br/> Telefono: </b>", select_liverpool_sastres$telefono)

pop_cosmeticos <- paste0("<b><br/> Municipio: </b>", select_liverpool_cosmeticos$municipio,
                      "<b><br/> Nombre: </b>", select_liverpool_cosmeticos$nom_estab,
                      "<b><br/> Personas ocupadas: </b>", select_liverpool_cosmeticos$per_ocu,
                      "<b><br/> Tipo de actividad: </b>", select_liverpool_cosmeticos$nombre_act,
                      "<b><br/> Correo: </b>", select_liverpool_cosmeticos$correoelec,
                      "<b><br/> Telefono: </b>", select_liverpool_cosmeticos$telefono)

pop_sombreros <- paste0("<b><br/> Municipio: </b>", select_liverpool_sombreros$municipio,
                         "<b><br/> Nombre: </b>", select_liverpool_sombreros$nom_estab,
                         "<b><br/> Personas ocupadas: </b>", select_liverpool_sombreros$per_ocu,
                         "<b><br/> Tipo de actividad: </b>", select_liverpool_sombreros$nombre_act,
                         "<b><br/> Correo: </b>", select_liverpool_sombreros$correoelec,
                         "<b><br/> Telefono: </b>", select_liverpool_sombreros$telefono)

pop_camisas <- paste0("<b><br/> Municipio: </b>", select_liverpool_camisas$municipio,
                        "<b><br/> Nombre: </b>", select_liverpool_camisas$nom_estab,
                        "<b><br/> Personas ocupadas: </b>", select_liverpool_camisas$per_ocu,
                        "<b><br/> Tipo de actividad: </b>", select_liverpool_camisas$nombre_act,
                        "<b><br/> Correo: </b>", select_liverpool_camisas$correoelec,
                        "<b><br/> Telefono: </b>", select_liverpool_camisas$telefono)

pop_ropaext <- paste0("<b><br/> Municipio: </b>", select_liverpool_ropaext$municipio,
                      "<b><br/> Nombre: </b>", select_liverpool_ropaext$nom_estab,
                      "<b><br/> Personas ocupadas: </b>", select_liverpool_ropaext$per_ocu,
                      "<b><br/> Tipo de actividad: </b>", select_liverpool_ropaext$nombre_act,
                      "<b><br/> Correo: </b>", select_liverpool_ropaext$correoelec,
                      "<b><br/> Telefono: </b>", select_liverpool_ropaext$telefono)

pop_ropaint <- paste0("<b><br/> Municipio: </b>", select_liverpool_ropaint$municipio,
                      "<b><br/> Nombre: </b>", select_liverpool_ropaint$nom_estab,
                      "<b><br/> Personas ocupadas: </b>", select_liverpool_ropaint$per_ocu,
                      "<b><br/> Tipo de actividad: </b>", select_liverpool_ropaint$nombre_act,
                      "<b><br/> Correo: </b>", select_liverpool_ropaint$correoelec,
                      "<b><br/> Telefono: </b>", select_liverpool_ropaint$telefono)

pop_cerveza <- paste0("<b><br/> Municipio: </b>", select_liverpool_cerveza$municipio,
                      "<b><br/> Nombre: </b>", select_liverpool_cerveza$nom_estab,
                      "<b><br/> Personas ocupadas: </b>", select_liverpool_cerveza$per_ocu,
                      "<b><br/> Tipo de actividad: </b>", select_liverpool_cerveza$nombre_act,
                      "<b><br/> Correo: </b>", select_liverpool_cerveza$correoelec,
                      "<b><br/> Telefono: </b>", select_liverpool_cerveza$telefono)

