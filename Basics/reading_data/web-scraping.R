## Web scraping 

## readLines()
con = url("http://www.w3schools.com/xml/simple.xml")
htmlcode = readLines(con)
close(con)
htmlcode

## Using XML package 
library(XML)
url1 = "http://www.w3schools.com/xml/simple.xml"
html = htmlParse(sub("s","",url1), useInternalNodes = T)
xpathSApply(html,"//title",xmlValue)

## Using GET command
library(httr)
url2 = "http://www.w3schools.com/"
html2 = GET(url2) # pass parameter 'authenticate("username","password") 
# for locked website error: 401
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText = T)
xpathSApply(parsedHtml,"//title",xmlValue)

