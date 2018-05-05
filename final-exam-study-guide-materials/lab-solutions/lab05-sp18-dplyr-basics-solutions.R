# Title: "Lab 5: dplyr and ggplot2 basics"
# Subtitle: "Stat 133, Spring 2018"
# Author: "Gaston Sanchez"


# required packages
library(readr)    # for importing data table
library(dplyr)    # for manipulating data frames
library(ggplot2)  # for graphics

# read data file (from working directory)
dat <- read_csv('nba2017-players.csv')

# read data file (e.g. using relative path)
dat <- read_csv('../data/nba2017-players.csv')


# ===============================================
# Verbs: slice(), filter(), and select()
# ===============================================

# use `slice()` to subset the data by selecting the first 5 rows.
slice(dat, 1:5)

# use `slice()` to subset the data by selecting rows 10, 15, 20, ..., 50.
slice(dat, seq(from = 10, to = 50, by = 5))

# use `slice()` to subset the data by selecting the last 5 rows.
slice(dat, (nrow(dat)-4):nrow(dat))

# use `filter()` to subset those players with height less than 70 inches tall.
filter(dat, height < 70)

# use `filter()` to subset rows of Golden State Warriors ('GSW')
filter(dat, team == 'GSW')

# use `filter()` to subset rows of GSW centers ('C')
filter(dat, position == 'C' & team == 'GSW')

# use `filter()` and then `select()`, to subset rows of lakers ('LAL'), 
# and then display their names.
lakers <- filter(dat, team == 'LAL')
select(lakers, player)

select(filter(dat, team == 'LAL'), player) # equivalently

# use `filter()` and then `select()`, to display the name and salary, 
# of GSW point guards
gsw_pg <- filter(dat, team == 'GSW' & position == 'PG')
select(gsw_pg, player, salary)

select(filter(dat, team == 'GSW' & position == 'PG'), player, salary) # equivalently

# find how to select the name, age, and team, of players with more than 10 years 
# of experience, making 10 million dollars or less.
select(
  filter(dat, experience > 10 & salary <= 10000000),
  player, age, team)

# find how to select the name, team, height, and weight, of rookie players, 
# 20 years old, displaying only the first five occurrences (i.e. rows)
slice(
   select(
     filter(dat, experience == 0 & age == 20),
     player, team, height, weight),
   1:3
)


# ===============================================
# Verbs: mutate()
# ===============================================
# creating a small data frame step by step
gsw <- filter(dat, team == 'GSW')
gsw <- select(gsw, player, height, weight)
gsw <- slice(gsw, c(4, 8, 10, 14, 15))

# using the data frame 'gsw', add a new variable 'product' with the product of 
# height and weight
mutate(gsw, product = height * weight)

# create a new data frame 'gsw3', by adding columns 'log_height' and 'log_weight'
# with the log transformations of height and weight
gsw3 <- mutate(gsw, log_height = log(height), log_weight = log(weight))
gsw3

# use the original dat frame to filter() and arrange() those players with 
# height less than 71 inches tall, in increasing order.
arrange(filter(dat, height < 71), height)

# display the name, team, and salary, for the top-5 highest paid players
slice(arrange(select(dat, player, team, salary), desc(salary)), 1:5)

# display the name, team, and points3, of the top 10 three-point players
slice(arrange(select(dat, player, team, points3), desc(points3)), 1:10)

# display the name, position, and minutes, of the top top-3 players
# with most minutes played
slice(arrange(select(dat, player, position, minutes), desc(minutes)), 1:3)

# create a data frame 'gsw_mpg' of GSW players, that contains variables for 
# player name, experience, and 'min_per_game' (minutes per game), 
# sorted by 'min_per_game' (in descending order)
gsw_mpg <- arrange(
  select(
    mutate(filter(dat, team == 'GSW'), min_per_game = minutes / games),
    player, experience, min_per_game),
  desc(min_per_game)
)
gsw_mpg


# ===============================================
# Verbs: mutate()
# ===============================================

# - use `summarise()` to get the largest height value
summarise(dat, max(height))

# - use `summarise()` to get the standard deviation of `points3`
summarise(dat, sd(points3))

# - use `summarise()` and `group_by()` to display the median of three-points,
# by team
summarise(group_by(dat, team), median(points3))

# - display the average triple points by team, in ascending order, of the 
# bottom-5 teams (worst 3pointer teams)
slice(
  arrange(
    summarise(
      group_by(dat, team), 
      avg_pts3 = mean(points3)),
    avg_pts3),
  1:5
)


# - obtain the mean and standard deviation of `age`, for Power Forwards, with 5 
# and 10 years (including) years of experience
summarise(
  select(filter(dat, position == 'PF' & experience %in% 5:10),
         age),
  avg = mean(age),
  sd = sd(age)
)


# ===============================================
# First contact with ggplot()
# ===============================================

# scatterplot (option 1)
ggplot(data = dat) +
  geom_point(aes(x = points, y = salary))

# scatterplot (option 2)
ggplot(data = dat, aes(x = points, y = salary)) +
  geom_point()


# Use the data frame `gsw` to make a scatterplot of `height` and `weight`
ggplot(data = gsw, aes(x = height, y = weight)) +
  geom_point()

# Find out how to make another scatterplot of `height` and `weight`, 
# using `geom_text()` to display the names of the players
ggplot(data = gsw, aes(x = height, y = weight)) +
  geom_point() + 
  geom_text(aes(label = player))

# Get a scatter plot of `height` and `weight`, for ALL the warriors, displaying
# their names with `geom_label()`
ggplot(
  data = filter(dat, team == 'GSW'),
  aes(x = height, y = weight)) + 
  geom_label(aes(label = player))

# Get a density plot of `salary` (for all NBA players)
ggplot(data = dat) + 
  geom_density(aes(x = salary))

# Get a histogram of `points2` with binwidth of 50 (for all NBA players)
ggplot(data = dat) + 
  geom_histogram(aes(x = points2), binwidth = 50)

# Get a barchart of the `position` frequencies (for all NBA players)
ggplot(data = dat) + 
  geom_bar(aes(x = position))

# Make a scatterplot of `experience` and `salary` of all centers, and use 
# geom_smooth() to add a regression line
ggplot(
  data = filter(dat, position == 'C'),
  aes(x = experience, y = salary)) + 
  geom_point() +
  geom_smooth(method = lm)

# Repeat the same scatterplot of `experience` and `salary` of all centers, 
# but now use `geom_smooth()` to add a loess line
ggplot(
  data = filter(dat, position == 'C'),
  aes(x = experience, y = salary)) + 
  geom_point() +
  geom_smooth(method = loess)

# Make scatterplots of `experience` and `salary` faceting by `position`
ggplot(data = dat, aes(x = experience, y = salary)) +
  geom_point(alpha = 0.7) +
  facet_wrap(~ position)

# Make scatterplots of `experience` and `salary` faceting by `team`
ggplot(data = dat, aes(x = experience, y = salary)) +
  geom_point(alpha = 0.7) +
  facet_wrap(~ team)

# Make density plots of `age` faceting by `team`
ggplot(data = dat, aes(x = age)) +
  geom_density(fill = 'gray') +
  facet_wrap(~ team)

# Make scatterplots of `height` and `weight` faceting by `position`
ggplot(data = dat, aes(x = height, y = weight)) +
  geom_point(alpha = 0.7) +
  facet_wrap(~ position)

# Make scatterplots of `height` and `weight`, with a 2-dimensional density, 
# geom_density2d(), faceting by `position`
ggplot(data = dat, aes(x = height, y = weight)) +
  geom_point(alpha = 0.7) +
  geom_density2d() +
  facet_wrap(~ position)

# Make a scatterplot of `experience` and `salary` for the Warriors, 
# but this time add a layer with `theme_bw()` to get a simpler background
ggplot(
  data = filter(dat, team == 'GSW'),
  aes(x = experience, y = salary)) + 
  geom_point() +
  theme_bw()

# Repeat any of the previous plots but now adding a leyer with another 
# theme e.g. `theme_minimal()`, `theme_dark()`, `theme_classic()`
ggplot(
  data = filter(dat, team == 'GSW'),
  aes(x = experience, y = salary)) + 
  geom_point() +
  theme_classic()
