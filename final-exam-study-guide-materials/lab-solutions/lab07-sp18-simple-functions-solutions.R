# Title: "Lab 7: simple functions and conditionals"
# Subtitle: "Stat 133, Fall 2017"
# Author: "Gaston Sanchez"


# function f()
f <- function(x) {
  x^2
}


# function g()
g <- function(x) {
  2 * x + 5
}


# function fog()
fog <- function(x) {
  f(g(x))
}


# function gof()
gof <- function(x) {
  g(f(x))
}


# pythagoras ver1
pythagoras <- function(a, b) {
  sqrt(a^2 + b^2)
}


# pythagoras ver2
pythagoras <- function(a, b = a) {
  sqrt(a^2 + b^2)
}


# area of circle
circle_area <- function(radius = 1) {
  pi * radius^2
}


# area of circle with stop() message
circle_area <- function(radius = 1) {
  if (radius < 0) {
    stop('radius cannot be negative')
  }
  pi * radius^2
}


# area of cylinder
cylinder_area <- function(radius = 1, height = 1) {
  if (height < 0) {
    stop('height must be positive')
  }
  lateral_area <- 2 * pi * radius * height
  base_areas <- 2 * circle_area(radius)
  lateral_area + base_areas
}

cylinder_area()   # default (radius 1, height 1)
cylinder_area(radius = 2, height = 3)  # radius 2, height 3

cylinder_area(radius = -2, height = 1)  # bad radius
cylinder_area(radius = 2, height = -1)  # bad height
cylinder_area(radius = -2, height = -1)  # bad radius and height


# volume of cylinder
cylinder_volume <- function(radius = 1, height = 1) {
  circle_area(radius) * height
}

cylinder_volume()

cylinder_volume(radius = 3, height = 10)
cylinder_volume(height = 10, radius = 3)



# miles to kilometers
miles2kms <- function(mi = 1) {
  1.6 * mi
}


# gallons to liters
gallons2liters <- function(gal = 1) {
  3.78541 * gal
}


# liters to gallons
liters2gallons <- function(lit = 1) {
  1 / gallons2liters(lit)
}


# seconds to years
seconds2years <- function(sec = 1) {
  sec / (365 * 24 * 60 * 60)
}


# gaussian
gaussian <- function(x = 1, m = 0, s = 1) {
  constant <- 1/(s * sqrt(2*pi))
  constant * exp(-1/2 * ((x - m) /s)^2)
}


# polynomials
poly_a <- x^3
poly_b <- (x^2 - 1) * (x + 3)^3
poly_c <- (x^2 - 1) * (x^2 - 9)


# descriptive statistics function
descriptive <- function(x, na.rm = FALSE) {
  c(
    "min" = min(x, na.rm = na.rm),
    "q1" = quantile(x, probs = 0.25, na.rm = na.rm),
    "median" = median(x, na.rm = na.rm),
    "mean" = mean(x, na.rm = na.rm),
    "q3" = quantile(x, probs = 0.75, na.rm = na.rm),
    "max" = max(x, na.rm = na.rm),
    "range" = max(x, na.rm = na.rm) - min(x, na.rm = na.rm),
    "iqr" = IQR(x, na.rm = na.rm),
    "sd" = sd(x, na.rm = na.rm)
  )
}


# number of combinations
combinations <- function(n, k) {
  factorial(n) / (factorial(k) * factorial(n-k))
}

combinations(n = 5, k = 2)
choose(n = 5, k = 2)


# binomial probability
binom_prob <- function(n, k, prob) {
  combinations(n = n, k = k) * (prob^k) * (1 - prob)^(n-k)
}

binom_prob(n = 5, k = 2, prob = 0.5)



# is_even()
is_even <- function(x) {
  if (is.numeric(x)) {
    return(x %% 2 == 0)
  } else {
    return(NA)
  }
}


# is_odd()
is_odd <- function(x) {
  !is_even(x)
}



# grade()
grade <- function(score) {
  if (score >= 90) {
    return("A")
  } else if (score >= 80 & score < 90) {
    return("B")
  } else if (score >= 70 & score < 80) {
    return("C")
  } else if (score >= 60 & score < 70) {
    return("D")
  } else {
    return("F")
  }
}


# grade() with `stop()` condition
grade <- function(score) {
  if (grade < 0 | grade > 100) {
    stop("score must be a number between 0 and 100")
  }
  if (score >= 90) {
    return("A")
  } else if (score >= 80 & score < 90) {
    return("B")
  } else if (score >= 70 & score < 80) {
    return("C")
  } else if (score >= 60 & score < 70) {
    return("D")
  } else {
    return("F")
  }
}



# converting miles
miles2inches <- function(x = 1) {
  x * 63360
}

miles2feet <- function(x = 1) {
  x * 5280
}

miles2yards <- function(x = 1) {
  x * 1760
}

miles2meters <- function(x = 1) {
  x / 0.00062137
}

miles2kms <- function(x = 1) {
  x / 0.62137
}


# convert()
convert <- function(x, to = "km") {
  switch(to,
         "in" = miles2inches(x),
         "ft" = miles2feet(x),
         "yd" = miles2yards(x),
         "m" = miles2meters(x),
         "km" = miles2kms(x))
}


