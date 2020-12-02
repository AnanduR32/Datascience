library(shiny)
shinyUI(fluidPage(
    titlePanel("Plot random numbers"),
    sidebarLayout(
        sidebarPanel(
          numericInput("numeric", "Count of datapoints:", value = 500, min = 1, max = 1000, step = 1),
          sliderInput("slider_X","Pick Min and max value X axis:",min = -100,max = 100,value = c(-70,70)),
          sliderInput("slider_Y","Pick Min and max value Y axis:",min = -100,max = 100,value = c(-70,70)),
          checkboxInput("show_Xlab", "Show X lab", value = T),
          checkboxInput("show_Ylab", "Show Y lab", value = T),
          checkboxInput("show_title", "Show title", value = T)
        ),
        mainPanel(
          h3("Graph of random points"),
          plotOutput("randPlot")
        )
    )
))
