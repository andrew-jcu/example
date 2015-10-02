#Title:  R Subsetting
#Author: Andrew Gray-Spence
#Date:   20151002
#Version 0.01

#Creating a vector
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- letters[1:5]

x[1]
x["a"]
x[1:3]
x[c(1,2,3)]
x[c(1,1,1,1)]
x[-1]
x[-2]
x[c(-1,-2)]

#Challenge 2
x[2:4]
x[c(2,3,4)]
x[c("b", "c", "d")]
x[c(-1,-5)]

#subsetting by name
names(x) == "b"

which(names(x) == "b")
x[-which(names(x) == "b")]

#Selecting data
#Find values that are greater then a target value
x[x>7]

#Selecting on multipe criteria 
# |   or conditioin
x[x>7 | x<5]

# &  and operator
# !=  not equals operat
# %in%    is value in list

m <- matrix(rnorm(24), ncol=4, nrow=6)
class(m)

m
m[1]
m[1,]    #Note difference - important!
m[1,1]
m[2,3]
m[,2]
class(m[,2])

as.matrix(m[,2])

m[1,,drop=FALSE]
m[1,]
m[1:2,2:4]


#List subsetting
xlist <- list(a="Software Carpentery", b=1:10, data=head(gapminder$gdpPercap))
xlist
str(xlist)
xlist[1]
xlist$a
xlist[[1]]
xlist[[2]][2]



#Data frame subsetting
names(gapminder)
head(gapminder[3])
head(gapminder[1])
head(gapminder[3], n=1)

head(gapminder$pop)
as.data.frame(head(gapminder$pop))

gd_1957 <- subset(gapminder,year==1957)
dim(gd_1957)
gd_1957_2 <- gapminder[gapminder$year==1957,]

gd_1957
gd_1957_2

dim(gd_1957)
dim(gd_1957_2)
gd_1957


#Three ways to subset data
c_1957_1 <- gapminder[gapminder$year==1957,c(1,2)]
c_1957_2 <- subset(gapminder,year==1957, select=c("country","year"))
c_1957_3 <- subset(gapminder[1:2],year==1957)

dim(c_1957_1)
dim(c_1957_2)
dim(c_1957_3)

