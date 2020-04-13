


x = read.csv("hw1_data.csv")

View(x)
nrows(x)

summary(x)

cond = x[c(x[[1]]>31,x[[4]]>90),]
summary(cond)

good = complete.cases(cond)
cond[[good]]

y = cond[good,]
summary(y)

View(y)
cond2 = x[x[[5]]==6,]
summary(cond2)

cond3 = x[x[[5]]==5,]
summary(cond3)