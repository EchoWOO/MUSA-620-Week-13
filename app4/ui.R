
library(shiny)
library(DT)
library(leaflet)

fluidPage(
  
  titlePanel("Grid layout with control widgets"),
  
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
