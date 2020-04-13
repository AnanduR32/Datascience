# Looping on Command-line
* lapply : 

    Loop over a list and evaluate a function on each element
    
    Always returns a list
    
* sapply : 

    Same as lapply but tries to simplify the result 
    
    Returns vector if every element is an object of length 1, if every element is object of same length (length>1) then matrix returned else a list is returned.

* apply : 

    Apply a function over the margins of an array 
    
    Not faster than looping constructs - for loop. Only advantage - less typing. 

* tapply : 

    Apply a function over subsets of a vector 
    
* mapply : 

    Multivariate version of tapply
    
* split : 

    
