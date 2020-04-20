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
    
### Calculating memory requirements 

"You need atleast twice the size of memory of the data to be able to load and store the entire data, due to memory overhead requirements".

### Textual formats 

dput and dump stores data in textual format which has advantages such as readability, editability, and the data is stored along with meta data.
    
But there are disadvantages such as inefficient storage requiring compression.
