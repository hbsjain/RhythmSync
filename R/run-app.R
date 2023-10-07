#' Runs the shiny app named Rhythms
#'
#' @description
#' Rhythms app takes you through a journey exploring different aspects of music.
#' It has 5 different chapters each exploring different part of the music data.
#' Chapter 1: Diving into Diversity: Allows you to explore the distribution of music tracks across different genres and subgenres.
#' Chapter 2: Dance to the Beat of Audio Features: Helps you uncover the relationships between danceability and energy attributes of music tracks.
#' Chapter 3: Evolution Across Eras: Allows you to witness the evolution of loudness in music over different time periods.
#' Chapter 4: Playlists: The Curators of Emotion: Provides insights into the curation of music playlists and how they evoke emotional responses.
#' Chapter 5: Clustering: Unveiling Hidden Patterns: Helps you visually discern how music tracks are grouped together based on their danceability and energy attributes.
#'
#' @return Shiny App launches in a web browser
#'
#' @export
run_app <- function() {
  app_dir <- system.file("Rhythms", package = "RhythmSync")
  shiny::runApp(app_dir, display.mode = "normal")
}
