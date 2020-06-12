## Navigating to the project directory 
if(getwd()!="~/GitHub/Data_Science_R"){
  setwd("~/GitHub/Data_Science_R")
}

# Navigate to Case Studies
setwd("Case Studies")

# Navigate to Basics
setwd("Basics")

# Navigate to plotting
setwd("Basics/Plotting/rmd")

## Rendering to PDF - rmarkdown
rmarkdown::render("ggplot.Rmd",output_file = "../pdf/ggplot.pdf")
