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
* ###### file
    
    name of file, or a connection 

* ###### header 

    logical indicating if the file has a header or not, headers are variable names - labels. 

* ###### sep

    A string indicating how the columns are separated. 
    
    eg: CSV files separated by ',' - cammas.
    
    By default the separator is " " - space, for read.csv() function the default separator is ',' - camma. 
    
* ###### colClasses 
    
    A character vector indicating the class of each column in the dataset.
    
    Specifying this parameter speeds up the read process for larger datasets without the program having to parse the data to identify the data type (Column Classes) of each column.
    
    Workaround to identifying and assigning colClass parameter: 
    
    * Read the first n rows of data and identify the classes using "sapply()" function,
    * Store the classes in a variable - 'classes'
    * Pass the colClasss = classes parameter when reading the entire dataset.
    
    ```
    initial = read.table("datatable.txt", nrows = 100)
    classes = sapply(initial, class)
    tabAll  = read.table("datatable.txt", colClasses = classes)
    ```
    
    We can use the unix code 'wc' to calculate the total number of lines in the file
    
* ###### nrows 

    The number of rows in the dataset 
    
* ###### comment.char 

    A character string indicating the comment character 

* ###### skip 

    The number lines to skip from the beginning 
    
* ###### stringAsFactor 
    
    Should character variables be coded as factors? 
    
    By default true 
    
### Calculating memory requirements 

"You need atleast twice the size of memory of the data to be able to load and store the entire data, due to memory overhead requirements".

### Textual formats 

dput and dump stores data in textual format which has advantages such as readability, editability, and the data is stored along with meta data.
    
But there are disadvantages such as inefficient storage requiring compression.

## Reading file formats 

* Excel 
    
    Library : xlsx
    read : read.xlsx(fileURL,sheetIndex=1,header=T)

* XML 
    
    Library : XML
    read : xmlTreeParse(fileURL)
