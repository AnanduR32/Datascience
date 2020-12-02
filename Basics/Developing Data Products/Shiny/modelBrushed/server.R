library(shiny)
shinyServer(function(input, output){
  mdl = reactive({
    brushed_data = brushedPoints(trees, input$brush1, xvar = "Girth",
                                 yvar = "Volume")
    if(nrow(brushed_data)<2){
      return(NULL)
    }
    lm(Volume~Girth, data = brushed_data)
  })
  output$slopeOut = renderText({
    if(is.null(mdl())){
      "No Model Found"
    }else{
      mdl()[[1]][2]
    }
  })
  output$InterceptOut = renderText({
    if(is.null(mdl())){
      "No Model Found"
    }else{
      mdl()[[1]][1]
    }
  })
  output$plot1 = renderPlot({
    plot(trees$Girth, trees$Volume, xlab = "Girth",
         ylab = "Volume", main = "Tree measurements", cex = 1.5, 
         pch = 16, bty = "n")
    if(!is.null(mdl())){
      abline(mdl(), col = "skyblue", lwd = 2)
    }
  })
})