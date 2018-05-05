# Title: "Lab 09: Testing functions, and string basics"
# Subtitle: "Stat 133, Spring 2018"
# Author: "Gaston Sanchez"

# load testthat
library(testthat)


# ================================================
# Functions (to be included in file 'functions.R')
# ================================================

#' @title Range
#' @description Computes overall range: max - min
#' @param x numeric vector
#' @return computed range
stat_range <- function(x) {
  max(x) - min(x)
}


#' @title Center measures
#' @description Computes measures of center: mean and median
#' @param x numeric vector
#' @return vector with mean and median
stat_centers <- function(x) {
  c('mean' = mean(x), 'median' = median(x))
}


#' @title Spread measures
#' @description Computes measures of spread: range, IQR, and SD
#' @param x numeric vector
#' @return vector with range, iqr, and stdev
stat_spreads <- function(x) {
  c('range' = stat_range(x), 
    'iqr' = IQR(x),
    'stdev' = sd(x))
}


# ================================================
# Tests (to be included in file 'tests.R')
# ================================================

# context with one test that groups expectations
context("Test for range value") 

test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(stat_range(x), 4)
  expect_length(stat_range(x), 1)
  expect_type(stat_range(x), 'double')
})

test_that("range value for numeric vectors with NAs", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(range_value(y), NA_real_)
  expect_length(range_value(y), 1)
})


test_that("range value for logical vectors", {
  z <- c(TRUE, FALSE, TRUE)
  
  expect_equal(range_value(z), 1L)
  expect_length(range_value(z), 1)
  expect_type(range_value(z), 'integer')
})


test_that("range value stops for character vectors", {
  w <- letters[1:5]
  
  expect_error(range_value(w))
})




# -----------------------------------------------------------------------------

# ===============================================
# Number of characters and casefolding
# ===============================================

# number of characters
nchar(states)

# to lower case
tolower(states)

# to upper case
toupper(states)

# case folding (upper = TRUE)
casefold(states, upper = TRUE)

# case folding (upper = FALSE)
casefold(states, upper = FALSE)

# number of characters
num_chars <- nchar(states)

# frequency table
char_freqs <- table(num_chars)

# barchart of number-of-characters
barplot(char_freqs, las = 1, border = NA)


# ===============================================
# Pasting strings
# ===============================================

# paste names with their num-of-chars
paste(states[1:5], num_chars[1:5], sep = ' = ')

# collapse first 5 states
paste(states[1:5], collapse = '')


# ===============================================
# Substrings
# ===============================================

# shorten state names with first 3 characters
substr(states, 1, 3)

# shorten state names with last 3 characters
substr(states, num_chars - 2, num_chars)

# shorten state names with first 3 characters
paste0(substr(states, 1, 1),
       substr(states, num_chars - 2, num_chars))


# ===============================================
# Challenge
# ===============================================

char_freqs <- table(num_chars)
char_classes <- as.numeric(names(char_freqs))
states_list <- vector("list", length(char_classes))

for (i in 1:length(char_freqs)) {
  collapsed <- paste0(states[num_chars == char_classes[i]], collapse = ", ")
  if (char_classes[i] %% 2 == 0) {
    states_list[[i]] <- toupper(collapsed)
  } else {
    states_list[[i]] <- tolower(collapsed)
  }
}

names(states_list) <- paste0(char_classes, "-chars")


# temperature conversion
temp_convert <- function(x = 1, to = "celsius") {
  to <- tolower(to)
  switch(to,
         "celsius" = to_celsius(x),
         "kelvin" = to_kelvin(x),
         "reaumur" = to_reaumur(x),
         "rankine" = to_rankine(x))
}

# test temp_convert()
temp_convert(30, 'celsius')
temp_convert(30, 'CELSIUS')
temp_convert(30, 'Celsius')
temp_convert(30, 'CeLsIus')


# 3 different ways to create vector of file names
paste("file", 1:10, ".csv", sep ="")
paste0("file", 1:10, ".csv")
sprintf("file%s.csv", 1:10)


# renaming vector of 'file' names to 'dataset' names
files <- sprintf("file%s.csv", 1:10)
datasets <- gsub(pattern = "file", replacement = "dataset", files)
datasets


# your is_color() function
is_color <- function(str) {
  any(colors() == str)
}

# another version for is_color()
is_color <- function(str) {
  str %in% colors()
}

# test it:
is_color('yellow')  # TRUE
is_color('blu')     # FALSE
is_color('turkuiose') # FALSE


# function colplot()
colplot <- function(str) {
  if (!is_color(str)) {
    stop(paste('invalid color', str))
  } else {
    x <- rnorm(50)
    y <- rnorm(50)
    plot(x, y, col = str, pch = 19, las = 1)
    title(paste('Testing color', str))
  }
}

colplot('tomato')


# counting vowels
set.seed(1)
letrs <- sample(letters, size = 100, replace = TRUE)
vowels <- c('a', 'e', 'i', 'o', 'u')
table(letrs[letrs %in% vowels])

# counting consonants
consonants <- letters[!(letters %in% vowels)]
table(letrs[letrs %in% consonants])


# counting total letters,vowels and consonants
count_letters <- function(x) {
  # auxiliar vectors
  vowels <- c('a', 'e', 'i', 'o', 'u')
  consonants <- letters[!(letters %in% vowels)]
  # count letters, vowels, and consonants
  print(paste('letters:', sum(nchar(letrs))))
  print(paste('vowels:', sum(letrs %in% vowels)))
  print(paste('consonants:', sum(letrs %in% consonants)))
}

count_letters(letrs)

