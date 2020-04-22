## Installing rhdf5 library/packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("rhdf5")

library(rhdf5)

## Creating a hdf5 file set
created = h5createFile(
  'example.h5'
)
created

## Creating groups within the file 
created = h5createGroup(
  'example.h5','group1'
)
created = h5createGroup(
  'example.h5','group2'
)
created = h5createGroup(
  'example.h5','group1/group3'
)
h5ls('example.h5')


## Writting content to the hdf5 file
A = matrix(1:20,nrow = 4)
h5write(A,'example.h5','group1/A')

## Reading hdf5 file/dataset
h5read("example.h5","group1/A")

## Overwritting data 'A'
h5write(c(99,98,97),"example.h5","group1/A",index=list(2:4,3))
## replaces the contents of the rows 2-4 of column 3 for the dataset A with 
## content specified c('99','98','97')
h5read("example.h5","group1/A")
