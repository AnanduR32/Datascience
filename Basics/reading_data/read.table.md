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