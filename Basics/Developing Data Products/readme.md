## R packaging 

### Files:
- **R file**  
Contains the main code organised based on functionality.  

- **Description file**  
contains 
  - Package name  
  - Title   
  - Version  
  - Author(s)  
  - Maintainer  
  - License
  - Depends: dependencies
  - Suggests  
  - Date  
  - URL  
  - Other  

- **NAMESPACE file**  
It is used to indicate which of the functions will be available to users to 
export and which they're not allowed to, which abstracts the background details.   

The file is defined using the following methods:  
  - export("function"): which function can be exported  
  - importFrom("package", "function"): imports a particular function into the 
  package from another.  
  - import("package"): Imports a package into the namespace of the current package.
  - exportClasses("class"):   
  - exportMethods("generic"): 

- **Documentation**:
Required to write documentation for every exported function, document package 
overview and concepts.  

- **Help**:  
contains the following lines:  
  - \name{"name"}: name of the help file  
  - \alias{"alias"}: *?"alias"* opens the help page, there can be multiple 
aliases  
  - \title{"title"}: descriptive  
  - \description{"description"}: Explaining the concept of the method or generic.  
  - \usage{"usage"}: Method with default parameters.  
  - \arguments{  
    \item{"item(s)"}{"Description on the items specified"} There can be multiple 
    item-description pairs.  
  }  
  - \details{"details"}  
  - \value{"value returned"}: the value type returned by the function.  
  - \references{"list of references"}  
  
### Building and checking packages    
R CMD build: system("R CMD build <packagename>"): builds the package  
R CMD check: system("R CMD check <packagename>"): checks documents, if code can
be loaded into environment, errors. It runs the examples if available. Must pass
all checks without any errors or warnings to be published on CRAN-r repository.  

The package.skeleton() creates the template directory based on the package name
passed as parameter, which contains all the required files/folders to be filled 
in by user.  


### Swirl  
Use package `swirlify` to create swirl courses with various lessons.  
The `wq_...` series commands can be used to create question templates in the 
yaml file generated using the `new_lesson()` function







