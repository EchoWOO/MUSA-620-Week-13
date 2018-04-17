
library(shiny)
library(DT)
library(leaflet)

fluidPage(
  
  titlePanel("Grid layout with control widgets"),
  
  leafletOutput("mymap"),
  hr(),
  fluidRow(
    column(6,offset=1, 

           uiOutput("selectCountry")
    ),
    column(5,
           actionButton("recalc", "Generate new points")
           
    )
  ),
  hr(),
  dataTableOutput('table')
)