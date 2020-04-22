## Ordering with plyr package 
library(plyr)

mat = matrix(1:25,nrow = 5,byrow = T)
mat = as.data.frame(mat)
arrange(mat,V1)
