suppressPackageStartupMessages(library(googleVis))
motionChart = gvisMotionChart(Fruits, idvar = "Fruit", timevar = "Date",
                              options = list(width = 600, height = 400))
plot(motionChart)


gchart <-  gvisGeoChart(data = Exports, 
                        locationvar='Country',
                        colorvar='Profit',
                        options=list(projection="kavrayskiy-vii", 
                                     width=400, height=200))
plot(gchart)

wt1 <- gvisWordTree(Cats, textvar = "Phrase")
plot(wt1)


df <- data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))
Line1 <- gvisLineChart(df, xvar="country", yvar=c("val1", "val2"))
print(Line1, file = "linechart.html")
