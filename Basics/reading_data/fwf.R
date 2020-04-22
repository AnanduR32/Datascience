## Reading fixed width format files 

url = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"

## Setting width of each 9 columns
w = c(12, 7, 4, 9, 4, 9, 4, 9, 4)
data = read.fwf(url,width = w, header = F,skip = 4)
View(data)
df = data.frame(data)
View(df)
sum(df[4])
