# Title: "Lab 11: random simulations"
# Subtitle: "Stat 133, Spring 2018"
# Author: "Gaston Sanchez"


# Suggested Solution

library(ggplot2)

# boxes as character vectors 
box1 <- c('blue', 'blue', 'red')
box2 <- c('blue', 'blue', 'red', 'red', 'red', 'white')
  
# sample size
size <- 4

# number of repetitions
repetitions <- 1000

# matrix to store sample results
drawn_balls <- matrix("", repetitions, size)

for (r in 1:repetitions) {
  aux <- runif(1)
  if (aux > 0.5) {
    drawn_balls[r, ] <- sample(box1, size, replace = TRUE)
  } else {
    drawn_balls[r,] <- sample(box2, size)
  }
}

# number of blue balls in each repetition
blue_counts <- apply(drawn_balls, 1, function(x) sum(x == 'blue'))

# relative frequencies
table(blue_counts) / repetitions


# progression of relative frequencies
blue_freqs <- vector(mode = "list", length = 5)
for (num_blue in 0:4) {
  blue_freqs[[num_blue + 1]] <- cumsum(blue_counts == num_blue) / (1:repetitions)
}

dat <- data.frame(
  reps = rep(1:repetitions, 5),
  freqs = unlist(blue_freqs),
  number = factor(rep(0:4, each = repetitions))
)

ggplot(data = dat, aes(x = reps, y = freqs, group = number)) +
  geom_path(aes(color = number)) +
  ggtitle("Relative frequencies of number of blue balls")

