
library(readr)
library(tidyverse)

spotify_songs <- readr::read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv'
)

usethis::use_data(spotify_songs, overwrite = TRUE)
