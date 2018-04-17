
library(shiny)
library(maps)
library(dplyr)
library(leaflet)

bigcities <- filter(world.cities, pop > 1000000)



shinyServer(function(input, output, session) {
  
  
  output$selectCountry <- renderUI({
    countrylist <- arrange(bigcities, country.etc)
    countrylist <- unique(countrylist$country.etc)
    countrylist <- c("All",countrylist)
    selectInput("country", "Select a country", as.list(countrylist))
  })

  
  output$table <- renderDataTable({
   
    if(is.null(input$country) || input$country == "All") {
      bigcitiesfiltered <- bigcities
    } else {
      bigcitiesfiltered <- filter(bigcities,country.etc == input$country)  
    }
    
    datatable(bigcitiesfiltered, options = list(pageLength = 10, autoWidth = TRUE))
    
  })
    

  
  output$mymap <- renderLeaflet({
    
    if(is.null(input$country) || input$country == "All") {
      bigcitiesfiltered <- bigcities
    } else {
      bigcitiesfiltered <- filter(bigcities,country.etc == input$country)  
    }
    
    
    leaflet() %>%
      addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
      addCircleMarkers(
        lng = ~long,
        lat = ~lat,
        data = bigcitiesfiltered,
        radius = ~sqrt(pop)/250,
        color = "blue",
        stroke = FALSE,
        fillOpacity = 0.3,
        label = ~name
      )
  })
  
  
})
