library(shiny)
shinyUI(fluidPage(
  titlePanel("Interpreting multiple models using brush"),
  sidebarLayout(
    sidebarPanel(
      h4("Slope"),
      textOutput("slopeOut"),
      h4("Intercept"),
      textOutput("InterceptOut")
    ),
    mainPanel(
      plotOutput("plot1",
                 brush = brushOpts(id = "brush1")
      )
    )
  )
))