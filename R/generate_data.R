library(plyr) # CARGAR LIBRERÍA plyr
library(readr) # CARGAR LIBRERÍA readr
library(rgdal)
library(dplyr)
library(ggplot2)
library(rio)
library(RCurl)
library(geojsonio)
library(leaflet)
library(shiny)
library(shinythemes)

#denue_2021_merida <- read.csv((file = "/media/iskar/archivos/MAPAS/mapas_denue/DATOS/denue_31_csv/conjunto_de_datos/denue_inegi_31_.csv"), encoding = "UTF-8")

#mun_mapa <- readOGR("/media/iskar/archivos/MAPAS/mapas_denue/DATOS/YUCATAN_MUNICIPIOS.geojson")

denue_2021_merida <- import("https://raw.githubusercontent.com/iskarwaluyo/mapas_denue/main/DATOS/denue_31_csv/conjunto_de_datos/denue_inegi_31_.csv")

mun_mapa <- readOGR("https://raw.github.com/iskarwaluyo/mapas_denue/main/DATOS/YUCATAN_MUNICIPIOS.geojson")


actividades_economicas_en_DENUE <- unique(as.data.frame(denue_2021_merida$nombre_act))


select_liverpool_A <- denue_2021_merida[grep('Acabado de productos textiles|
                                             Comercio al por mayor de artículos de joyería y relojes|
                                             Comercio al por mayor de artículos de perfumería y cosméticos|
                                             Comercio al por mayor de bebidas no alcohólicas y hielo|
                                             Comercio al por mayor de blancos|
                                             Comercio al por mayor de conservas alimenticias|Comercio al por mayor de miel|Comercio al por mayor de otros productos textiles|Comercio al por mayor de ropa, bisutería y accesorios de vestir|Comercio al por mayor de vinos y licores|Comercio al por menor de cerveza|Comercio al por menor de vinos y licores|Confección de cortinas, blancos y similares|Confección de otros accesorios y prendas de vestir no clasificados en otra parte|Confección de prendas de vestir de cuero, piel y de materiales sucedáneos|Confección de prendas de vestir sobre medida|Confección de productos de textiles recubiertos y de materiales sucedáneos|Confección de sombreros y gorras|Confección en serie de camisas|Confección en serie de disfraces y trajes típicos|Confección en serie de otra ropa exterior de materiales textiles|Confección en serie de ropa interior y de dormir|Confección en serie de uniformes|Confección, bordado y deshilado de productos textiles|Conservación de frutas y verduras por procesos distintos a la congelación y la deshidratación|Conservación de guisos y otros alimentos preparados por procesos distintos a la congelación|Corte y empacado de carne de ganado, aves y otros animales comestibles|Diseño de modas y otros diseños especializados|Edición de libros|Elaboración de bebidas alcohólicas a base de uva|Elaboración de bebidas destiladas de agave|Elaboración de botanas|Elaboración de café instantáneo|Elaboración de cereales para el desayuno|Elaboración de cerveza|Elaboración de chocolate y productos de chocolate|Elaboración de concentrados, polvos, jarabes y esencias de sabor para bebidas|Elaboración de condimentos y aderezos|Elaboración de derivados y fermentos lácteos|Elaboración de dulces, chicles y productos de confitería que no sean de chocolate|Elaboración de galletas y pastas para sopa|Elaboración de otras bebidas destiladas|Elaboración de otros alimentos|Elaboración de puros y otros productos de tabaco|Elaboración de refrescos y otras bebidas no alcohólicas|Elaboración de ron y otras bebidas destiladas de caña|Elaboración de tortillas de harina de trigo de forma tradicional|Elaboración de tortillas de maíz y molienda de nixtamal|Fabricación de aparatos de línea blanca|Fabricación de artículos de alfarería, porcelana y loza|Fabricación de artículos y accesorios para escritura, pintura, dibujo y actividades de oficina|Fabricación de artículos y utensilios de madera para el hogar|Fabricación de azulejos y losetas no refractarias|Fabricación de bolsas de papel y productos celulósicos recubiertos y tratados|Fabricación de bolsos de mano, maletas y similares|Fabricación de calzado con corte de piel y cuero|Fabricación de calzado con corte de tela|Fabricación de calzado de hule|Fabricación de calzado de plástico|Fabricación de cosméticos, perfumes y otras preparaciones de tocador|Fabricación de huaraches y calzado de otro tipo de materiales|Fabricación de jabones, limpiadores y dentífricos|Fabricación de juguetes|Fabricación de lámparas ornamentales|Fabricación de otros productos de cartón y papel|Fabricación de otros productos de madera|Fabricación de otros productos de plástico sin reforzamiento|Fabricación de otros productos de vidrio|Fabricación de otros productos metálicos|Fabricación de persianas y cortineros|Fabricación de productos a base de piedras de cantera|Fabricación de productos de materiales trenzables excepto palma|Fabricación de productos de papelería|Fabricación de ropa exterior de tejido de punto|Fabricación de ropa interior de tejido de punto|Fabricación de utensilios de cocina metálicos|Fabricación de velas y veladoras|Fabricación de vidrio'
                                             , 
                                             as.character(denue_2021_merida$nombre_act)), ]


select_liverpool_bolsas <- denue_2021_merida[grep('Fabricación de bolsos de mano, maletas y similares', 
                                                  as.character(denue_2021_merida$nombre_act)), ]
select_liverpool_bolsas$CATEGORIA <- paste0("BOLSAS")
bolsas_perocu <- as.data.frame(summary(as.factor(select_liverpool_bolsas$per_ocu)))
bolsas_municipio <- as.data.frame(summary(as.factor(select_liverpool_bolsas$municipio)))


select_liverpool_sastres <- denue_2021_merida[grep('Confección de prendas de vestir sobre medida', 
                                                   as.character(denue_2021_merida$nombre_act)), ]
select_liverpool_sastres$CATEGORIA <- paste0("SASTRES")
sastres_perocu <- as.data.frame(summary(as.factor(select_liverpool_sastres$per_ocu)))
sastres_municipio <- as.data.frame(summary(as.factor(select_liverpool_sastres$municipio)))

select_liverpool_cosmeticos <- denue_2021_merida[grep('Fabricación de cosméticos, perfumes y otras preparaciones de tocador', 
                                                      as.character(denue_2021_merida$nombre_act)), ]
select_liverpool_cosmeticos$CATEGORIA <- paste0("COSMETICOS")
cosmeticos_perocu <- as.data.frame(summary(as.factor(select_liverpool_cosmeticos$per_ocu)))
cosmeticos_municipio <- as.data.frame(summary(as.factor(select_liverpool_cosmeticos$municipio)))

select_liverpool_sombreros <- denue_2021_merida[grep('Confección de sombreros y gorras', 
                                                     as.character(denue_2021_merida$nombre_act)), ]
select_liverpool_sombreros$CATEGORIA <- paste0("SOMBREROS")
sombreros_perocu <- as.data.frame(summary(as.factor(select_liverpool_sombreros$per_ocu)))
sombreros_municipio <- as.data.frame(summary(as.factor(select_liverpool_sombreros$municipio)))

select_liverpool_camisas <- denue_2021_merida[grep('Confección en serie de camisas', 
                                                   as.character(denue_2021_merida$nombre_act)), ]
select_liverpool_camisas$CATEGORIA <- paste0("CAMISAS")
camisas_perocu <- as.data.frame(summary(as.factor(select_liverpool_camisas$per_ocu)))
camisas_municipio <- as.data.frame(summary(as.factor(select_liverpool_camisas$municipio)))

select_liverpool_ropaext <- denue_2021_merida[grep('Confección en serie de otra ropa exterior de materiales textiles|Fabricación de ropa exterior de tejido de punto', 
                                                   as.character(denue_2021_merida$nombre_act)), ]
select_liverpool_ropaext$CATEGORIA <- paste0("ROPA EXTERIOR")
ropaext_perocu <- as.data.frame(summary(as.factor(select_liverpool_ropaext$per_ocu)))
ropaext_municipio <- as.data.frame(summary(as.factor(select_liverpool_ropaext$municipio)))

select_liverpool_ropaint <- denue_2021_merida[grep('Confección en serie de ropa interior y de dormir|Fabricación de ropa interior de tejido de punto', 
                                                   as.character(denue_2021_merida$nombre_act)), ]
select_liverpool_ropaint$CATEGORIA <- paste0("ROPA INTERIOR")
ropaint_perocu <- as.data.frame(summary(as.factor(select_liverpool_ropaint$per_ocu)))
ropaint_municipio <- as.data.frame(summary(as.factor(select_liverpool_ropaint$municipio)))

select_liverpool_cerveza <- denue_2021_merida[grep('Elaboración de cerveza', 
                                                   as.character(denue_2021_merida$nombre_act)), ]
select_liverpool_cerveza$CATEGORIA <- paste0("CERVEZA")
cerveza_perocu <- as.data.frame(summary(as.factor(select_liverpool_cerveza$per_ocu)))
cerveza_municipio <- as.data.frame(summary(as.factor(select_liverpool_cerveza$municipio)))

select_liverpool <- rbind(select_liverpool_bolsas, select_liverpool_sastres, 
                          select_liverpool_cosmeticos, select_liverpool_sombreros,
                          select_liverpool_ropaext, select_liverpool_ropaint, select_liverpool_cerveza)

uecs_mun <- denue_2021_merida %>% 
  group_by(municipio) %>% 
  summarise(count = n()) %>% 
  mutate(perc = count/sum(count))

mun_mapa <- merge(mun_mapa, uecs_mun, by.x = "NOM_MUN", by.y = "municipio")



ggplot(uecs_mun, aes(x = factor(count), y = municipio, fill = factor(count))) +
  geom_bar(stat="identity", width = .7) +
  scale_y_continuous() + 
  coord_flip() +
  labs(title="Establecimientos con probabilidad de generación de residuos biodegradables 2021",
       subtitle="Probabilidad de generación de residuos biodegradables in-situ", 
       y="Establecimietos (porcentaje)", 
       x="Municipio", 
       caption = "Fuente: DENUE") +
  theme(legend.position = "bottom")  +
  geom_text(aes(label = count), colour = "black", size = 3, position=position_dodge(width=0.05), hjust=-1.1) +
  scale_fill_brewer(palette = "Pastel1")


uecs_perocu <- as.data.frame(summary(as.factor(select_liverpool_A$per_ocu)))
uecs_municipio <- as.data.frame(summary(as.factor(select_liverpool_A$municipio)))

bins_uecs_total <- c(0, 100, 200, 400, 800, 1000, 2000, 4000, 8000, 16000, 32000)
pal_1 <- colorBin( palette="viridis", domain = as.numeric(mun_mapa@data$count.x, bins = bins_uecs_total))
                   

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


setwd("/media/iskar/archivos/MAPAS/mapas_denue/DATOS/RDdata")

save(denue_2021_merida, mun_mapa, file = "data_base.RData")
save(select_liverpool, select_liverpool_A, file = "select_liverpool_general.RData")
save(select_liverpool_bolsas, select_liverpool_camisas, select_liverpool_cerveza,
     select_liverpool_cosmeticos, select_liverpool_ropaext, select_liverpool_ropaint, 
     select_liverpool_sastres, select_liverpool_sombreros, select_liverpool, file = "select_a.RData")
save(pop_bolsas, pop_camisas, pop_cerveza, pop_cosmeticos,
     pop_ropaext, pop_ropaint, pop_sastres, pop_sombreros, pal_1, file = "pop_ups.RData")

setwd("/media/iskar/archivos/MAPAS/mapas_denue/RESULTADOS")

write.csv(file = "lista_de_actividades_economicas_merida.csv", actividades_economicas_en_DENUE)
write.csv(file = "primer_filtrado_uecs_liverpool.csv", select_liverpool_A)
write.csv(file = "personas_ocupadas.csv", uecs_perocu)
write.csv(file = "uecs_municipio.csv", uecs_municipio)

write.csv(file = "denue_liverpool_bolsas.csv", select_liverpool_bolsas)
write.csv(file = "denue_liverpool_sastrerias.csv", select_liverpool_sastres)
write.csv(file = "denue_liverpool_cosmeticos.csv", select_liverpool_cosmeticos)
write.csv(file = "denue_liverpool_camisas.csv", select_liverpool_camisas)
write.csv(file = "denue_liverpool_ropaext.csv", select_liverpool_ropaext)
write.csv(file = "denue_liverpool_ropaint.csv", select_liverpool_ropaint)
write.csv(file = "denue_liverpool_ropaext.csv", select_liverpool_ropaext)

setwd("/media/iskar/archivos/MAPAS/mapas_denue/")



