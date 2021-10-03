bootstrapPage(theme = shinytheme("flatly"),
              navbarPage("LP_DENUE",
                         
                         tabPanel("Mapa",
                                  basicPage("Mapa LP DENUE",
                                            div(class="outer",
                                            tags$head(includeCSS("styles.css")),
                                            leafletOutput("mapa", width = "100%", height = "100%"),
                                            
                                            absolutePanel(top = 10, right = 10,
                                                          checkboxInput("leyenda", "Mostrar leyenda", TRUE),
                                                          absolutePanel(id = "logo_tia_cony", class = "card", bottom = 20, left = 60, width = "100%", fixed=TRUE, draggable = FALSE, height = "auto",
                                                                        tags$a(href='https://www.conacyt.gob.mx', tags$img(src='https://raw.githubusercontent.com/iskarwaluyo/mapa_agricultura_masaforestal/master/html/logo_conacyt_solo.png',height='40',width='40'))),
                                                          absolutePanel(id = "logo_geo", class = "card", bottom = 20, left = 120, width = "100%", fixed=TRUE, draggable = FALSE, height = "auto",
                                                                        tags$a(href='https://www.centrogeo.org.mx', tags$img(src='https://raw.githubusercontent.com/iskarwaluyo/mapa_agricultura_masaforestal/master/html/logo_centrogeo_solo.png',height='40',width='40'))),
                                            ))
                                  )
                         )
                         
              )
              
)