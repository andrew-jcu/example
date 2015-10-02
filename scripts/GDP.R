#Title:  Calculate GDP 
#Author: Andrew Gray-Spence
#Date:   20151002
#Version 0.01

#Making a function is add_one, received a input(numerical) and outputs
#a number plus one

#Calculates the gdp and returns it in new data frame, with country and gdp
calc_gdp <- function(dat, filter_year=NULL){
  if(is.null(filter_year)) {
    return_data <- dat$pop * dat$gdpPercap
    return_data <- cbind(dat, subset(dat,select=c("country")))
  }else{
    target_data <- subset(gapminder,year==filter_year, select=c("pop","gdpPercap","country"))
    return_data <- target_data$pop * target_data$gdpPercap
    return_data <- cbind(return_data,subset(target_data, select=c("country")))
  }
  return(return_data)
}

#Calculates the gdp and returns it in new data frame, with country and gdp
calc_gdp_merge <- function(dat, filter_year=NULL){
  
  if(is.null(filter_year)) {
    gdp <- dat$pop * dat$gdpPercap
    return_data <- cbind(dat, gdp)
  }else{
    target_data <- subset(gapminder, gapminder$year %in% filter_year)
    gdp <- target_data$pop * target_data$gdpPercap
    return_data <- cbind(target_data,gdp)
  }
  return(return_data)
}


result <- calc_gdp_merge(gapminder)
result_1957 <- calc_gdp_merge(gapminder,1957)

dim(result)
dim(result_1957)


result
result_1957
