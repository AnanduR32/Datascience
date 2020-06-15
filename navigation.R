## Navigating to the project directory 
if(getwd()!="~/GitHub/Data_Science_R"){
  setwd("~/GitHub/Data_Science_R")
}

# Navigate to Case Studies
setwd("Case Studies")

# Navigate to Basics
setwd("Basics")

# Navigate to Clustering 
setwd("Basics/Clustering/rmd")

# Navigate to plotting
setwd("Basics/Plotting/rmd")

## Rendering to PDF - rmarkdown
# Plotting
rmarkdown::render("ggplot.Rmd",output_file = "../pdf/ggplot.pdf")

# Heirarchical Clustering
rmarkdown::render("hierarchical_clustering.Rmd",output_file = "../hierarchical_clustering.pdf")

# K-Means Clustering
rmarkdown::render("k-means_clustering.Rmd",output_file = "../k-means_clustering.pdf")
