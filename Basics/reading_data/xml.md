# XML file format 
  
    Library : XML
    
    read : xmlTreeParse(fileURL)
    
    Accessing root node element : 
    
        rootNode = rootXML(readDocFile)
    
    Acessing individual elements : 
        
        xmlNames(rootNode)  # To see name of root node
        rootNode[[1]]       # To access first element in the root node
        rootNode[[1]][[1]]  # To access the first element within the first element of root node,
                            # Subset progressively to access the lower levels of the xml markdown