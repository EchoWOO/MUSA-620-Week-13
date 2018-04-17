


library(shiny)
library(maps)
library(dplyr)
library(leaflet)
library(DT)


bigcities <- filter(world.cities, pop > 1000000)


shinyServer(function(input, output, session) {
  
  
  output$selectCountry <- renderUI({
    countrylist <- arrange(bigcities, country.etc)
    countrylist <- unique(countrylist$country.etc)
    countrylist <- c("All",countrylist)
    selectInput("country", "Select a country", as.list(countrylist))
  })
  
  
  output$selectCity <- renderUI({
    
    if(is.null(input$country) || input$country == "All") {
      bigcitiesfiltered <- bigcities
    } else {
      bigcitiesfiltered <- filter(bigcities,country.etc == input$country)  
    }
    
    bigcitiesfilterednames <- c("All",bigcitiesfiltered$name)
    
    selectInput("city", "Select a city", as.list(bigcitiesfilterednames))
    
  })
  
  
  
  
  output$table <- renderDataTable({
    
    if(is.null(input$country) || input$country == "All") {
      bigcitiesfiltered <- bigcities
    } else if (is.null(input$city) || input$city == "All") {
      bigcitiesfiltered <- filter(bigcities,country.etc == input$country)  
    } else {
      bigcitiesfiltered <- filter(bigcities,name == input$city)
    }
    
    return(bigcitiesfiltered)
    
  })
  
  
  
  output$mymap <- renderLeaflet({
    
    
    if(is.null(input$country) || input$country == "All") {
      bigcitiesfiltered <- bigcities
    } else if (is.null(input$city) || input$city == "All") {
      bigcitiesfiltered <- filter(bigcities,country.etc == input$country)  
    } else {
      bigcitiesfiltered <- filter(bigcities,name == input$city)
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


