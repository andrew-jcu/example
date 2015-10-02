#Title:  R functions
#Author: Andrew Gray-Spence
#Date:   20151002
#Version 0.01

#Making a function is add_one, received a input(numerical) and outputs
#a number plus one

add_one <- function(input){
  if(is.numeric(input))
  {
    #Body
    result <- input + 1
    return(result)
    #return is optional
  }else{
    return("Invalid data")
  }
}

add_one(1)
add_one
add_one(add_one(add_one(1)))
add_one(add_one(add_one(0)))
add_one(1:4)
add_one(c(1,4))
add_one("A")
