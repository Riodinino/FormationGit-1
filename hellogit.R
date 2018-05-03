cat("Helloworld")


# Issues with doubles

.1 == .3 / 3 #Isn't true

seq(0, 1, by=.1) == .3 # Has no case where true

unique(c(.3, .4 - .1, .5 - .2, .6 - .3, .7 - .4)) # is of length 3

#Example with the quadratic formula : find the solution of aX²+bX+c = 0, c(a,b,c) being real^3

quadratic_formula <- function (a, b, c)
{
  rad <- b^2 - 4 * a * c
  if(is.complex(rad) || all(rad >= 0)) {
    rad <- sqrt(rad)
  } else {
    rad <- sqrt(as.complex(rad))
  }
  cbind(-b - rad, -b + rad) / (2 * a)
}




quadratic_formula(1, -5, 6) - c(2, 3)

# The result of the equation is supposed to be this in real life

quadratic_formula(1, -5, 6)

#And the result is exactly c(2,3) 
identical(quadratic_formula(1, -5, 6), matrix(c(2,3),nrow = 1, ncol = 2, byrow = T))

# And supposedly stays unchanged if you divide every argument by a scalar

quadratic_formula(1/3, -5/3, 6/3)

# But R does some rounding while calculating.
print(quadratic_formula(1/3, -5/3, 6/3), digits=16)

#Which is not just due to a difference of type: c(2,3) is a double as well

identical(matrix(c(2,3),nrow = 1, ncol = 2, byrow = T),quadratic_formula(1/3, -5/3, 6/3))



