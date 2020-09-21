## Importing necessary packages and data
suppressMessages(
  {
    if(!require(manipulate)){
      install.packages("manipulate")
      library(manipulate)
    }
    library(UsingR)
    data("galton")
  }
)

## Defining plot function
myPlot <- function(beta){
  y <- galton$child
  x <- galton$parent
  freqData <- as.data.frame(table(x, y))
  names(freqData) <- c("child", "parent", "freq")
  freqData = mutate(freqData, child = as.numeric(as.vector(child)), parent = as.numeric(as.vector(parent)))
  mse <- mean( (y - beta * x)^2 )
  ggplot(
    freqData,
    aes(
      x = parent,
      y = child
    )
  ) + geom_point(pch = 21, col = "black", bg = "lightblue",
                 cex = .15 * freqData$freq) + 
    labs(x = "parent", y = "child") +
    geom_abline(intercept = 0, slope = beta, lwd = 2.5, col = "hotpink4") + 
    geom_point(aes(x = 0, y = 0), cex = 2, pch = 19) +
    ggtitle(paste("beta = ", beta, "mse = ", round(mse, 3))) + coord_cartesian(xlim = c(61,75), ylim = c(60,75))
}

## Plotting with manipulate 
manipulate(myPlot(beta), beta = slider(0.86, 1.18, step = 0.02))

