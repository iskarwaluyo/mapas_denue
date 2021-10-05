library(plyr) # CARGAR LIBRER?A plyr
library(readr) # CARGAR LIBRER?A readr
library(rgdal)
library(dplyr)
library(ggplot2)
library(DT)
library(leaflet)
library(shiny)
library(shinythemes)

function(input, output, session) {
  
  # GENERAR TABLAS PARA VISUALIZAR DATOS
  # VISUALIZACIÓN DE DATOS 1
  
  output$tabla1 = DT::renderDataTable({
    data <- select_liverpool
    DT::datatable(
      extensions = 'Buttons',
      options = list(
        dom = 'Bfrtip',
        buttons = c('csv')
      ),
      {
        if (input$municipio != "Todos") {
          data <- data[data$municipio == input$municipio,]
        }
        if (input$per_ocu != "Todos") {
          data <- data[data$per_ocu == input$per_ocu,]
        }
        if (input$CATEGORIA != "Todos") {
          data <- data[data$CATEGORIA == input$CATEGORIA,]
        }
        data
        }
    )
  })
  
  # GENERAR MAPA
  output$mapa <- renderLeaflet({
    
    m <-leaflet(mun_mapa) %>%
      addMapPane("A", zIndex = 490) %>% #
      addMapPane("B", zIndex = 480) %>% # 
      addMapPane("C", zIndex = 470) %>% # 
      addMapPane("D", zIndex = 460) %>% # 
      addMapPane("E", zIndex = 450) %>% #
      addMapPane("F", zIndex = 440) %>% # 
      addMapPane("G", zIndex = 430) %>% # 
      addMapPane("H", zIndex = 420) %>% # 
      addMapPane("I", zIndex = 410) %>% # 
      addMapPane("J", zIndex = 410) %>% # 
      
      addTiles(group = "Open Street Map") %>%
      addProviderTiles(providers$Stamen.Toner, group = "Toner") %>%
      addProviderTiles(providers$Stamen.TonerLite, group = "Toner Lite")
  
  m <- m %>%  addMarkers(data = select_liverpool_bolsas, ~longitud, ~latitud, 
                          popup = ~pop_bolsas, label = ~as.character(nom_estab),
                          options = pathOptions(pane = "A"),
                          group = "Bolsas",
                          clusterOptions = markerClusterOptions())    
   
   m <- m %>%  addMarkers(data = select_liverpool_sastres, ~longitud, ~latitud, 
                          popup = ~pop_sastres, label = ~as.character(nom_estab),
                          options = pathOptions(pane = "A"),
                          group = "Sastrerías",
                          clusterOptions = markerClusterOptions())
   
   m <- m %>%  addMarkers(data = select_liverpool_cosmeticos, ~longitud, ~latitud, 
                          popup = ~pop_cosmeticos, label = ~as.character(nom_estab),
                          options = pathOptions(pane = "A"),
                          group = "Cosméticos",
                          clusterOptions = markerClusterOptions())
   
   m <- m %>%  addMarkers(data = select_liverpool_sombreros, ~longitud, ~latitud, 
                          popup = ~pop_sombreros, label = ~as.character(nom_estab),
                          options = pathOptions(pane = "A"),
                          group = "Sombreros",
                          clusterOptions = markerClusterOptions())
   
   m <- m %>%  addMarkers(data = select_liverpool_camisas, ~longitud, ~latitud, 
                          popup = ~pop_camisas, label = ~as.character(nom_estab),
                          options = pathOptions(pane = "A"),
                          group = "Camisas",
                          clusterOptions = markerClusterOptions())
   
   m <- m %>%  addMarkers(data = select_liverpool_ropaext, ~longitud, ~latitud, 
                          popup = ~pop_ropaext, label = ~as.character(nom_estab),
                          options = pathOptions(pane = "A"),
                          group = "Ropa Exterior",
                          clusterOptions = markerClusterOptions())
   
   m <- m %>%  addMarkers(data = select_liverpool_ropaint, ~longitud, ~latitud, 
                          popup = ~pop_ropaint, label = ~as.character(nom_estab),
                          options = pathOptions(pane = "A"),
                          group = "Ropa Interior",
                          clusterOptions = markerClusterOptions())
   
   m <- m %>%  addMarkers(data = select_liverpool_cerveza, ~longitud, ~latitud, 
                          popup = ~pop_cerveza, label = ~as.character(nom_estab),
                          options = pathOptions(pane = "A"),
                          group = "Cerveza",
                          clusterOptions = markerClusterOptions())
   
   m <- m %>%  addPolygons(data = mun_mapa, stroke = FALSE, smoothFactor = 0.3,
                            options = pathOptions(pane = "B"),
                            fillOpacity = .7,
                            fillColor = ~pal_1(as.numeric(count.x)),
                            opacity = .3,
                            weight = 1,
                            color = "#4D4D4D",
                            dashArray = "2",
                            highlight = highlightOptions(
                              weight = 1,
                              color = "#4D4D4D",
                              fillOpacity = 0.1,
                              dashArray = "2",
                              bringToFront = TRUE),
                            group = "UECS Totales",
                            labelOptions = labelOptions(
                              style = list("font-weight" = "normal", padding = "3px 8px"),
                              textsize = "15px",
                              direction = "auto"))
    
    # CONTROL DE CAPAS
    m <- m %>% addLayersControl(
      baseGroups = c("Open Street Map", "Toner", "Toner Lite"),
      overlayGroups = c("UECS Totales", "Bolsas", "Sastrerías", "Cosméticos", 
                        "Sombreros", "Camisas", "Ropa Exterior", "Ropa Interior",
                        "Cerveza"),
      options = layersControlOptions(collapsed = FALSE)
    )
    
    m
    
  })
  
  observe({
    proxy <- leafletProxy("mapa", data = mun_mapa)
    proxy %>% clearControls()
    if (input$leyenda) {
      proxy %>% 
        addLegend("topleft", group = "UECS Totales", pal = pal_1, values = ~as.numeric(count), opacity = 1.0)
    }
  })
  
}