library(shiny); library(miniUI)
pickTrees = function(){
  ui = miniPage(
    gadgetTitleBar("Selective Plot"),
    miniContentPanel(
      plotOutput("plot1", height = "100%", brush = "brush")
    )
  )
  server = function(input, output, session){
    output$plot1 = renderPlot({
      plot(trees$Girth, trees$Volume, main = "Trees", 
           xlab = "Girth", ylab = "Volume")
    })
    observeEvent(
      input$done,
      {
        stopApp(
          brushedPoints(trees, input$brush, xvar = "Girth", yvar = "Volume")
        )
      }
    )
  }
  runGadget(ui, server)
}
pickTrees()
