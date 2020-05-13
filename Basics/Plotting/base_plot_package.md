## Base plot package 

### Basic parameters avaiable

* pch : The plotting symbol
* lty : The line type 
* lwd : The line width, specified as an integer multiple
* col : The plotting color specified as a number, use colors() to see vector of colors available for use 
* xlab : Character string for x axis label 
* ylab : Character string for y axis label
* type : what type of plot should be drawn (eg: "n" for nothing)

### Global graphics parameters 

Specified using the par() function
  
* las : Specifying the orientation of the axis
* bg : Background color 
* mar : Margin size
* oma : The outer margin size 
* mfrow : Number of plots per row,column plots are filled row-wise
* mfcol : Number of plots per row,column, plots are filled column-wise

### Base plotting functions 

* plot : Make a scatterplot, or other type of plot depending on the class of the object being plotted
* lines : Add lines to the plot, given a vector x values and corresponding vector of y values (or a 2-column matrix)
* points : Adds points to a plot
* text : Add text labels to the plot using specified x,y coordinates
* title : Adds annotations to the x,y labels, title, subtitle, outer margin
* mtext: Adds arbitrary text to the margins (inner or outer) of the plot
* axis : Adding axis ticks/labels
* legend : Add legends to plots
