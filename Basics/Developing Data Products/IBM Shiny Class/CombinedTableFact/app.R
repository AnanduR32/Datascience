library(shiny)

ui = fluidPage(
  titlePanel("Factorial"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("num", "integer", 140, 240, 180,step = 1)),
    mainPanel(
      tableOutput("print")
    ))
)

server = function(input, output) {
  
  # The predictor vector.
  Height = c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
  
  # The response vector.
  Weight <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)
  
  # Apply the lm() function.
  relation <- lm(Weight~Height)
  
  # Server output
  output$print = renderPrint({ 
    output$print = renderPrint({ 
      x<-input$num
      a=predict(relation,data.frame(Height = x))
      cat(a," is the predicted weight for person with height ",x,"<br>")
    })
      
  })
}

shinyApp(ui = ui, server = server)
