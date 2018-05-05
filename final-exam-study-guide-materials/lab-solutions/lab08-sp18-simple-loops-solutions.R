# Title: "Lab 8: simple loops"
# Subtitle: "Stat 133, Spring 2018"
# Author: "Gaston Sanchez"


# Summation Series of 1/2
n <- 10
series <- 0

for (k in 0:n) {
  term <- 1 / (2^k)
  print(term)
  series[k+1] <- term
}
sum(series)


# Summation Series of 1/9
n <- 10
series <- 0

for (k in 0:n) {
  term <- 1 / (9^k)
  print(term)
  series[k+1] <- term
}
sum(series)


# Arithmetic Series
a1 <- 3
d <- 3
num <- 10
series <- rep(0, num)

for (n in 1:num) {
  an = a1 + (n-1)*d
  series[n] <- an
  print(an)
}


# Geometric Sequence
a1 <- 3
r <- 2
summ <- 0

for (n in 1:10) {
  an = a1 * r^(n-1)
  summ = summ + an
  print(an)
}


# Sine Approximation
x <- 1
n <- 5
sign <- 1
pow <- 1
sin_sum <- 0

for (k in 1:n) {
  term <- sign * (x^pow) / factorial(pow) 
  pow <- k + 2
  sign <- -1 * sign
  sin_sum <- sin_sum + term
  print(sin_sum)
}


# for loop with a matrix
set.seed(123)
X <- matrix(rnorm(12), nrow = 4, ncol = 3)

Y <- X
for (i in 1:nrow(X)) {
  for (j in 1:ncol(X)) {
    if (X[i,j] < 0) {
      Y[i,j] <- X[i,j]^2
    } else {
      Y[i,j] <- sqrt(X[i,j])
    }
  }
}
Y


# reduce function
reduce <- function(x) {
  while(x %% 2 == 0) {
    x <- x / 2
  }
  return(x)
}
reduce(898128000)


# average with for loop
x <- 1:100

sum_entries <- 0
for (i in 1:length(x)) {
  sum_entries <- sum_entries + x[i]
}
avg <- sum_entries /length(x)
avg


# average with while loop
x <- 1:100

sum_entries <- 0
i <- 1
while (i <= length(x)) {
  sum_entries <- sum_entries + x[i]
  i <- i + 1
}
avg <- sum_entries /length(x)
avg


# average with repeat loop
x <- 1:100

sum_entries <- 0
i <- 1
repeat {
  sum_entries <- sum_entries + x[i]
  i <- i + 1
  if (i > length(x)) break
}
avg <- sum_entries /length(x)
avg


# standard deviation
x <- 1:100

deviations <- 0
for (i in 1:length(x)) {
  deviations <- deviations + (x[i] - avg)^2
}
sqrt(deviations / (length(x) - 1))

# compare with
sd(x)


# geometric mean
x <- 1:50
product <- 1

for (i in 1:length(x)) {
  product <- product * x[i]
}
(product)^(1/length(x))
