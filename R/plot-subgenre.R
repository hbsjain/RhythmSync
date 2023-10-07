#' Generate a Bar Plot of Subgenre Distribution
#'
#' @name plot_subgenre
#'
#' @description
#'  This function takes an input genre and generates a bar plot to visualize the distribution of subgenres
#' within that genre. It provides insights into the variety of subgenres present in the selected genre.
#'
#' @param input_genre The genre of interest for which the subgenre distribution is to be visualized.
#'   Genres must be one of the following: "pop," "rap," "rock," "latin," "r&b," or "edm" (case-sensitive).
#'
#' @return A bar plot displaying the count of each subgenre within the selected genre.
#'
#' @examples
#' # Generate a bar plot for the "rock" genre
#' plot_subgenre("rock")
#'
#' @seealso \code{\link{ggplot}}
#'
#' @import ggplot2
#'
#' @export

plot_subgenre <- function(input_genre) {
  filtered_data <-
    subset(spotify_songs, playlist_genre == input_genre)

  subgenre_counts <- table(filtered_data$playlist_subgenre)

  plot_data <- data.frame(Subgenre = factor(names(subgenre_counts), levels = names(
    sort(subgenre_counts, decreasing = TRUE)
  )),
  Count = as.numeric(subgenre_counts))

  # Create the bar plot
  plot <- ggplot(plot_data, aes(x = Subgenre, y = Count)) +
    geom_bar(stat = "identity",
             fill = "#1f77b4",
             color = "black") +
    labs(title = "Distribution of Subgenres", x = "Subgenre", y = "Count") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))

  # Return the plot
  return(plot)
}
