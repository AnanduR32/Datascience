## Reading data 
* Reading and writing tabular data - dataframes and tables
    #### Reading
    ```
    read.table
    ```
    ```
    read.csv
    ```
    
    #### Writing
    ```
    write.table
    ```
    ```
    write.csv
    ```

* Reading and writing lines of a text file (abc.txt)
    #### Reading
    ```
    readLines
    ```
    
    #### Writing
    ```
    writeLines
    ```

* Reading and writing R code source files 
    #### Reading
    ```
    source 
    ```
    
    #### Writing
    ```
    dump 
    ```
    
* Reading and writing R code source files 
    #### Reading 
    ``` 
    dget
    ```
    
    #### Writing 
    ``` 
    dget
    ```
    
* For reading and writing in saved workspaces 
    #### Reading 
    ```
    load
    ```
    
    #### Writing 
    ```
    save
    ```

* For reading and writing single R objects in binary form 
    
    #### Reading 
    ``` 
    unserialize 
    ```
    
    #### Writing 
    ``` 
    serialize
    ```

## Reading data files with read.table 
#### It has the following arguments 
* file
    
    name of file, or a connection 

* header 

    logical indicating if the file has a header or not 

* sep

    A string indicating how the columns are separated 
    
* colClasses 
    
    A character vector indicating the class of each column in the dataset.
    
    Specifying this parameter speeds up the read process for larger datasets without the program having to parse the data to identify the data type (Column Classes) of each column.
    
* nrows 

    The number of rows in the dataset 
    
* comment.char 

    A character string indicating the comment character 

* skip 

    The number lines to skip from the beginning 
    
* stringAsFactor 
    
    Should character variables be coded as factors? 
    
    By default false 
