# Looping on Command-line
* #### lapply : 

    * Loop over a list and evaluate a function on each element
    * Always returns a list
    
    * ###### Structure :     
         ```
         function (X, FUN, ...)  
         ```         
      |Arg(s)|Details|
      |----|---------|
      |X   | Data    |
      |FUN | Function|
      |... | List of arguments to the function passed |

* #### sapply : 

    * Same as lapply but tries to simplify the result 
    * Returns vector if every element is an object of length 1, if every element is object of same length (length>1) then matrix returned else a list is returned.

* #### apply : 

   * Apply a function over the margins of an array 
   * Not faster than looping constructs - for loop. Only advantage - less typing. 
   
   * ###### Structure : 
      ```
      function (X, MARGIN, FUN, ...)  
      ```
      |Arg(s)  |Details                                     |
      |--------|--------------------------------------------|
      |X       | Array                                      |
      |MARGIN  | Tells which margins are to be retained     |
      |FUN     | Function                                   |
      |...     | List of arguments to the function passed   |
   
   Variants of apply for 2 dimensional arrays(matrices):
         
      rowSums     ==  apply(data, 1, sum)
      rowMeans    ==  apply(data, 1, mean)
      colSums     ==  apply(data, 2, sum)
      colMeans    ==  apply(data, 2, mean)
   
   ###### Example :
      
   1. Creating a matrix with 20 rows and 10 columns

   ```
   x = matrix(rnorm(200),20,10)
   ```
   Using apply() to apply the quantile function over the 10 columns of each row to find the 25% and 75% quantile values.

   ```
   View(apply(x,1,quantile,probs=c(0.25,0.75)))
   ```

   2. Finding the mean of 3D array 

   Creating a 3D array (2x2x10)

   ```
   x = matrix(rnorm(40),c(2,2,10))
   ```

   Resultant is 2D array (2x2) 
   ```
   apply(x,c(1,2),mean)
   ```
        
* #### tapply : 

   * ###### Apply a function over subsets of a vector 
   * ###### Structure : 
      ```
      function (X, INDEX, FUN = NULL, ..., SIMPLIFY = TRUE)  
      ```
      |Arg(s)     |Details                                     |
      |-----------|--------------------------------------------|
      |X          | Array                                      |
      |INDEX      | Factor or list of factors                  |
      |FUN        | Function                                   |
      |...        | Arguments - objects pass to function       |
      |SIMPLIFY   | Whether to simplify the results            |
      
   * ###### Example : To find the mean of groups in a dataset
   
      Creating a dataset with 3 groups - 
      * list of 10 normal distributions 
      ```
      rnorm(10)
      ```
      * 10 uniform distributions
      ```
      runif(10)
      ```
      * 10 normal distributions with mean 1
      ```
      rnorm(10,1)
      ```
      -> List(rnorm(10),runif(10),rnorm(10,1))
      
      Creating factor variables with 3 levels to represents each group in dataset.
      ```
      f = gl(3,10)
      ```
      There are three levels and each level is repeated 10 times in sequence
      
      Applying tapply to find mean of each group of lists
      ```
      tapply(x, f, mean)
      ```
      
      Applying tapply to find the range of each subset in the dataset
      ```
      tapply(x, f, range)
      ```
      
      Thus information on subset of dataset can be derived using the tapply function     
      
      
* #### mapply : 

   * ###### Multivariate version of tapply
   * ###### Structure : 
      ```
      function (FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)  
      ```
      |Arg(s)     |Details                                     |
      |-----------|--------------------------------------------|
      |FUN        | Function                                   |
      |...        | Arguments - objects to apply function over |
      |MoreArgs   | List of other arguments to function        |
      |SIMPLIFY   | Whether to simplify the results            |
      |USE.NAMES  |                                            |
      
   * ###### Example : 
   
      Creating a List of vectors containing four 1s, three 2s, two 3s and one 4 can be tedious using the regular method 
      ```
      List(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
      ```
      
      Hence we use the mapply function, which does the same job, only less typing
      ```
      mapply(rep, 1:4, 4:1)
      ```    
    
* #### split : 
   
   * Separates the elements of a vector or object into groups determined by a factor variable or list of factors. 
   
    
