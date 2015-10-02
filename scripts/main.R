#Title:  R basics
#Author: Andrew Gray-Spence
#Date:   20151001
#Version 0.01
"Hello World"

#Get working directory
a<-getwd()

#Set working directory
setwd(a)

citation()

sqrt((5+2-2*5/5)^2)
log(5)
sqrt(5)
help(sqrt)

#Assigns a number sequence form 1 to 5 inclusive to num
num<-1:5
num

#Raises each value in the sequence by 2
num<-num^2
num

num2 <- num
#List variables in use
ls()
#Frees the memory
rm("num")
num <- num2
rm("num2")
num

pop <-10000000
gdpPercap <- 780.4
gdp <- pop*gdpPercap
print(gdp)

#Shows the help text for ls
help(ls)
#does the same thing
?ls

#Finds similiar functions
apropos("mean")

#Get mean of vector
mean(num)

#Show arguments of a function
args(name=mean)

help(paste)
help(c)
help("c")
help(save)


#OBjects
# Logicals = T/F
# Integer = 1, 2, 1200
# Double = 1.0, 2.0, 1.200
# Complex = 
# Text = Character

i <- 1
typeof(i)
is.numeric(i)

i <- as.integer(i)
typeof(i)
is.numeric(i)

j<- 1
i==j
j<-"i"
i==j


istrue <- i != j

pet <- "Month"
is.character(pet)


#Nuke everything
rm(list=ls())


x <- vector()
x
x<- vector(length=10)
x
x <- vector(length=10, mode="integer")
x
x <-vector("integer", length=10) #Same thing as above
x
x <-vector("character", length=5)

series1 <- 1:10
series1
series2 <- seq(10)
series2
series3 <- seq(from=1, to=100, by=2)
series3

series4 <- c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun")
class(series4)
typeof(series4)
is.character(series4)
is.numeric(series4)
is.vector(series4)

#Appending objects to a vector hat are not of the type of the vecotr
length(series4)
series4<-append(series4, TRUE)
length(series4)
#Whatever gets appended gets coerced to the target type


#Series
s1 <- sample(1:10, 10)
s1
s2 <- sample(1:10, 10, replace=TRUE)
s2


#factors
brothers <- factor(c("yes", "yes", "yes", "yes", "no", "no"))
brothers
is.factor(brothers)
?str
str(brothers)
summary(brothers)
levels(brothers)
unique(brothers)
length(unique(brothers))


#Challenge 6
s3 <- as.integer(s2)
typeof(s3)

s4 <- c(1, 2, 3, 4)
s4 <- c(33, 30,27, 25)
names(s4) <-c("Andrew", "James", "Richard", "John")

help(names)
names(s4)
vector()
s4["Andrew"]
s4["Richard"]
s4[1]

rm(list=ls())
y <- matrix(1:16, nrow=4)
y
y <- matrix(1:16, nrow=4,byrow=TRUE)
y

m <- y

colnames(m) <- LETTERS[1:4]
m
m[1,"A"]
m[3,"D"]


#Saving and loading complicated data 
x <- 1:10
y <- matrix(1:12, nrow=3)
z <- "Andrew"
my.list <- list(x,y,z)
my.list


save(my.list, file="mylist.RData")
rm(list=ls())
load(file="mylist.RData")
rm(list=ls())



#data frames
l1 <- letters[1:3]
l1
num <- 1:30
num
height <-rnorm(30,mean=1.80,sd=0.30)
height
df<-data.frame(id=num, height=height,cat=l1)
df
typeof(df)
class(df)
is.data.frame(df)
str(df)

plot(df)
barplot(df$height)
barplot(df$height,col=df$cat)

dfordered<-df[order(df$cat),]
dfordered
barplot(dfordered$height,col=dfordered$cat)

length(df)
dim(df)
names(df)
nrow(df)
ncol(df)
summary(df)
str(df)
df["id"]["cat"] = "a"

barplot(dfordered$height,col=dfordered$cat, main="Demo boxplot", "ylab"="Height (meters)", xlab="Persons height")

#Add a column to a dataframe (!) - cbind=column bind
df <- cbind(df, 6:1)
df
names(df)
names(df)[4] = "SixOne"
names(df)
df <- cbind(df,capsLetters=LETTERS[1:6])
names(df)
head(df) #First rows only to get a feel for the data
tail(df)
x<-df
x <- rbind(x,  list(33, 1.960033, "a", 2, "A"))
str(x)
summary(x)
length(x)

setwd(paste(getwd(),"/data", sep=""))
getwd()

gapminder <- read.csv("gapminder-FiveYearData.csv")
save(gapminder,file="gapminder.RData")



rm(list=ls())
load("gapminder.RData")
getwd()
#subset by function using column comparison
Aus <-subset(gapminder,country=="Australia")
Aus

Aus2 <- gapminder[61:72,] #note comma
Aus2

identical(Aus, Aus2)

Aus_pop <-gapminder[61:72,3]
Aus_pop2 <- subset(gapminder,country=="Australia", select="pop")

Aus_pop
Aus_pop2

identical(Aus, Aus2)
typeof(Aus)
typeof(Aus2)
class(Aus)
class(Aus2)

hist(gapminder$lifeExp)

boxplot(pop ~ year, data=gapminder)

boxplot(pop ~ year, data=gapminder,main="Population growth",
        xlab="Year", ylab="Population")

boxplot(lifeExp ~ year, data=gapminder, main="lifeExp",        xlab="Years", ylab="Population")
