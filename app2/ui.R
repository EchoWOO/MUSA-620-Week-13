
library(shiny)
library(DT)
library(leaflet)

fluidPage(
  
  titlePanel("Cities with population > 1 million"),
  
  leafletOutput("mymap"),
  hr(),
  fluidRow(
    column(4,offset=4, 
        uiOutput("selectCountry")
    )
  ),
  hr(),
  dataTableOutput('table')
)
