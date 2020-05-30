 The par() function is used to specify global graphics parameters that affect all plots in an R session. (Use dev.off or plot.new to reset to the defaults.)

To add lines, you give a vector of x values and a corresponding vector of y values (or a 2-column matrix); the function lines just connects the dots.

## Base Plotting System

#### Functions 
* plot()
* hist()
* barplot()
* boxplot()
* and so on...

#### Annotations 
* title()
* points()
* legend()

## Lattice Plotting System
* xyplot() - To create scatterplots
* bwplot() - To create boxplots
* histogram() - To create histograms 
* stripplot() - Like boxplot, with actual points 
* splom() - Scatterplot matrix, like pairs in base plot system
* levelplot(), contourplot() - For plotting "image" data 

