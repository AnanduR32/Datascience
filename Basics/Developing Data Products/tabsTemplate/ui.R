library(shiny)
shinyUI(fluidPage(
    titlePanel("Tabs template"),
    sidebarLayout(
        sidebarPanel(
            textInput("box1", "Enter tab 1", value = "Tab 1"),
            textInput("box2", "Enter tab 2", value = "Tab 2"),
            textInput("box3", "Enter tab 3", value = "Tab 3")
        ),
        mainPanel(
          tabsetPanel(
            type = "tabs",
            tabPanel("Tab 1", br(), textOutput("Out_1")),
            tabPanel("Tab 2", br(), textOutput("Out_2")),
            tabPanel("Tab 3", br(), textOutput("Out_3"))
          )
        )
    )
))
