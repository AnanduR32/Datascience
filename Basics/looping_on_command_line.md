# Looping on Command-line
* lapply : 

    * Loop over a list and evaluate a function on each element
    * Always returns a list
    
* sapply : 

    * Same as lapply but tries to simplify the result 
    * Returns vector if every element is an object of length 1, if every element is object of same length (length>1) then matrix returned else a list is returned.

* apply : 

    * Apply a function over the margins of an array 
    * Not faster than looping constructs - for loop. Only advantage - less typing. 

    Variants of apply for 2 dimensional arrays(matrices):
    
        rowSums     ==  apply(data, 1, sum)
        rowMeans    ==  apply(data, 1, mean)
        colSums     ==  apply(data, 2, sum)
        colMeans    ==  apply(data, 2, mean)
    
    Example :
        
    1. Creating a matrix with 20 rows and 10 columns

    ```
    x = matrix(rnorm(200),20,10)
    ```

    Using apply() to apply the quantile function over the 10 columns of each row to find the 25% and 75% quantile values.

    ```
    View(apply(x,1,quantile,probs=c(0.25,0.75)))
    ```
    
    2. Finding the mean of 3D array (2x2x10) - Result stored in 2D array (2x2) 
    
    ```
    x = matrix(rnorm(40),c(2,2,10))
    apply(x,c(1,2),mean)
    ```
        
* tapply : 

    * Apply a function over subsets of a vector 
    
* mapply : 

    * Multivariate version of tapply
    
* split : 

    
