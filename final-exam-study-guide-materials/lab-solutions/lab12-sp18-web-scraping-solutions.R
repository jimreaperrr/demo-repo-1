# Title: "Lab 12: Getting Started with Web Scraping"
# Subtitle: "Stat 133, Spring 2018"
# Author: "Gaston Sanchez"


# packages
library(XML)
library(xml2)
library(rvest)
library(stringr)
library(magrittr)


# ===============================================
# Reading Roster table of GSW
# ===============================================

# Assemble url (so it fits on screen)
basket <- "https://www.basketball-reference.com"
gsw <- "/teams/GSW/2017.html"
gsw_url <- paste0(basket, gsw)

# download HTML file to your working directory
download.file(gsw_url, 'gsw-roster-2017.html')

# Read GSW Roster html table
gsw_roster <- readHTMLTable('gsw-roster-2017.html')


# ===============================================
# Reading Conference Standing Tables
# ===============================================

nba_html <- paste0(basket, "/leagues/NBA_2017.html")

xml_doc <- read_html(nba_html)

# conf standings html tables
xml_tables <- xml_doc %>%
  html_nodes("table") %>%
  extract(1:2)

# href attributes
hrefs <- xml_tables %>% 
  html_nodes("a") %>%
  html_attr("href")

# vector of team abbreviations
teams <- str_sub(hrefs, 8, 10)

# vector of csv file names
files <- paste0(teams, '-roster-2017.csv')

# first team
team_url <- paste0(basket, hrefs[1])

# roster table(as a data frame)
roster <- read_html(team_url) %>%
  html_nodes("table") %>%
  html_table()

# exporting first csv file
write.csv(roster[[1]], files[1])


# ===============================================
# For loop: crawler
# ===============================================

# for loop for all roster tables
for (i in 1:length(teams)) {
  # assemble url
  team_url <- paste0(basket, hrefs[i])
  # get roster (data frame)
  roster <- read_html(team_url) %>%
    html_nodes("table") %>%
    html_table()
  # export table
  write.csv(roster[[1]], files[i])
}

