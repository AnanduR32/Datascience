# Check mtcars is dataframe
is.data.frame(mtcars)

# Convert matrix to dataframe
mat = matrix(1:25,nrow = 5)
data.frame(mat)

# Using mtcars as df
df = mtcars 

# Display first 6 rows of df
head(df,6)

# Average mpg for all cars 
mean(df[,1])

# Select rows where cyl = 6
df[df$cyl==6,]

# Selecting specific columns
df[,9:11]

# creating column performance = hp/wt
Performance=df$hp/df$wt
df$Performance = Performance

# Using round() to reduce precision of Performance column
df$Performance = round(df$Performance,2)

# Average mpg for cars having hp>100 and wt>2.5
mean(df[df$hp>100 & df$wt>2.5,]$mpg)
# Also works
mean(subset(df,hp>100 & wt>2.5)$mpg)

# mpg of Hornet Sportabout
df['Hornet Sportabout',]$mpg

