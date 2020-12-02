library(shiny)
shinyServer(function(input, output) {
  output$randPlot <- renderPlot({
    set.seed(2020-11-26)
    num_points = input$numeric
    min_X = input$slider_X[1]
    max_X = input$slider_X[2]
    min_Y = input$slider_Y[1]
    max_Y = input$slider_Y[2]
    data_X = runif(num_points,min_X,max_X)
    data_Y = runif(num_points,min_Y,max_Y)
    xlab = ifelse(input$show_Xlab, "X axis", "")
    ylab = ifelse(input$show_Ylab, "Y axis", "")
    main  = ifelse(input$show_title, "Plotting random points", "")
    plot(data_X,data_Y, main = main, xlab= xlab, ylab = ylab, xlim = c(-100,100), ylim = c(-100,100))
    })
})
