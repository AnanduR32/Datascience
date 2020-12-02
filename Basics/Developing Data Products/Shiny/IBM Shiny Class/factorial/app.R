library(shiny)

ui = fluidPage(
  titlePanel("Factorial"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("num", "integer", 1, 10, 1,step = 1)),
    mainPanel(
      tableOutput("print")
    ))
)

server = function(input, output) {
  output$print = renderPrint({ 
    x<-input$num
    a=factorial(x)
    cat(a," is the factorial of ",x,"<br>")
  })
}

shinyApp(ui = ui, server = server)
