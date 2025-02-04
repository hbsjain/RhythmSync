#' Data of 5000 songs from 6 main categories (EDM, Latin, Pop, R&B, Rap, & Rock).
#'
#'
#' @format A data frame with 23 variables
#' \describe{
#'   \item{track_id}{Song unique ID}
#'   \item{track_name}{Song Name}
#'   \item{track_artist}{Song Artist}
#'   \item{track_popularity}{Song Popularity (0-100) where higher is better}
#'   \item{track_album_id}{Album unique ID}
#'   \item{track_album_name}{Song album name}
#'   \item{track_album_release_date}{Date when album released}
#'   \item{playlist_name}{Name of playlist}
#'   \item{playlist_id}{Playlist ID}
#'   \item{playlist_genre}{Playlist genre}
#'   \item{playlist_subgenre}{Playlist subgenre}
#'   \item{danceability}{Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.}
#'   \item{energy}{Energy is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features contributing to this attribute include dynamic range, perceived loudness, timbre, onset rate, and general entropy.}
#'   \item{key}{The estimated overall key of the track. Integers map to pitches using standard Pitch Class notation. E.g. 0 = C, 1 = C♯/D♭, 2 = D, and so on. If no key was detected, the value is -1.}
#'   \item{loudness}{The overall loudness of a track in decibels (dB). Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks. Loudness is the quality of a sound that is the primary psychological correlate of physical strength (amplitude). Values typically range between -60 and 0 dB.}
#'   \item{mode}{Mode indicates the modality (major or minor) of a track, the type of scale from which its melodic content is derived. Major is represented by 1 and minor is 0.}
#'   \item{speechiness}{Speechiness detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audio book, poetry), the closer to 1.0 the attribute value. Values above 0.66 describe tracks that are probably made entirely of spoken words. Values between 0.33 and 0.66 describe tracks that may contain both music and speech, either in sections or layered, including such cases as rap music. Values below 0.33 most likely represent music and other non-speech-like tracks.}
#'   \item{acousticness}{A confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic.}
#'   \item{instrumentalness}{Predicts whether a track contains no vocals. "Ooh" and "aah" sounds are treated as instrumental in this context. Rap or spoken word tracks are clearly "vocal". The closer the instrumentalness value is to 1.0, the greater likelihood the track contains no vocal content. Values above 0.5 are intended to represent instrumental tracks, but confidence is higher as the value approaches 1.0.}
#'   \item{liveness}{Detects the presence of an audience in the recording. Higher liveness values represent an increased probability that the track was performed live. A value above 0.8 provides strong likelihood that the track is live.}
#'   \item{valence}{A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).}
#'   \item{tempo}{The overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration.}
#'   \item{duration_ms}{Duration of song in milliseconds}
#' }
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-01-21/spotify_songs.csv}
"spotify_songs"
