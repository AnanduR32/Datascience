
### Subsetting

* [ ] 
    
Single square bracket is used to return object of the same class as the original. Subset of list is a list and so on.

Subsetting a matrix with [] returns a vector to return a matrix we specify the parameter "drop = F"" when extracting submatrices. 
        
* [[ ]]
        
Double square brackets is used to extract elements of a list or dataframe. The returned object need not necessarily be a list or dataframe.
        
Can pass variable as argument, with name of an element in the list to extract that element.
        
To extract element within an element we can pass a ordered vector as in List[[c(1,3)]] directing to the position of the element (in this case 1st element of list then extracting it's 3rd element) or apply double/triple subsetting as in List[[1]][[3]]. 

Partial matching - by specifying the parameter "exact = F", we can extract elements that have name that partially match with the specified name in parameter.
    
* $ 
    
Used to extract elements of a list or dataframe by name or semantics, similar to [[ ]]
        
Cannot pass a variable with name of element in list because it literally searches for the element in list with the variable name and not the value stored in that variable.

Partial matching is set to TRUE by default.