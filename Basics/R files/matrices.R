# Creating 2 vectors A and B
A = c(1,2,3)
B = c(4,5,6)

# Creating a 2x3 matrix using A and B vectors 
rbind(A,B)

# Creating a 3x3 matrix with elements 1 to 9
mat = matrix(1:9,nrow=3)

# Mean of matrix
mean(mat)

# Standard deviation
sd(mat)

# Sum
sum(mat)

# Row-wise sum
apply(mat,1,sum)
rowSums(mat)

# Column-wise sum
apply(mat,2,sum)
colSums(mat)

# Confirming mat is a matrix
is.matrix(mat)

# Creating a 5x5 matrix 1:25, top row containing 1 to 5
mat2 = matrix(1:25,nrow=5,byrow = T)

# assigning row names to mat2
rn = c("Day 1","Day 2","Day 3","Day 4","Day 5")
rownames(mat2) = rn

# Indexing notations to grab subsections of matrix
mat2[2:3,2:3]
mat2[4:5,4:5]

# Sum of all the elements in mat2
sum(mat2)

# runif to create a 4x5 matrix with 20 random numbers
matrix(runif(20),nrow = 4)
