
As John Chambers, the creator of R once said:
>"To understand computations in R, two slogans are helpful: 
>    1. Everything that exists is an object. 
>    2. Everything that happens is a function call".

> "We should forget about small efficiencies, say about 97% of the time: premature optimization is the root of all evil"
- Donald Knuth


## Functions  
We can define basic functions in R using the 'function' keyword, and assign a 
name to that function which will be used to call the method and perform various
activities using in

```
func_name = function(){}
```

A function can take as many parameter as needed.
The variables defined within the function cannot be used outside the scope of 
the function, and the function environment is searched for a variable if the 
variable isn't defined in the function then the exterior environment(mostly the 
global environment is searched)

An example function that prints the means of all columns of a dataset is given
below  

```
columnMeans = function(dataset, removeNA = T){
  nc = ncol(dataset)
  means = numeric(nc)
  for(i in 1:nc){
    means[i] = mean(dataset[,i], na.rm = removeNA)
  }
  means
}
```  
It takes two arguments, the removeNA argument has a default value.

## Ordering with plyr package 

```{r}
library(plyr)
mat = matrix(1:25,nrow = 5,byrow = T)
mat = as.data.frame(mat)
arrange(mat,V1)
```

## Entropy  
* It is a measure of homogeneity of the set of examples 
* Given a set S of positive and negative examples of some target concept (a two class problem) the entropy of set S relative to this binary classification is 
    ```
    E(S) = - plogp - (1-p)log(1-p)
    ```
* Entropy is ideally supposed to be 1, which signifies perfect split of the data (halved).



## Debugging tools  
The primary tools for debugging in R are:

* traceback: Prints out the function call stack after an error occurs; does nothing if there is no error 
* debug: flags a function for debug mode which allows you to step through the execution of a function one line at a time 
* browser: Suspends the execution of the funtion whenever it is called and puts the function in debug mode
* trace: Allows you to insert debugging code into function at specific places 
* recover: Allows you to modify error behavious so that you can browser the function call stack 

