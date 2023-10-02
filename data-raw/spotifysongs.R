## code to prepare `spotifysongs` dataset goes here
library(readr)
library(tidyverse)

spotifysongs <- readr::read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv'
)

usethis::use_data(spotifysongs, overwrite = TRUE)
