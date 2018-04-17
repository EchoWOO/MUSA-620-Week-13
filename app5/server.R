
library(shiny)
library(maps)
library(dplyr)
library(leaflet)

bigcities <- filter(world.cities, pop > 1000000)



shinyServer(function(input, output, session) {
  
  v <- reactiveValues(data = bigcities)    
  
  
  output$selectCountry <- renderUI({
    countrylist <- arrange(bigcities, country.etc)
    countrylist <- unique(countrylist$country.etc)
    countrylist <- c("All",countrylist)
    selectInput("country", "Select a country", as.list(countrylist))
  })
  

  cities <- eventReactive(input$recalc, {
  
      if(is.null(input$country) || input$country == "All") {
        return(bigcities)
      } else {
        return(filter(bigcities,country.etc == input$country))  
      }
      
  }, ignoreNULL = FALSE)
  
  
  
  output$table <- renderDataTable({
   
      cities()
    
  })
    

  
  output$mymap <- renderLeaflet({
    
    leaflet() %>%
      addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
      addCircleMarkers(
        data = cities(),
        lng = ~long,
        lat = ~lat,
        radius = ~sqrt(pop)/250,
        color = "blue",
        stroke = FALSE,
        fillOpacity = 0.3,
        label = ~name
      )
  })
  
  
})
