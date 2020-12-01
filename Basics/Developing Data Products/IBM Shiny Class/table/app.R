library(shiny)

ui = fluidPage(
  titlePanel("TABLE"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("num", "integer", 1, 100, 1,step = 1)),
    mainPanel(
      tableOutput("print")
    ))
)

server = function(input, output) {
  output$print = renderPrint({ 
    x<-input$num
    for(i in 1:10){
      a=x*i
      cat(x,"x",i,"=",a,"<br>")
    }
  })
}

shinyApp(ui = ui, server = server)
