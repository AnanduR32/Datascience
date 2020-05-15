## Laoding necessary packages and data
library(ggplot2)
library(data.table)
## Loading Data for visualization
df = fread("Economist_Assignment_Data.csv",drop=1)

## Observing data
head(df,5)

## Creating scatterplot CPI against HDI
ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point()

## Changing shape of point and increasing size
ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point(shape=3,size=4)

## Adding a trend line to the plot
ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point(
  shape=3,size=4
) + geom_smooth(
  aes(group=1)
)

## Editing the trend line to add method, color and formular
ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point(
  shape=3,size=4
) + geom_smooth(
  aes(group=1),method="lm",formula = y~log(x),se=F,color="red"
)

## Adding labels to the points, label added here - country name

ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point(
  shape=3,size=4
) + geom_smooth(
  aes(group=1),method="lm",formula = y~log(x),se=F,color="red"
) + geom_text(aes(label=Country))

## Selecting a subset of countries and labelling only those
## countries that are present in the list
list_country_to_select = c("India","Italy","Japan","United States",
                           "Britain","Norway","China","South Africa",
                           "Spain","Brazil","Myanmar","Sudan")

ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point(
  shape=3,size=4
) + geom_smooth(
  aes(group=1),method="lm",formula = y~log(x),se=F,color="red"
) + geom_text(
  aes(label=Country),data = subset(df,Country %in% list_country_to_select)
)

## Adding themes, labels and title
# Add theme
ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point(
  shape=3,size=4
) + geom_smooth(
  aes(group=1),method="lm",formula = y~log(x),se=F,color="red"
) + geom_text(
  aes(label=Country),data = subset(df,Country %in% list_country_to_select)
) + theme_bw()

# Add label
ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point(
  shape=3,size=4
) + geom_smooth(
  aes(group=1),method="lm",formula = y~log(x),se=F,color="red"
) + geom_text(
  aes(label=Country),data = subset(df,Country %in% list_country_to_select)
) + theme_bw(
) + scale_x_continuous(
  name = "Corruptions Perceptions Index 2011 (10 - Least Corrupted)",breaks = 1:10,limits = c(0.9,10.1)
) + scale_y_continuous(
  name = "Human Development Index 2011 (1 - Best)", breaks = seq(0,1,0.1), limits = c(0.2,1)
)

# Add title

ggplot(
  df,aes(x=CPI,y=HDI,color=Region)
) + geom_point(
  shape=3,size=4
) + geom_smooth(
  aes(group=1),method="lm",formula = y~log(x),se=F,color="red"
) + geom_text(
  aes(label=Country),data = subset(df,Country %in% list_country_to_select)
) + theme_bw(
) + scale_x_continuous(
  name = "Corruptions Perceptions Index 2011 (10 - Least Corrupted)",breaks = 1:10,limits = c(0.9,10.1)
) + scale_y_continuous(
  name = "Human Development Index 2011 (1 - Best)", breaks = seq(0,1,0.1), limits = c(0.2,1)
) + ggtitle("Corruption and Human Development"
)
                                    