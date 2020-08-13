
# ------------------------ Graphical Presentations ---------------------------------#
install.packages("ggplot2")

## ggplot - grammar of graphics plot
## A plot has :
### Mandatory
##    1. Data - what you put on the axis 
##    2. Aesthetics - the elements in chart
##    3. Geometry type of chart 
### Optional
##    4. Facet - breaking the chart into multiple subcharts 
##    5. Theme
##    6. Statistics

library(ggplot2)

## ggplot2movies package for the 'movies' dataset to be used for this tutorial on using ggplot2 package in R
install.packages("ggplot2movies")
library(ggplot2movies)
View(movies)
nrow(movies)

## Creating a histogram to find the frequency distribution of movie ratings
ggplot(movies, aes(x = rating, color=cut)) + geom_histogram(color = 'white',bins = 10, fill = 'orange')
## Question : Create a histogram on the mtcars dataset to show how many cars have milage different groups
View(mtcars)
ggplot(mtcars, aes(x = mpg, color=cut)) + geom_histogram(color = 'white',binwidth = 5, fill = 'orange', alpha = 0.8) + ggtitle('Mileage Ranges for Cars') + labs(x = 'mileage', y = 'frequency')

## Scatterplot
### Scatterplot to find the correlation between the weights and mileage of vehicles 
ggplot(
  mtcars, aes(
    x = wt, y = mpg, color=cut
    )
  ) + geom_point(
    color = 'black', size = 4,aes(
      color = cyl
      )
    ) + ggtitle(
      'Wight and mileage correlation'
      ) + labs(
        x = 'weight', y = 'mileage'
        )

ggplot(
  mtcars, aes(
    x = wt, y = mpg, color=cut
    )
  ) + geom_point(
    size = 4,aes(
      color = cyl
      )
    ) + ggtitle(
      'Wight and mileage correlation'
      ) + labs(
        x = 'weight', y = 'mileage'
        )

## Question: Modify the scatterplot to show different shapes based on the number of cylinders 
ggplot(
  mtcars, aes(
    x = wt, y = mpg, color=cut
    )
  ) + geom_point(
    size = 4,aes(
      color = cyl, shape = factor(
        cyl
        )
      )
    ) + ggtitle(
      'Wight and mileage correlation'
      ) + labs(
        x = 'weight', y = 'mileage'
        )

## Bar chart of count of class of vehicles in the mpg dataset 
View(mpg)
ggplot(
  mpg,
  aes(
    x = class
  )
) + geom_bar(
  color = 'black',
  fill = 'orange'
)

## Stacked bar chart by stacking the drive-train type frontwheel rearwheel or all wheel drive
ggplot(
  mpg,
  aes(
    x = class
  )
) + geom_bar(
  color = 'black',
  aes(
    fill = drv
    )
)

ggplot(
  mpg,
  aes(
    x = class
  )
) + geom_bar(
  color = 'black',
  aes(
    fill = drv
  ),
  position = "dodge"
)

ggplot(
  mpg,
  aes(
    x = class
  )
) + geom_bar(
  color = 'black',
  aes(
    fill = drv
  ),
  position = "fill"
)

## Boxplot chart using mtcars dataset - In terms of  Mileage and cyliners

ggplot(
  mtcars,
  aes(
    x = factor(cyl), # factor converts numeric variable into groups - continous variable to discrete 
    y = mpg
  )
) + geom_boxplot(
  aes(fill=cyl)
)
ggplot(
  mtcars,
  aes(
    x = factor(cyl), # factor converts numeric variable into groups - continous variable to discrete 
    y = mpg
  )
) + geom_boxplot(
  aes(fill=factor(cyl))
) + coord_flip() + theme_grey()

### Getting more themes 
install.packages('ggthemes')

# -----------------------------END--------------------------------------------------#
