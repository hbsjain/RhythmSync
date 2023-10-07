

library(shiny)
library(ggplot2)
library(tidyverse)
library(shinydashboard)

spotify_songs <-
  readr::read_csv(
    'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv'
  )

# Define UI for application

ui <- dashboardPage(
  dashboardHeader(title = "RHYTHMS"),

  dashboardSidebar(
    sidebarMenu(
      menuItem("Chapter 1", tabName = "chapter1"),
      menuItem("Chapter 2", tabName = "chapter2"),
      menuItem("Chapter 3", tabName = "chapter3"),
      menuItem("Chapter 4", tabName = "chapter4"),
      menuItem("Chapter 5", tabName = "chapter5"),
      menuItem("About", tabName = "about")
    )
  ),

  dashboardBody(
    tabItems(
      tabItem(
        tabName = "chapter1",
        h2("Chapter 1: Diving into Diversity"),
        h4(
          "Explore the distribution of tracks across different genres and subgenres."
        ),
        fluidRow(
          column(
            width = 6,
            selectInput(
              "genre",
              "Select Genre:",
              choices = unique(spotify_songs$playlist_genre)
            ),
            h4(
              "Each bar represents a unique subgenre, and the height of the bar corresponds
                       to the number of tracks associated with that subgenre."
            ),
            h4("Key Takeaways"),
            p(
              HTML(
                "<ol><li>You can choose a genre of interest and quickly visualize how it breaks down
                       into different subgenres. This empowers you to identify the subgenres that are
                       most prevalent within the genre they enjoy.</li>
                       <li>The chart can help you to discover subgenres you might not have known about before.
                       This can be especially valuable for those seeking to expand their musical horizons.</li>
                       <li>For music curators and enthusiasts, this visualization can aid in the creation of
                       diverse playlists that encompass a wide range of subgenres within a chosen genre.</li>
                       <li>Musicians, producers, and industry professionals can gain insights into which
                       subgenres are trending or have high representation, aiding them in making informed
                       decisions about their musical endeavors.</li></ol>"
              )
            )
          ),
          column(width = 6,
                 plotOutput("genreDistribution"))
        )

      ),

      tabItem(
        tabName = "chapter2",
        h2("Chapter 2: Dance to the Beat of Audio Features"),
        h4(
          "Uncover the intricate relationships between the danceability and energy attributes of music tracks."
        ),
        fluidRow(column(
          width = 6,
          h4(
            "Each point on the plot represents a track, and its position is determined by its danceability
                       (on the x-axis) and energy (on the y-axis)."
          ),
          h4("Key Takeaways"),
          p(
            HTML(
              "<ol><li>Users can observe how different music genres vary in terms of danceability and energy.
                       This allows them to identify patterns and differences between genres that contribute to the overall
                       vibe and feel of the music.</li>
                       <li>By clicking on points within the plot, users can obtain information about specific
                       tracks, including the artist, track name, and associated genre. This empowers users to
                       explore tracks with similar danceability and energy levels.</li>
                       <li>Music curators can use this plot to curate playlists that cater to specific energy and danceability
                       preferences. It helps in selecting tracks that align with the desired mood and atmosphere.</li>
                       <li>Musicians and producers can gain insights into how danceability and energy attributes
                       contribute to the composition and reception of their music.</li></ol>"
            )
          )
        ),
        column(
          width = 6,
          plotOutput("audioFeaturesScatter")
        ))
      ),

      tabItem(
        tabName = "chapter3",
        h2("Chapter 3: Evolution Across Eras"),
        h4(
          "Witness the evolution of its loudness over different time periods."
        ),
        fluidRow(
          column(
            width = 6,
            checkboxGroupInput(
              "genreLoundness",
              "Select Genres:",
              choices = unique(spotify_songs$playlist_genre),
              selected = unique(spotify_songs$playlist_genre)[1]
            ),
            h4(
              "Each line on the plot represents the trajectory of loudness over time for a specific
                          genre or playlist."
            ),
            h4("Key Takeaways"),
            p(
              HTML(
                "<ol><li>Users can grasp the overall loudness trends in music across different eras.
                       This can help them understand how changes in music production techniques, technology, and
                       cultural shifts have influenced the sonic landscape.</li>
                       <li>By selecting specific genres or playlists, users can focus their analysis on how
                       loudness trends differ among musical styles. This aids in understanding genre-specific
                       artistic choices and listener preferences.</li>
                       <li>Users can explore how music loudness correlates with historical events, social
                       movements, and technological advancements. This adds depth to their understanding
                       of how music reflects broader cultural contexts.</li></ol>"
              )
            )
          ),
          column(width = 6,
                 plotOutput("loudnessOverTime"))
        )
      ),

      tabItem(
        tabName = "chapter4",
        h2("Chapter 4: Playlists: The Curators of Emotion"),
        h4(
          "Gain insights into the artistic curation of playlists and how they evoke unique emotional responses."
        ),
        fluidRow(
          column(
            width = 6,
            selectInput(
              "playlist",
              "Select Playlist:",
              choices = unique(spotify_songs$playlist_name)
            ),
            h4(
              "Each bar represents an artist and the height of the bar corresponds to the number
                          of tracks by that artist within the playlist"
            ),
            h4("Key Takeaways"),
            p(
              HTML(
                "<ol><li>Users gain a deeper understanding of how playlists curate tracks from
                       various artists and subgenres to craft a unified emotional experience. This insight
                       fosters appreciation for the thoughtfulness behind playlist curation.</li>
                       <li>By observing the artist distribution within a playlist, users can infer the
                       emotional diversity the playlist aims to offer. They can identify which artists
                       and subgenres contribute to specific emotional tones.</li>
                       <li>Users can discover new artists and subgenres that are present within the playlist.
                        This can lead to exploring tracks and genres they might not have encountered otherwise.</li>
                       <li>Playlist curators can utilize this plot to evaluate the distribution of artists and
                        subgenres within their playlists. It aids in ensuring a balanced representation and
                        intended emotional impact.</li></ol>"
              )
            )
          ),
          column(width = 6,
                 plotOutput("playlistComposition"))
        )
      ),

      tabItem(
        tabName = "chapter5",
        h2("Chapter 5: Clustering: Unveiling Hidden Patterns"),
        h4(
          "Visually discern how tracks are grouped together based on their danceability and
                 energy, potentially revealing distinct musical genres, styles, or moods."
        ),
        fluidRow(
          column(
            width = 6,
            numericInput(
              "numClusters",
              "Number of Clusters:",
              value = 3,
              min = 2,
              max = 10
            ),
            h4(
              " Each point on the plot corresponds to a track and is colored according
                          to the cluster it belongs to. "
            ),
            h4("Key Takeaways"),
            p(
              HTML(
                "<ol><li>Users can observe the emergent patterns and clusters that the
                       algorithm uncovers. This insight deepens their understanding of the inherent
                       structures within the dataset and identifies potentially similar tracks.</li>
                       <li>By analyzing the clusters, users can gain insights into potential groupings of tracks
                       that share musical genres, moods, or attributes. This aids in music exploration and discovery.</li>
                       <li>Users can use the cluster insights to curate playlists that exhibit thematic consistency.
                       They can choose tracks from the same cluster to create playlists with coherent musical themes.</li>
                       <li>Musicians and producers can explore clusters to gain creative inspiration for blending
                       musical styles and genres, potentially leading to innovative compositions.</li></ol>"
              )
            )
          ),
          column(width = 6,
                 plotOutput("clusterPlot"))
        )
      ),


      tabItem(
        tabName = "about",
        h2("About"),
        fluidRow(
          column(
            width = 4,
            align = "center",
            imageOutput("image_output")
          ),
          column(
            width = 8,
            h4(
              "Hello! I'm Harsh Jain, the creator of this interactive music data exploration app."
            ),
            h4(
              "I have designed this app to offer a captivating journey through the world of music data."
            ),
            h4(
              "I am passionate about combining music and data to unravel unique insights and stories."
            ),
            h4(
              "Feel free to explore the app and immerse yourself in the melodies and patterns that shape music."
            ),
            p(
              HTML(
                "<b>Source Data</b>: <a href='https://github.com/rfordatascience/tidytuesday/tree/master/data/2020
                              /2020-01-21' target='_blank'>Spotify_Songs</a> This data week comes from Spotify via the spotifyr
                              package. Charlie Thompson, Josiah Parry, Donal Phipps, and Tom Wolff authored this package to make
                              it easier to get either your own data or general metadata arounds songs from Spotify's API. "
              )
            ),
            p(
              HTML(
                "<b>Purpose</b>: The primary purpose of this interactive music data exploration app is to empower
                              music enthusiasts, researchers, and curious minds to embark on a captivating journey through the
                              rich and diverse world of music. By providing a user-friendly platform to analyze and visualize
                              intricate musical attributes, I aim to foster a deeper understanding of how music evolves over time,
                              resonates with different genres and emotions, and impacts listeners worldwide."
              )
            ),
            p(
              HTML(
                "<b>Motivation</b>: The motivation behind developing this app lies in the inherent beauty and
                              complexity of music as a universal language. Music has the power to transcend boundaries and
                              evoke profound emotions, making it an essential part of our lives. Through this app, I aspire
                              to unlock the hidden stories within musical data, allowing users to uncover intriguing patterns,
                              explore unique combinations of audio features, and witness the evolution of musical preferences
                              across eras and genres. As the digital age reshapes the way we consume and interact with music,
                              my motivation is to offer a digital canvas where users can delve into the nuances of tracks,
                              playlists, and genres. By embracing data-driven exploration, I aim to bridge the gap between
                              the artistic and analytical aspects of music, fostering a deeper connection between listeners
                              and the melodies that shape their experiences."
              )
            ),
          )
        ),
        hr(),
        fluidRow(column(
          width = 12,
          h4("Session Information:"),
          verbatimTextOutput("session_info_output")
        ))
      )
    )
  )
)

# Define server for application

server <- function(input, output) {
  output$genreDistribution <- renderPlot({
    filtered_data <-
      subset(spotify_songs, playlist_genre == input$genre)
    ggplot(filtered_data, aes(x = playlist_subgenre)) +
      geom_bar(fill = "#1f77b4", color = "black") +
      labs(title = "Distribution of Subgenres", x = "Subgenre", y = "Count") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })

  output$audioFeaturesScatter <- renderPlot({
    ggplot(spotify_songs,
           aes(x = danceability, y = energy, color = playlist_genre)) +
      geom_point(alpha = 0.6, size = 3) +  # Customizing point transparency and size
      facet_wrap( ~ playlist_genre) +
      labs(title = "Danceability vs. Energy by Genre", x = "Danceability", y = "Energy") +
      theme_minimal() +
      theme(
        legend.position = "bottom",
        # Moving legend to the bottom
        plot.title = element_text(size = 16, hjust = 0.5),
        # Adjusting title size and alignment
        axis.title = element_text(size = 14),
        # Adjusting axis title size
        legend.title = element_text(size = 12),
        # Adjusting legend title size
        legend.text = element_text(size = 10),
        # Adjusting legend text size
        strip.text = element_text(size = 12)  # Adjusting facet label size
      )
  })

  output$loudnessOverTime <- renderPlot({
    filtered_data <-
      subset(spotify_songs, playlist_genre == input$genreLoundness)
    summarized_data <- filtered_data %>%
      group_by(year = as.numeric(substr(track_album_release_date, 1, 4))) %>%
      summarize(avg_loudness = mean(loudness))

    ggplot(summarized_data, aes(x = year, y = avg_loudness)) +
      geom_line(color = "#e41a1c") +
      labs(title = "Average Loudness Evolution Over Time", x = "Year", y = "Average Loudness") +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, hjust = 0.5),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 12),
        legend.position = "none"
      )
  })

  output$playlistComposition <- renderPlot({
    filtered_data <-
      subset(spotify_songs, playlist_name == input$playlist)

    ggplot(filtered_data,
           aes(x = track_artist, fill = playlist_subgenre)) +
      geom_bar(position = "dodge", color = "black") +
      labs(title = "Artist Composition of Playlist", x = "Artist", y = "Number of Tracks") +
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, hjust = 0.5),
        axis.text.x = element_text(
          angle = 45,
          hjust = 1,
          vjust = 1
        ),
        # Adjusting x-axis text angle and alignment
        legend.position = "bottom",
        # Moving legend to the bottom
        legend.title = element_text(size = 12),
        # Adjusting legend title size
        legend.text = element_text(size = 10)  # Adjusting legend text size
      )
  })

  output$clusterPlot <- renderPlot({
    cluster_data <-
      spotify_songs[c("danceability", "energy", "valence")]
    kmeans_result <-
      kmeans(cluster_data, centers = input$numClusters)

    ggplot(cluster_data,
           aes(
             x = danceability,
             y = energy,
             color = factor(kmeans_result$cluster)
           )) +
      geom_point(alpha = 0.7, size = 3) +
      labs(
        title = paste("Clusters:", input$numClusters),
        x = "Danceability",
        y = "Energy"
      ) +
      scale_color_discrete(name = "Cluster") +  # Customize legend title
      theme_minimal() +
      theme(
        plot.title = element_text(size = 16, hjust = 0.5),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 12),
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10),
        legend.position = "bottom"
      )
  })

  output$image_output <- renderImage({
    list(src = "photo.jpg", height = "200px")
  }, deleteFile = FALSE)

  session_info <- capture.output(sessionInfo())
  output$session_info_output <- renderPrint({
    cat(paste(session_info, collapse = "\n"))
  })

}

# Run the application
shinyApp(ui, server)
