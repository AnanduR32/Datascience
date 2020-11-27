library(shiny)
shinyServer(function(input,output){
  mtcars$mpgsp = ifelse(mtcars$mpg-20>0,mtcars$mpg-20,0)
  mdl1 = lm(hp~mpg+I(mpg**2)+I(mpg**3), data = mtcars)
  mdl2 = lm(hp~mpgsp+mpg+I(mpg**2)+I(mpg**3), data = mtcars)
  mdl1_pred = reactive({
    mpg_IN = input$sliderMPG
    predict(mdl1, newdata = data.frame(mpg = mpg_IN))
  })
  mdl2_pred = reactive({
    mpg_IN = input$sliderMPG
    predict(mdl2, newdata = data.frame(mpg = mpg_IN, 
                                       mpgsp = ifelse(mpg_IN-20>0,
                                                      mpg_IN-20,0)))
  })
  output$plot1 = renderPlot({
    mpg_IN = input$sliderMPG
    plot(mtcars$mpg, mtcars$hp, xlab= "Miles per gallon", ylab = "Horsepower", 
         bty = "n", pch = 16, xlim = c(10,35), ylim = c(50,350))
    if(input$show_mdl1){
      mdl1_lines = predict(mdl1, newdata = data.frame(
        mpg = 10:35
      ))
      lines(10:35, mdl1_lines, col = "red", lwd = 2)
    }
    if(input$show_mdl2){
      mdl2_lines = predict(mdl2, newdata = data.frame(
        mpg = 10:35, mpgsp = ifelse(10:35-20>0, 10:35-20,0)
      ))
      lines(10:35, mdl2_lines, col = "blue", lwd = 2)
    }
    legend(25,250, c("Model 1 prediction", "Model 2 prediction"), pch = 16, 
           col = c("red","blue"), bty = "n", cex = 1.2)
    points(mpg_IN,mdl1_pred(), col = "red", pch = 16, cex = 2)
    points(mpg_IN,mdl2_pred(), col = "blue", pch = 16, cex = 2)
  })
  output$pred_mdl1 = renderText({
    mdl1_pred()
  })
  output$pred_mdl2 = renderText({
    mdl2_pred()
  })
})