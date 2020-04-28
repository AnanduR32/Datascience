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
  
  
  
