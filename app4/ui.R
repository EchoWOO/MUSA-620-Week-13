
library(shiny)
library(DT)
library(leaflet)

fluidPage(
  
  titlePanel("Cities with population > 1 million"),
  
  tabsetPanel(type = "tabs",
              tabPanel("Map", leafletOutput("mymap")),
              tabPanel("Table", dataTableOutput('table')),
              tabPanel("About", 
                       h3("Hi, this is my app"),
                       fluidRow(
                         column(4,offset=4, 
                                img(src='person.png')
                         )
                       ),
                       br(),
                       p("To incorporate images and other external files into your app, create a 'www' folder in your app directory and place them there.")
              )
  ),
  hr(),
  fluidRow(
    column(6,offset=1, 
           
           uiOutput("selectCountry")
    ),
    column(5,
           actionButton("recalc", "Generate new points")
           
    )
  )
)

