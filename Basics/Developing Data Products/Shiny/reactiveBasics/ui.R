library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict horsepower from MPG"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG", "MPG value", 10,35, value = 20),
      checkboxInput("show_mdl1","Show model 1", value = T),
      checkboxInput("show_mdl2","Show model 2", value = T)
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted horsepower from model 1"),
      textOutput("pred_mdl1"),
      h3("Predicted horsepower from model 2"),
      textOutput("pred_mdl2")
    )
  )
))