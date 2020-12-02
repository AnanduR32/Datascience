library(shiny)
shinyServer(
  function(input, output){
    output$Out_1 = renderText(input$box1)
    output$Out_2 = renderText(input$box2)
    output$Out_3 = renderText(input$box3)
  }
)