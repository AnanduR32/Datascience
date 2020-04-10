# ---------------------------------- basic_functions ------------------------------------- #

columnMeans = function(dataset, removeNA = T){
  nc = ncol(dataset)
  means = numeric(nc)
  for(i in 1:nc){
    means[i] = mean(dataset[,i], na.rm = removeNA)
  }
  means
}


# -------------------------------------- END --------------------------------------------- #