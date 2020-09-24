## ----------------------------------------- Setting working directory ------------------------------------- ##
## Navigating to project directory 
setwd(setwd_future)
{
  if(!file.exists("Case Studies/Moneyball Project")){
    dir.create("Case Studies/Moneyball Project")
  }
  setwd("Case Studies/Moneyball Project")
  setwd_moneyball_project = getwd()
}

## ---------------------------------------------- Loading the data ----------------------------------------- ##
## Downloading the data 

## Batting.csv
{
  if(!file.exists("Batting.csv")){
    fileURL_batting = "https://raw.githubusercontent.com/RedRock42/MoneyBall-Project_R/master/Batting.csv"
    download.file(fileURL_batting,"Batting.csv")
  }
}
## Salaries.csv
{
  if(!file.exists("Salaries.csv")){
    fileURL_batting = "https://raw.githubusercontent.com/RedRock42/MoneyBall-Project_R/master/Salaries.csv"
    download.file(fileURL_batting,"Salaries.csv")
  }
}

## Reading the data 
## Batting.csv
batting = read.csv("Batting.csv")

## Salaries.csv
salaries = read.csv("Salaries.csv")

## ------------------------------------------ Exploratory analysis ----------------------------------------- ##

head(batting)
summary(batting)
## Checking structure of the data
str(batting)

## Call the head() of first five rows of AB(At Bats) column
head(batting$AB,5)

## Call the head() of the doubles(X2B) column
head(batting$X2B)

## The batting average (BA) is defined by the number of hits divided by at bats.
batting$BA = batting$H/batting$AB

## On-base percentage is calculated using this formula
## OBP = (H + BB + HBP)/(AB + BB + HBP + SF)
## where
##  H = Hits
##  BB = Bases on Balls (Walks)
##  HBP = Hit By Pitch
##  AB = At bat
##  SF = Sacrifice fly
batting$OBP = (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)

## In baseball statistics, slugging percentage (SLG) is 
## a measure of the batting productivity of a hitter.
## To calculate 1B
## 1B = H - 2B - 3B - HR
batting$X1B = batting$H - batting$X2B - batting$X3B - batting$HR
## The formula to calculate SLG is as follows
## SLG = ((1B) + (2 x 2B) + (3 x 3B) + (4 x HR))/AB
batting$SLG = ((batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR))

## Exploring the Salaries.csv dataframe 
head(salaries)
summary(salaries)
## Checking structure of the data
str(salaries)

## Using subset function to assign batting to only 
## contain data from 1985 onwards 
batting = subset(batting, yearID>=1985)
summary(batting)
str(batting)

## Merging the batting data with salaries data 
## Using merge function using both playerID and yearID
combo = merge(batting, salaries, by = c("playerID","yearID"))
summary(combo)
str(combo)

## ----------------------------------- Analyzing the lost players ---------------------------------------- ##

## The players that were lost : first baseman 2000 AL MVP Jason Giambi(giambja01) 
## to the New York Yankees, outfielder Johnny Damon(damonjo01) to the Boston Red Sox
## and infielder Rainer Gustavo "Ray" Olmedo(saenzol01).
lost_players = subset(combo, playerID %in% c("giambja01","damonjo01","saenzol01"))
str(lost_players)
summary(lost_players)
View(lost_players)

## Using subset to only grab rows where the yearID is 2001
lost_players = subset(lost_players, yearID == 2001)

## Reducing the lost_players dataframe to contain only columns:
## playerID, H, X2b, X3B, HR, OBP, SLG, BA, AB
lost_players = select(lost_players, playerID, H, X2B, X3B, HR, OBP, SLG, BA, AB)
View(lost_players)

## ------------------------------------- Replacement Players -------------------------------------------- ## 
replacement = filter(combo, yearID == 2001)

## Analyzing the data of players - OBP against Salary
plotOBP = ggplot(
  replacement, aes(
    x = OBP, y = salary
  )
) + geom_point()
plotOBP
## removing players that have 0 OBP and limiting the salary to under 8000000
replacement = filter(combo, salary<8000000,OBP>0.0)

## Checking the average and overall AB of lost players 
mean(lost_players$AB)
# mean = 490
sum(lost_players$AB)
# sum = 1500
summary(lost_players$AB)
# min = 305, max = 644
## The min AB of replacement player must be such that their overall AB must
## be higher than the previous 1500, hence the individual AB must be higher 
## than 500(1500/3)

replacement = filter(replacement, AB>500)

## Sort list by OBP to obtain the best players for replacement
replacement = arrange(replacement, desc(OBP))

## Viewing the results 
View(replacement)
