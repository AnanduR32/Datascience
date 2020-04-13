pollutantmean = function(directory,pollutant,id=1:332){
  pollutants=c()
  f = list.files(directory)
  for(i in id){
    filepath=paste0(directory,"/" ,f[i])
    data = read.csv(filepath,header = T)
    pollutants = c(pollutants, data[,pollutant])
  }
  my_mean = mean(pollutants, na.rm=TRUE)
  my_mean
}
complete = function(directory,id=1:332){
  f = list.files(directory)
  ids = c()
  nobs = c()
  for(i in id){
    filepath=paste0(directory,"/" ,f[i])
    data = read.csv(filepath,header = T)
    dataCleaned = data[complete.cases(data),]
    ids = c(ids,i)
    nobs = c(nobs,nrow(dataCleaned))
  }
  result = data.frame(id = ids, nobs = nobs)
  result
}
corr = function(directory,threshold = 0){
  f = list.files(directory)
  id=1:332
  count = 0
  correlations = c()
  for(i in id){
    filepath=paste0(directory,"/" ,f[i])
    data = read.csv(filepath,header = T)
    dataCleaned = data[complete.cases(data),]
    
    if(nrow(dataCleaned)>threshold){
      correlations = c(correlations,cor(dataCleaned$sulfate,dataCleaned$nitrate))
      count = count+1
    }
  }
  correlations
}
