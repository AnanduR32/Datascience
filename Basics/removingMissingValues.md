### Removing NA values 

We have a dataset with missing values

```
x = c(1, NA, 2, NA, 3, NA, 4, NA, 5)
```
We parse the dataset and create a boolean variable that indexes the position of missing values as true

```
bad = is.na(x)
```
We use the boolean variable, inverse the values, and displays all values which are not missing.

```
x[!bad]
```

Output

```
[1,] 1 2 3 4 5
```

#### Using complete.cases()

Creates a logical vector which tells us which rows are complete ie. no one column in the entire row has a missing value

eg: 

```
good = complete.cases(airquality)
```

We obtain the indices of rows that have complete data and store it in variable "good" as TRUE indices. Then we subset the original dataset by passing the variable.

```
airquality[good,]
```
