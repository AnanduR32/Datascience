# Handing/Cleaning character strings 

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
  
  
