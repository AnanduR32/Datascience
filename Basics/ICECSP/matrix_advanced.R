## Considering the matrix 
A = matrix(c(1,5,-2,1,2,-1,3,6,-3),nrow=3)

## Checking if A^3 == 0, where 0 is a 3x3 matrix whose all elements
## are equal to 0
A%*%A%*%A == matrix(rep(0,9),nrow=3)
# Output is "TRUE" for all elements of LHS equal to all elements of RHS

## Replacing the third column of A by sum of 2nd and 3rd columns
A[,3] = A[,2]+A[,3]

## Creating a matrix B with repeating element rows c(10,-10,10) for 15 rows 
B = matrix(rep(c(10,-10,10),15),nrow = 15, byrow = T)
Bt = t(B)

## The 3x3 matrix obained from the matrix multiplication of transpose with the matrix is
Bt%*%B

## Creating a 6x6 matrix with all elements equal to 0
matE = matrix(rep(0,36),nrow = 6)

## creating pattern matrix
matE[abs(col(matE)-row(matE))==1] = 1

## other patterns 
outer(0:4,0:4,"+")
