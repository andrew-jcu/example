#!/usr/bin/env Rscript
#Title:  R Plotting
#Author: Andrew Gray-Spence
#Date:   20151002
#Version 0.02

#call the package ggplot2 - should check to see if its installed and kick of install if
#required (be careful of that last!)

library(ggplot2)
load("../data/gapminder.RData")
draw_dots_cont <- function(df){
  #Polot the continent smultifgure
  p <- ggplot(data=df, aes(x=year, y=lifeExp,color=country)) + 
        geom_point(aes(color=continent)) + 
        theme(axis.text.x = element_text(angle = 270, hjust = 1)) +
        facet_grid( .~continent)
  print(p)
}

#create a function to create a png plot
make_pngplot <- function(name){
  png(file=paste(name,".png",sep=""))
  draw_dots_cont(gapminder)
  dev.off()
}

make_pdfplot <- function(name){
  pdf(file=paste(name,".pdf",sep=""))
  draw_dots_cont(gapminder)
  dev.off()
}

arg <- commandArgs(TRUE)
try(make_pngplot(arg[1]))

print(arg)
