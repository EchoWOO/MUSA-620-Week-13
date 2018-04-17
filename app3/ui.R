
library(shiny)
library(DT)
library(leaflet)

fluidPage(
  
  titlePanel("Cities with population > 1 million"),
  
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
