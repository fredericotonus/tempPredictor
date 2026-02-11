library(shiny)

shinyUI(fluidPage(
  titlePanel("Predicting temperature from solar radiation and wind speed"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderSR", "What is solar radiation in Langley (Ly)?", 
                  7, 334, value=170),
      checkboxInput("showModel1", "Show solar model and its prediction", value=TRUE),
      sliderInput("sliderW", "What is wind speed in miles per hour (mph)?", 
                  1, 21, value=11),
      checkboxInput("showModel2", "Show wind model and its prediction", value=TRUE),
      radioButtons("month", "For which month do you want to analyse the data?", 
                   choiceNames = c("May (5)", "June (6)", "July (7)", 
                                   "August (8)", "September (9)", "All"),
                   choiceValues = c("5", "6", "7", "8", "9", "10")),
      submitButton("Done")
    ),
    mainPanel(
      h4("Predicted Temperature (ºF) from Solar Radiation"),
      textOutput("pred1"),
      plotOutput("plot1"),
      div(style = "border-bottom: 2px dashed #999"),
      h4("Predicted Temperature (ºF) from Wind"),
      textOutput("pred2"),
      plotOutput("plot2"),
      div(style = "border-bottom: 2px dashed #999"),
      h4("Predicted Temperature (ºF) from both variables combined"),
      textOutput("pred3")
     )
   )
 )
)