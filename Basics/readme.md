
As John Chambers, the creator of R once said:
>"To understand computations in R, two slogans are helpful: 
>    1. Everything that exists is an object. 
>    2. Everything that happens is a function call".

> "We should forget about small efficiencies, say about 97% of the time: premature optimization is the root of all evil"
- Donald Knuth

## Principles of Analytic Graphics 

* Show comparisons
  
  When showing a graph it is always better to show comparison against 
  a controlled environment to have it be better visually interpreted 
  what the objective of the plotted data is.
  
  eg: Introducing air purifier in homes with children who suffer from 
  asthma, we plot the data of number of days children were symptom-free 
  when air purifier was introduced. The control group comprises of data 
  on children who did not have air purifiers.
  
* Show causuality, or mechanisms

  Aids in visually interpreting the outcome of the experiment or why 
  a particular event occured in the experiment, what changes to other 
  elements in the environment did it bring to support the outcome.
  
  eg: Introducing air purifier in homes with children who suffer from 
  asthma, with a control group having no air purifier. We would like to 
  know what caused the difference in the plots of the two groups. Thus 
  we observe changes to levels of PM2.5 in the atmosphere for both the 
  groups.

* Show multivariate data 

  To show correlation and integrated comparison between the distribution 
  of a variable with respect to one or more other variables 
  
  eg: Relation between PM2.5 level and the number of days children with 
  asthma do not exhibit symptoms 

* Integrate evidence 
  
  Integrate evidence and data to support the hypothesis, also the data to 
  explain the plot and how the different components are related and support 
  the hypothesis. completely integrate works, images, numbers and diagrams 
  using the flexible tools that can be used in R. Don't let the tools drive
  the analyis instead perform the analysis by incorporating various tools 
  and integrating them in the final output. it must be easily interpretible 
  and make sense just by looking without having to look paste the graphic 
  into documentations or other descriptions 
  
* Describe and document the evidence with appropriate labels, scales, 
  and sources etc.
  
  Data graphic should tell the complete story that is credible, by properly 
  documenting the source and having the source code available, along with 
  information on what actions were performed on the data, enables others to 
  reproduce the data. 

* Content is king
  
  Without good content there isn't much that can be done to make an interesting 
  enough graphic.   
  
## Asking Questions 
* Steps to reproduce the problem
* What is expected output 
* What is seen instead
* What version of product is error encountered 
* What operating system
* Additional information 

## Removing NA values 

We have a dataset with missing values
```
x = c(1, NA, 2, NA, 3, NA, 4, NA, 5)
```
We parse the dataset and create a boolean variable that indexes the position of missing values as true

```
bad = is.na(x)
```
We use the boolean variable, inverse the values, and displays all values which are not missing.
```
x[!bad]
```

Output
```
[1,] 1 2 3 4 5
```

Alternatively we can use complete.cases()

Creates a logical vector which tells us which rows are complete ie. no one column in the entire row has a missing value
eg: 

```
good = complete.cases(airquality)
```

We obtain the indices of rows that have complete data and store it in variable "good" as TRUE indices. Then we subset the original dataset by passing the variable.
```
airquality[good,]
```

## Subsetting

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

### Table 

It is important to sometimes serparate out a column from the dataset/dataframe and view its contents separately.

    table(dataset$fieldColumn,useNA="if any")           # To view one single column
    table(dataset$field1,dataset$field2)                # To compare the relation between two columns 


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

## Handing/Cleaning character strings 

### Built-in

* strsplit()

  For splitting variable names 
  ```
  splitNames = strsplit(dataset,"\\.")
  ```
  
  Splits all substrings separated by "."

* sub()

  Replacing first instance of a substring in a string with another string  
  ```
  new_name = sub("_","",dataset)
  ```
  
  Replaces first instance of "_" with nothing
  ```
  "My_name_is_Anandu" will be replaced with "Myname_is_Anandu"
  
* gsub()

  Replacing multiple instances of a substring in a string with another string
  ```
  new_name = gsub("_","",dataset)
  ```
  
  Replaces all "_" with nothing
  ```
  "My_name_is_Anandu" will be replaced with "MynameisAnandu"
  
* grep()

  To search for index position where a search string is located within a list of strings/character vector or where it appears 
  ```
  new_name = grep("Anandu",dataset)
  ```
  Returns indices where "Anandu" is located 
  
  The parameter "value = T" returns the strings themselves whereever the search term appears 
  
* grepl()

  Returns a logical vector representing whether search string is located at position in the character vector 
  ```
  new_name = grepl("Anandu",dataset)
  ```
  Returns logical vector indicating wherever search item is located.
  
  We can easily subset a character vector using this command 

* make.names()

  Returns a string or  the list of string of a character vector wherein all the strings are made into valid column names by replacing the space with '.' for easier access to data.
### External package 

Library:
  ```
  stringr
  ```
  
* nchar()
  
  Returns the length of string
  
* substr()

  Returns substring from a string specified start and end index. Implicitely provides whitespace between the characters 
  
  
* paste()

  Concatenates two strings  
  
* paste0() 

  Concatenate without implicitely providing whitespace in between the characters.
  
* str_trim()

  Trim the whitespaces in a string 
  
  
## Metacharacters 

* ^ :

  To represent literals at the beginning of the line 
  
  eg:
  ```
  "^My"
  ```
  The function will return only those strings which begin with the given term
  
* $ : 

  To represent literals at the end of the line 
  
  eg:
  ```
  "Anandu$"
  ```
  The function will return only those strings which end with the given term
  
* [] : 

  To represent a group or list of characters of which any one may be selected to match a search term or string
  
  eg: 
  ```
  grep("[Bb]ush",dataset)
  ```  
  Will return all indices where either "Bush" or "bush" is located.

  [0-9] represent numbers 0 to 9
  
  [a-zA-Z] represent alphabets both lowercase and uppercase.
  
* .

  The "." is used to refer to any character 
  
* | "pipe"

  To specify alternatives that can be otherwise looked for. 
  
* "*" 

  Represents repetition or any number of characters or non-characters 
  
  eg:
  ```
  grep("(.*)",dataset)
  ```
  Looks for instances where there is elements within paranthesis and returns the positions.
  
* "+" 

  Represents atleast one instance of the character within string 
  
  eg:
  ```
  grep("^[0-9]+.*",dataset)
  ```
  Looks for strings beginning with atleast one numeric value followed by any sequence/combination of characters
  
* { } 
  
  They are referred to as interval quantifiers, they let us specify the minimum and maximum number of matches of an expression
  
## Simulation
Generating Random numbers 

### Functions for probabilty distrubutions in R
* rnorm : Generate random normal variates with given mean and standard distribution
    
  ```
  rnorm(n, mean = 0, sd = 1) 
  ```
* dnorm : Evaluate the Normal Probaility Density with given mean and sd at a given point or vector of points
    
  ```
  dnorm(x, mean = 0, sd = 1, log = FALSE)
  ```
    
* pnorm : Evaluates the cumulative distribution function for a normal distribution
    
  ```
  pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) 
  ```

* rpois : Generate random Poisson distribution with given rate

  ```
  rpois(n, lambda) 
  ```

Probability distribution functions usually have four functions associated with them. The functions are prefixed with a
* d : for density
* p : for cumulative distribution
* r : for random number generation
* q : for quantile function

Generating same set of Random number can be important to reproduce the exact same result 

  For this purpose the 
  ```
  set.seed()
  ```
  function is used just before generating the random numbers using the above mentioned functions
  
### Generating a linear model 

```
y = Beta0 + Beta1 * x + e
```

set seed 
```
set.seed(20)
```

Generating the x co-efficient or predictor variable of the linear model
```
x = rnorm(100)
```

Generating the epsilon term with mean 0 and standard deviation 2
```
e = rnorm(100,0,2)
```

Linear model for Beta0 = 0.5, Beta1 = 2
```
y = 0.5 + 2 * x + e
```

Plotting the linear model 
```
plot(x,y)
```

### Random Sampling

Setting seed
```
set.seed(30)
```

Sampling 5 random integers between 1 and 10
```
sample(1:10,5)
```

Sampling 5 random letters/alphabets
```
sample(letters,5)
```

To generate random permutation between 1 and 10
```
sample(1:10)
```

## Melt and cast 

Install and load the necessary package
```
require("reshape")
```

Usage demonstration:
```
mtcars$carname = rownames(mtcars)
```
Performing melt operation which converts a wide dataset into a narrow one
```
carsMelt = melt(mtcars,id = c("carname","gear","cyl"),measure.vars = c("mpg","hp"))
```
Performing analysis with 'cyl' value - casting with id cyl
By default gives count of variable type for the specified id
```
cylData = cast(carsMelt, cyl ~ variable)
```
Applying mean function to summarise the dataset 
```
cylDataMean = cast(carsMelt, cyl ~ variable, mean)
```

## Date manipulation using lubridate library

Library:
```
lubridate
```

Provides functions that help processing date data swiftly and efficiently 

console:
```
ymd("20140408")
```
Output:
```
"2014-04-08 UTC"
```

Similarly the functions myd,dmy,dym and so on..

ymd_hms for specifying the hours minutes and seconds 

To get the weekday from the date instead of the "weekday()" function we use "wday()" 
```
wday("1jan2013")
```
Output:
```
3

To get actual name specify the parameter "label = T"
```
wday("1jan2013",label = T)
```
Output:
```
Tues


## Looping on Command-line
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
   * ###### Example : Splitting a dataset into various objects based on the factor "month" to obtain data separate for each month
      ```
      split(airquality, airquality$month
      ```
   * When combining multiple different factor objects say, Month(12 levels) and Gender(2 levels - arbitrarily selected), we pass the factors as a list, and the split function automatically creates an interaction between the two factor objects and that interaction has 2 * 12 -> 24 levels in it, and parses the data based on the interaction. Note : To drop empty results specify the 'DROP = T' argument of split function
    

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


## Important Links 

* https://uc-r.github.io/missing_values
* https://www.r-bloggers.com/
* https://www.rdocumentation.org/

### Open Government Sites 
* [United Nations](http://data.un.org/)
* [U.S.](http://data.gov/)
    - List of cities/States with open data
* [United Kingdom](http://data.gov.uk/)
* [France](http://data.gouv.fr/)
* [Ghana](http://data.gov.gh/)
* [Germany](http://www.govdata.de/)
* [Hong Kong](https://data.gov.hk/en-data/dataset/)
* [Japan](https://www.data.go.jp/?lang=english)
* [More...](http://www.data.gov/opendatasites)
    
### Thirdparty Sites 
* [Gapminder](http://www.gapminder.org)
* [Survey data from U.S.](http://www.asdfree.com)
* [Infochimps Marketplace](http://www.infochimps.com/marketplace)
* [Kaggle](http://www.kaggle.com)

### Collections by data scientists 
* [Hilary Mason](http://bitly.com/bundles/hmason/1)
* [Peter Skomoroch](https://delicious.com/pskomoroch/dataset)
* [Jeff Hammerbacher](http://www.quora.com/Jeff-Hammerbacher/Introduction-to-Data-Science-Data-Sets)
* [Gregory Piatsky-Shapiro](http://www.kdnuggets.com/gps.html)
