library(shiny)

shinyServer(function(input, output){
  library(tidyr)
  aq_df <- drop_na(airquality, Solar.R)
  
  model1 <- reactive({
    if(input$month == 10){
      lm(Temp ~ Solar.R, data = aq_df)}
    else{
      lm(Temp ~ Solar.R, data = aq_df[aq_df$Month == input$month, ])}
  })
  
  model2 <- reactive({
    if(input$month == 10){
      lm(Temp ~ Wind, data = aq_df)}
    else{
      lm(Temp ~ Wind, data = aq_df[aq_df$Month == input$month, ])}
  })
  
  model3 <- reactive({
    if(input$month == 10){
      lm(Temp ~ Solar.R + Wind, data = aq_df)}
    else{
      lm(Temp ~ Solar.R + Wind, data = aq_df[aq_df$Month == input$month, ])}
  })
  
  model1pred <- reactive({
    srInput <- input$sliderSR
    predict(model1(), newdata = data.frame(Solar.R = srInput))
  })
  
  model2pred <- reactive({
    wInput <- input$sliderW
    predict(model2(), newdata = data.frame(Wind = wInput))
  })
  
  model3pred <- reactive({
    srInput <- input$sliderSR
    wInput <- input$sliderW
    predict(model3(), newdata = data.frame(Solar.R = srInput, Wind = wInput))
  })
  
  output$plot1 <- renderPlot({
    srInput <- input$sliderSR
    
    if(input$month == 10){
      plot(aq_df$Solar.R, aq_df$Temp, xlab = "solar radiation in Ly",
           ylab = "temperature (ºF)", bty = "n", pch = 16,
           xlim = c(0, 350), ylim = c(50, 100))
      
      legend(260, 100, "Month: All", pch = 16, 
             col = "transparent", bty = "n", cex = 1.2)
      
      if(input$showModel1){
        abline(model1(), col = "gold", lwd = 2)
        
        legend(260, 104, "Temp Prediction from Solar.R", pch = 16,
               col = "gold", bty = "n", cex = 1.2)
        
        points(srInput, model1pred(), col = "gold", pch = 16, cex = 2)
      }
    }
    
    else{
      mes <- function(x = input$month){
        plot(aq_df[aq_df$Month == x, 2], aq_df[aq_df$Month == x, 4], 
         xlab = "solar radiation in Ly",
         ylab = "temperature (ºF)", bty = "n", pch = 16,
         xlim = c(0, 350), ylim = c(50, 100))
    
      legend(260, 100, paste("Month:", x), pch = 16, 
             col = "transparent", bty = "n", cex = 1.2)
      }
    
      mes()
    
      if(input$showModel1){
        abline(model1(), col = "gold", lwd = 2)
      
        legend(260, 104, "Temp Prediction from Solar.R", pch = 16, 
             col = "gold", bty = "n", cex = 1.2)
      
        points(srInput, model1pred(), col = "gold", pch = 16, cex = 2)
      }
    }
  })
  
  output$plot2 <- renderPlot({
    wInput <- input$sliderW
    
    if(input$month == 10){
      plot(aq_df$Wind, aq_df$Temp, xlab = "wind speed in mph",
         ylab = "temperature (ºF)", bty = "n", pch = 16,
         xlim = c(0, 25), ylim = c(50, 100))
      
      legend(18, 100, "Month: All", pch = 16, 
             col = "transparent", bty = "n", cex = 1.2)
  
      if(input$showModel2){
        abline(model2(), col = "blue", lwd = 2)
      
        legend(18, 104, "Temp Prediction from Wind", pch = 16,
             col = "blue", bty = "n", cex = 1.2)
      
        points(wInput, model2pred(), col = "blue", pch = 16, cex = 2)
      }
    }
    
    else{
      mes <- function(x = input$month){
        plot(aq_df[aq_df$Month == x, 3], aq_df[aq_df$Month == x, 4], 
             xlab = "wind speed in mph",
             ylab = "temperature (ºF)", bty = "n", pch = 16,
             xlim = c(0, 25), ylim = c(50, 100))
        
        legend(18, 100, paste("Month:", x), pch = 16, 
               col = "transparent", bty = "n", cex = 1.2)
      }
      
      mes()
      
      if(input$showModel2){
        abline(model2(), col = "blue", lwd = 2)
        
        legend(18, 104, "Temp Prediction from Wind", pch = 16, 
               col = "blue", bty = "n", cex = 1.2)
        
        points(wInput, model2pred(), col = "blue", pch = 16, cex = 2)
      }
    }
  })
  
  output$pred1 <- renderText({
    if(input$showModel1){
      round(model1pred(), 2)}
  })
  
  output$pred2 <- renderText({
    if(input$showModel2){
    round(model2pred(), 2)}
  })
  
  output$pred3 <- renderText({
    if(input$showModel1 & input$showModel2){
    round(model3pred(), 2)}
  })
})