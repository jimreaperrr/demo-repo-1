# Title: "Lab 1: Basics of R"
# Subtitle: "Stat 133, Fall 2017"
# Author: "Gaston Sanchez"


# monthly bills of Leia (a stats undergrad student): 
#  cell phone $80, transportation $20, groceries $527, gym $10, 
# rent $1500, other $83.

# total expenses
80 + 20 + 527 + 10 + 1500 + 83

# assignment operator "arrow"
phone <- 80


# Make more assignments to create variables `transportation`, `groceries`, `gym`, 
# `rent`, and `other` with their corresponding amounts:
transportation <- 20
groceries <- 527
gym <- 10
rent <- 1500
other <- 83

# create a `total` object with the sum of the expenses:
total <- phone + transportation + groceries + gym + rent + other
total

# semester expenses (assume the semester involves five months)
total * 5

# year expenses (10 months)
total * 10

# your vector expenses (with named elements)
expenses <- c(phone, transportation, groceries, gym, rent, other)
names(expenses) <- c('phone', 'transportation', 'groceries', 'gym', 'rent', 'other')

# barchart
barplot(expenses)

# better barchart
barplot(sort(expenses, decreasing = TRUE))


# Pythagoras formula
# Calculate the hypotenuse of a right triangle with legs of length 3 and 4.
a <- 3
b <- 4
hyp <- sqrt(a^2 + b^2)


#  Binomial probability 
n <- 5    # trials
k <- 2    # successes
p <- 0.5  # probability

# n choose k
factorial(n) / (factorial(n-k) * factorial(k))

# probability of getting exactly 2 heads out of 5 tosses
(factorial(n) / (factorial(n-k) * factorial(k))) * p^k * (1-p)^(n-k)

# probability of getting exactly 2 heads out of 5 tosses
choose(n, k) * p^k * (1-p)^(n-k)

# Consider rolling a fair die 10 times. What is the probability 
# of getting exactly 3 sixes?
choose(10, 3) * (1/6)^3 * (5/6)^(10-3)

# here's another option
times <- 10
sixes <- 3
p_six <- 1/6
choose(times, sixes) * (p_six)^sixes * (1 - p_six)^(times - sixes)

# probability of 2 heads in 5 coin tosses, using dbinom()
dbinom(x = 2, size = 5, prob = 1/2)

# probability of 3 sixes in 3 rolls of a die, using dbinom()
dbinom(x = 3, size = 3, prob = 1/6)

# probability of 2 heads in 5 coin tosses, when prob = 0.35
dbinom(x = 2, size = 5, prob = 0.35)

# probability of getting more than 3 heads in 5 tosses
# with a biased coin of 35% chance of heads
heads4 <- dbinom(x = 4, size = 5, prob = 0.35)
heads5 <- dbinom(x = 5, size = 5, prob = 0.35)
heads4 + heads5

# or equivalently
sum(dbinom(x = 4:5, size = 5, prob = 0.35))


# - Install packages "stringr", "RColorBrewer", and "XML"
install.packages(c("stringer", "RColorBrewer", "XML"))

# Calculate: $3x^2 + 4x + 8$ when $x = 2$
x <- 2
(3 * x^2) + (4 * x) + 8

# Calculate: $3x^2 + 4x + 8$ but now with a numeric sequence for $x$ 
# using `x <- -3:3`
x <- -3:3
(3 * x^2) + (4 * x) + 8

# Find out how to look for information about math binary operators
# like `+` or `^` (without using `?Arithmetic`).
help("+")
?"^"
