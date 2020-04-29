## Date manipulation using lubridate library

Library:
```
lubridate
```

Provides functions that help processing date data swiftly and efficiently 

console:
```
ymd("20140408")
```
Output:
```
"2014-04-08 UTC"
```

Similarly the functions myd,dmy,dym and so on..

ymd_hms for specifying the hours minutes and seconds 

To get the weekday from the date instead of the "weekday()" function we use "wday()" 
```
wday("1jan2013")
```
Output:
```
3

To get actual name specify the parameter "label = T"
```
wday("1jan2013",label = T)
```
Output:
```
Tues
