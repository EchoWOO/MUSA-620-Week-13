
library(shiny)
library(DT)

fluidPage(
  
  titlePanel("Data table"),
  
  dataTableOutput('table')

)


