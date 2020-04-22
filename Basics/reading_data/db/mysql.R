## Installing MySQL package

install.packages('RMySQL')
library(RMySQL)

## --------------------Connecting to Baltimore genomics database ------------------------##

ucscDb = dbConnect(MySQL(),user = 'genome', host = 'genome-mysql.cse.ucsc.edu')
result = dbGetQuery(ucscDb,"Show Databases;")
dbDisconnect(ucscDb)

## View content of 'Show Databases;' query run on the mysql server
## at genome-mysql.cse.ucsc.edu

View(result)

## ----------------------- Exploring the hg19 database ----------------------------------##
hg19 = dbConnect(MySQL(),user = 'genome',db = 'hg19', host = 'genome-mysql.cse.ucsc.edu')

## List the tables in the database
allTables = dbListTables(hg19)

length(allTables)
allTables[1:15]

## ------------------ Listing the field names of a particular database ------------------##
## table 23 - agilentCgh2x105k
View(allTables[23])

dbListFields(hg19,allTables[23])
dbGetQuery(hg19,"select count(*) from agilentCgh2x105k")

## ------------------------ To read the table as a dataframe ----------------------------##
agileData = dbReadTable(hg19,"agilentCgh2x105k")
View(agileData)
nrow(agileData)

## ------------------ Selecting a subset from the remote database ---------------------- ##

## Check unique values in the chrom field
unique(agileData$chrom)

## Creating subset remotely
query = dbSendQuery(hg19,"Select * from agilentCgh2x105k where chrom = \"chr1\"")
## fetching result of query run on remote database
agilechr1 = fetch(query)

## Checking if subset make correctly
unique(agilechr1$chrom)

## We can also fetch a portion of the result of query by specifying the number of records
## to be returned by specifying the 'n' parameter within the fetch() function
dim(fetch(query,n=10))

## To clear the result of previously run query
dbClearResult(query)


## ----------------------------- Closing connection -------------------------------------##
dbDisconnect(hg19)
