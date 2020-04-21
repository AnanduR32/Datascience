# XML file format 
  
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
