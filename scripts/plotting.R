
#Title:  R Plotting
#Author: Andrew Gray-Spence
#Date:   20151002
#Version 0.01




install.packages("ggplot2")
installed.packages()

library(ggplot2)

exploring_dataframe <- function(df){
  #Check dimesions as a first step, normally a good idea
  print("Rows     Columns")
  print(dim(df))
  print(names(df))
  print(str(df))
#  print(summary(df))
}

exploring_dataframe(gapminder)



#Quick example of ggplot2
# ggplot is a subset of ggplot2

#Basics
ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap)) + geom_point()

#Added colour
ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap,color=continent)) + geom_point()

#And added a title
ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap,color=continent)) + geom_point() + 
  ggtitle("Life expectancy vs GDP per capita")

#example("ggplot")
ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap,color=continent)) + geom_point()+ 
  ggtitle("Life expectancy vs GDP per capita") 
ggsave(file="plots/lifeGDP.png")

pdf(file="liftexp2.pdf")
ggplot(data=gapminder, aes(x=lifeExp, y=gdpPercap,color=continent)) + geom_point() + ggtitle("Life expectancy vs GDP per capita") 
dev.off()



png(file="plots/liftexp4a.png")

ggplot(data=gapminder, aes(x=year, y=lifeExp,color=country)) + 
  geom_point(aes(color=continent)) + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  facet_grid( .~continent)

dev.off()





png(file="plots/liftexp4b.png")

ggplot(data=gapminder, aes(x=year, y=lifeExp,color=country)) + 
  geom_point(aes(color=continent)) + 
  theme(axis.text.x = element_text(angle = 270, hjust = 1)) +
  facet_grid( .~continent)

dev.off()
