# Load the tibble package
library(tibble)

stage_songs %>% 
  # Add row names as a column named song
   rownames_to_column("song") %>% 
  # Left join stage_writers to stage_songs
  left_join(stage_writers, by="song")

# Examine the result of joining singers to two_songs
two_songs %>% inner_join(singers, by = "movie")

# Remove NA's from key before joining
two_songs %>% 
  filter(!is.na(movie)) %>% 
  inner_join(singers, by = "movie")

movie_years %>% 
  # Left join movie_studios to movie_years
  left_join(movie_studios, by="movie") %>% 
  # Rename the columns: artist and studio
  rename(artist = name.x, studio = name.y)

# Identify the key column
elvis_songs
elvis_movies

elvis_movies %>% 
  # Left join elvis_songs to elvis_movies by this column
  left_join(elvis_songs, by=c("name" = "movie")) %>% 
  # Rename columns
  rename(movie = name, song = name.y)

# Identify the key columns
movie_directors
movie_years

movie_years %>% 
  # Left join movie_directors to movie_years
  left_join(movie_directors, by=c("movie" = "name")) %>% 
  # Arrange the columns using select()
  select(year,movie,artist=name,director,studio)

# Load the purrr library
library(purrr)

# Place supergroups, more_bands, and more_artists into a list
list(supergroups,more_bands,more_artists) %>% 
  # Use reduce to join together the contents of the list
  reduce(left_join, by=c("first","last"))

list(more_artists, more_bands, supergroups) %>% 
  # Return rows of more_artists in all three datasets
  reduce(semi_join,by=c("first","last"))

# Alter the code to perform the join with a dplyr function
merge(bands, artists, by = c("first", "last"), all.x = TRUE) %>%
  arrange(band)

left_join(bands,artists, by=c("first","last"))

