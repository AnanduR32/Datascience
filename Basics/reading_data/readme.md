# Reading Data

## Excel file format 
    
    Library : xlsx
    
    read : read.xlsx(fileURL,sheetIndex=1,header=T)


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
    
    
## Fixed Width Format Files(fwf)

```
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
```

Setting width of each 9 columns
```
w = c(12, 7, 4, 9, 4, 9, 4, 9, 4)
data = read.fwf(url,width = w, header = F,skip = 4)
View(data)
df = data.frame(data)
View(df)
sum(df[4])
```

## json file format 
  
Library : 

    jsonlite

read : 
    
    fromjson(fileURL)

Accessing elements

    names(jsonData)

Individual elements
  
    jsonData$element

## Web scraping 

### readLines()
con = url("http://www.w3schools.com/xml/simple.xml")
htmlcode = readLines(con)
close(con)
htmlcode

### Using XML package 
library(XML)
url1 = "http://www.w3schools.com/xml/simple.xml"
html = htmlParse(sub("s","",url1), useInternalNodes = T)
xpathSApply(html,"//title",xmlValue)

### Using GET command
library(httr)
url2 = "http://www.w3schools.com/"
html2 = GET(url2) # pass parameter 'authenticate("username","password") 
### for locked website error: 401
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText = T)
xpathSApply(parsedHtml,"//title",xmlValue)


## XML file format 
  
Library : 

    XML

read : 
    
    xmlTreeParse(fileURL)
    
    html : htmlTreeParse(fileURL)

Accessing root node element : 

    rootNode = rootXML(readDocFile)

Acessing individual elements : 

    xmlNames(rootNode)  # To see name of root node
    rootNode[[1]]       # To access first element in the root node
    rootNode[[1]][[1]]  # To access the first element within the first element of root node,
                        # Subset progressively to access the lower levels of the xml markdown
                        
Programmatically accessing components of XML document :

    xmlSApply(rootNode,xmlValue)  # Recursively parses each XML element and returns a string 
                                  # representing the elements

XPATH 

   | XPATH command | Purpose
   | -----------|--------------|
   | /node     | Top level node
   | //node    | Node at any level
   | /node/[@attr-name] | Node with an attribute name |
   | /node/[@attr-name='bob'] | Node with an attribute name, specifically attr-name = 'bob' |
   
Extracting targeted elements from XML document 

    xmlSApply(rootNode,'//name',xmlValue) 
   
   To extract all elements with the tag "name"

## APIs

Reading from Github API 

```
library(httr)
library(jsonlite)
oauth_endpoints("github")
access_test_app = oauth_app("github",key = "29bb4ea5478c3dbc4323", secret = "edc722fc5f17fe2aaa71b7737fff029c6461a637")
github_token <- oauth2.0_token(oauth_endpoints("github"), access_test_app)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
git_json = content(req)
gitDF = fromJSON(toJSON(git_json))
gitDF[gitDF$full_name == 'jtleek/datasharing', "created_at"]
```