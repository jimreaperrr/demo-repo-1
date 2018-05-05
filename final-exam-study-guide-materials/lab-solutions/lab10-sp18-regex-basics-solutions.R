# Title: "Lab 10: Basics of regular expressions"
# Subtitle: "Stat 133, Spring 2018"
# Author: "Gaston Sanchez"

# ================================================
# FYI
# ================================================
# you may need to install the development versions of
# "ggmap" and "ggplot2" to avoid some bugs
devtools::install_github("dkahle/ggmap")
devtools::install_github("hadley/ggplot2")

# Packages
library(dplyr)
library(stringr)
library(plotly)
library(RgoogleMaps)
library(ggmap)

# https://github.com/dkahle/ggmap


# ================================================
# Mobile Food SF Data
# ================================================
# reading data from my working directory
# (you may need to change this)
dat <- read.csv('../data/mobile-food-sf.csv', stringsAsFactors = FALSE)


# ================================================
# Day of the week bar-chart
# ================================================

day_counts <- dat %>% 
  select(DayOfWeekStr) %>%
  group_by(DayOfWeekStr) %>%
  summarise(count = n()) %>%
  arrange(desc(count))

plot_ly(day_counts, x = ~DayOfWeekStr, y = ~count,
        type = 'bar')

plot_ly(day_counts, x = ~reorder(DayOfWeekStr, count), y = ~count,
        type = 'bar')



# ================================================
# Changing times
# ================================================
# toy string
time1 <- '10AM'

# hour
str_sub(time1, start = 1, end = 2)

# period
str_sub(time1, start = 3, end = 4)

# more time values
times <- c('12PM', '10AM', '9AM', '4PM', '1PM')

# subset time
str_sub(times, -4, -3)

# subset period
str_sub(times, start = -2)

# "remove" the characters 'AM' or 'PM'
str_replace(times, pattern = 'AM|PM', replacement = '')

# create vectors 'hours' and 'periods'
hours <- as.numeric(str_replace(times, pattern = 'AM|PM', replacement = ''))
periods <- str_sub(times, start = -2)

# vector start24
start24 <- hours
which_pm <- periods == 'PM' & hours != 12
start24[which_pm] <- hours[which_pm] + 12


# ================================================
# Adding columns 'start', 'end', and 'duration'
# to data frame 'dat'
# ================================================

start_hours <- as.numeric(str_replace(dat$starttime, pattern = 'AM|PM', replacement = ''))
start_periods <- str_sub(dat$starttime, start = -2)

start_table <- table(start_periods) / length(start_periods)


start_df <- data.frame(
  x = start_hours,
  y = start_periods
)

p <- plot_ly(data = start_df, x = ~x, y = ~y,
  type = "bar"
)
p


p <- plot_ly(
  x = names(start_table),
  y = start_table,
  #name = "Periods",
  type = "bar"
)
p

end_hours <- as.numeric(str_replace(dat$endtime, pattern = 'AM|PM', replacement = ''))
end_periods <- str_sub(dat$endtime, start = -2)

# add column start
which_start_pm <- start_periods == 'PM' & start_hours != 12
sh <- start_hours
sh[which_start_pm] <- start_hours[which_start_pm] + 12
dat$start <- sh

# add column end
which_end_pm <- end_periods == 'PM' & end_hours != 12
eh <- end_hours
eh[which_end_pm] <- end_hours[which_end_pm] + 12
dat$end <- eh

# add column duration
dat$duration <- eh - sh


# ================================================
# Handling locations (geographical coords)
# ================================================

# toy vector of coordinates
locs <- c(
  "(37.7651967350509,-122.416451692902)",
  "(37.7907890558203,-122.402273431333)",
  "(37.7111991003088,-122.394693339395)",
  "(37.7773000262759,-122.394812784799)",
  NA
)

# "removing" parentheses
locs_temp <- str_replace_all(locs, pattern = '\\(|\\)', replacement = '')

# list of latitude and longitude values
lat_long <- str_split(locs_temp, pattern = ',')

# apply it to entire data
locs_temp <- str_replace_all(dat$Location, pattern = '\\(|\\)', replacement = '')

lat_lon <- str_split(locs_temp, pattern = ',')

# numeric vectors of latitude and longitude values
lat <- as.numeric(sapply(lat_lon, function(x) x[1]))
lon <- as.numeric(sapply(lat_lon, function(x) x[2]))

# add lon and lat to dat
dat$lon <- lon
dat$lat <- lat


# ================================================
# Basic scatterplots (for mapping locations)
# ================================================

# "naked" map
plot(lon, lat)

# same with plot_ly() as base R plot()
plot_ly(x=lon, y=lat, type = 'scatter', mode = 'markers')

# plot_ly() similar to ggplot()
plot_ly(data = dat, x = ~lon, y = ~lat, type = 'scatter', mode = 'markers')


# ================================================
# Map with plot_ly()
# ================================================

# geo styling
g <- list(
  scope = 'CA',
  projection = list(type = 'albers usa'),
  showland = TRUE,
  landcolor = toRGB("gray95"),
  subunitcolor = toRGB("gray85"),
  countrycolor = toRGB("gray85"),
  countrywidth = 0.5,
  subunitwidth = 0.5
)


p <- plot_geo(dat, lat = ~lat, lon = ~lon) %>%
  add_markers() %>%
  layout(title = 'some title', geo = g)

p

# ================================================
# Map with "RgoogleMaps"
# ================================================

# R Google Maps option 1 (color terrain map)
center <- c(mean(lat, na.rm = TRUE), mean(lon, na.rm = TRUE))
zoom <- min(MaxZoom(range(lat, na.rm = TRUE), range(lon, na.rm = TRUE)))

map1 <- GetMap(
  center=center, zoom=zoom, 
  destfile = "lab10-images/BayAreaMap1.png")

map2 <- GetMap(
  center=center, zoom=zoom, 
  destfile="lab10-images/BayAreaMap2.png",
  GRAYSCALE = TRUE, maptype = "mobile")

dev.new()
PlotOnStaticMap(map1, lat, lon, col=hsv(0.95,1,1,0.5), 
                pch=20)

PlotOnStaticMap(map2, lat, lon, col=hsv(0.95,1,1,0.5), 
                pch=20)



dev.new()
PlotOnStaticMap(BayAreaMap2, lat, lon)
PlotOnStaticMap(BayAreaMap2, lat, lon, col=hsv(0.95,1,1,0.5), 
                pch=20)


# ================================================
# Maps with "ggmap"
# ================================================

# add variables 'lat' and 'lon' to the data frame
dat$lat <- lat
dat$lon <- lon

# let's get rid of rows with missing values
dat <- na.omit(dat)

# ggmap typically asks you for a zoom level, 
# but we can try using ggmap’s make_bbox function:
sbbox <- make_bbox(lon = dat$lon, lat = dat$lat, f = .1)
sbbox

# First get the map. By default it gets it from Google. 
# I want it to be a satellite map
sf_map <- get_map(location = sbbox, maptype = "terrain", source = "google")

# Now, when we grab the map ggmap will try to fit it into 
# that bounding box. Let's try:
ggmap(sf_map) + 
  geom_point(data = dat, 
             mapping = aes(x = lon, y = lat), 
             color = "red", alpha = 0.2, size = 1)





# ================================================
# Vector of animal names
# ================================================

# vector of strings
animals <- c('dog', 'cat', 'bird', 'dolphin', 'lion',
             'zebra', 'tiger', 'wolf', 'whale', 'eagle',
             'pig', 'osprey', 'kangaroo', 'koala')

# zero or more 'o'
str_extract(animals, 'o*')
animals[str_detect(animals, 'o*')]

# at least 1 'o'
str_extract(animals, 'o+')
animals[str_detect(animals, 'o+')]

# zero or one 'o'
str_extract(animals, 'o?')
animals[str_detect(animals, 'o?')]

# exactly 2 'o'
str_extract(animals, 'o{2}')
animals[str_detect(animals, 'o{2}')]

# animals with one `o`, but not two `o`'s together
str_extract(animals, 'o[^o]')
animals[str_detect(animals, 'o[^o]')]

# two vowels together
str_extract(animals, '[aeiou]{2}')
animals[str_detect(animals, '[aeiou]{2}')]

# two consonants together
str_extract(animals, '[^aeiou]{2}')
animals[str_detect(animals, '[^aeiou]{2}')]

# three consonants together
str_extract(animals, '[^aeiou]{3}')
animals[str_detect(animals, '[^aeiou]{3}')]

# names with three letters
str_extract(animals, '^[a-z][a-z][a-z]$')
str_extract(animals, '^[a-z]{3}$')
animals[str_detect(animals, '^[a-z]{3}$')]

# names with three letters
str_extract(animals, '^[a-z][a-z][a-z][a-z]$')
str_extract(animals, '^[a-z]{4}$')
animals[str_detect(animals, '^[a-z]{4}$')]


# ================================================
# Vector of file names
# ================================================

files <- c('sales1.csv', 'orders.csv', 'sales2.csv',
           'sales3.csv', 'europe.csv', 'usa.csv', 'mex.csv',
           'CA.csv', 'FL.csv', 'NY.csv', 'TX.csv',
           'sales-europe.csv', 'sales-usa.csv', 'sales-mex.csv')

# file names with numbers
grep('[0123456789]', files, value = TRUE)

# equivalently (file names with numbers)
grep('[0-9]', files, value = TRUE)

# equivalently (file names with numbers)
grep('[[:digit:]]', files, value = TRUE)

# file names with no numbers
grep('.\\D.csv', files, value = TRUE)

# equivalently (file names with no numbers)
grep('.[^0-9].csv', files, value = TRUE)

# file names with lower case letters (including file extension)
grep('[a-z]', files, value = TRUE)

# file names with lower case letters (just the name in lower case)
grep('[a-z].csv', files, value = TRUE)

# file names with lower case letters (just the name in lower case)
grep('[[:lower:]].csv', files, value = TRUE)

# file names with upper case letters
grep('[A-Z]', files, value = TRUE)

# equivalently (file names with upper case letters)
grep('[[:upper:]]', files, value = TRUE)

# file names containing a dash
grep('-', files, value = TRUE)

# file names containing no dash
grep('^[^-]*$', files, value = TRUE)

# changing 'csv' extension into 'txt' extension
sub('csv', 'txt', files)

# separate file name from file extension
# (we need to escape the dot character)
strsplit(files, '\\.')


# ================================================
# Some functions
# ================================================

# Create a function split_chars() that splits a character string 
# into one single character elements.
split_chars <- function(x) {
  unlist(strsplit(x, ''))
}

split_chars('Go Bears!')
split_chars('Lumox Maxima')


# Write a function reverse_chars() that reverses a string by characters. 
reverse_chars <- function(string) {
  string_split <- strsplit(as.character(string), split = "")
  reversed_split <- string_split[[1]][nchar(string):1]
  return(paste(reversed_split, collapse = ""))
} 

reverse_chars("Lumos Maxima")
reverse_chars("expecto patronum")
