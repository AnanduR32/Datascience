library(shiny)
shinyUI(
  fluidPage(
    titlePanel("Data Science using Shiny"),
    sidebarLayout(
      sidebarPanel(
        h3("Sidebar panel Text")
      ),
      mainPanel(
        h3("Main panel Text")
      )
    )
  )
)