## Using base plotting package to plot the airquality data 
## for month of may against all other months 

## Creating a plot, but plotting no points on the plot
with(airquality, plot(Wind, Ozone, main = "Qzone and Wind in New York City",type = "n"))

## Plotting data from month of may in blue 
with(subset(airquality, Month==5), points(Wind, Ozone, col = "blue"))

## Plotting data or all other months other than may in red
with(subset(airquality, Month!=5), points(Wind, Ozone, col = "red"))

## Adding legend to the graph to communicate the information in the graph
legend("topright", pch = 1, col = c("blue","red"), legend = c("May","Other months"))
