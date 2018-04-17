
library(shiny)
library(maps)
library(dplyr)

# DT (data tables) package
# https://rstudio.github.io/DT/


bigcities <- filter(world.cities, pop > 1000000)

shinyServer(function(input, output, session) {
  
  output$table <- renderDataTable({
   
    datatable(bigcities,
              options = list(pageLength = 10,autoWidth = TRUE),
              colnames = c("City","Country","Population","Lat","Lng","Capital")
      )
    
  })
  
})
