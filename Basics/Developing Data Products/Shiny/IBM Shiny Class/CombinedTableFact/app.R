library(shiny)

ui = fluidPage(
  titlePanel("Multiple Choice "),
  sidebarLayout(
    sidebarPanel(
      sliderInput("num", "Number", 1, 10, 1,step = 1)),
  radioButtons("choice", "Output Type:",
               c("Table" = "tabl",
                 "Factorial" = "fact"))
  ),
  mainPanel(
    tableOutput("print")
  )
)

server = function(input, output) {
  # Server output
  output$print = renderPrint({ 
    output$print = renderPrint({ 
      x<-input$num
      ch = input$choice
      if(ch == "tabl"){
        for(i in 1:10){
          a=x*i
          cat(x,"x",i,"=",a,"<br>")
        }
      }else{
        a=factorial(x)
        cat(a," is the factorial of ",x,"<br>")
      }
    })
      
  })
}

shinyApp(ui = ui, server = server)
