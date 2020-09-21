#### ------------------------- Mean squared error ------------------------- ####

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
myHist = function(mu){
  mse = mean((galton$child - mu)^2)
  ggplot(
    galton,
    aes(
      x = child
    )
  ) + geom_histogram(fill = "hotpink3", colour = "hotpink4", binwidth = 1) +
    geom_vline(xintercept = mu, size = 2, col = "orange") + 
    ggtitle("Variation in mse with change in mu",
            subtitle = paste("mu = ",mu,"MSE = ",round(mse,2))
            )
}

## Plotting with manipulate 
manipulate(myHist(mu), mu=slider(62,74,step = 0.5))

