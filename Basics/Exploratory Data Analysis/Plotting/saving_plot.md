## plotting and saving 

Creating a blank canvas 
```
with(mtcars,plot(mpg, type = "n"))
```

Plotting data 
```
points(select(subset(mtcars,cyl==6),mpg), col = "red")
points(select(subset(mtcars,cyl==4),mpg), col = "blue")
points(select(subset(mtcars,cyl==8),mpg), col = "orange")
points(select(subset(mtcars,cyl!=8|cyl!=6|cyl!=4),mpg), col = "black")
```

Specifying the legend and title of plot
```
legend("topright",pch=1,col=c("blue","red","orange","black"),legend = c("4 cyl","6 cyl","8 cyl","unknown"))
title(main = "mpg values for various cylinder models")
```

Saving plot as png file 
```
dev.copy(png,file= "mpg_cyl.png")
```

Closing the device/file
```
dev.off()
```
