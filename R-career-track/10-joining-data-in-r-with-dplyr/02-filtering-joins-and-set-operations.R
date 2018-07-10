# View the output of semi_join()
artists %>% 
  semi_join(songs, by = c("first", "last"))

# Create the same result
artists %>% 
  right_join(songs, by = c("first", "last")) %>% 
  filter(!is.na(instrument)) %>% 
  select(first, last, instrument)

albums %>% 
  # Collect the albums made by a band
  semi_join(bands, by = "band") %>% 
  # Count the albums made by a band
  nrow()

# Return rows of artists that don't have bands info
artists %>% 
  anti_join(bands, by = c("first","last"))

# Check whether album names in labels are mis-entered
labels %>% 
  anti_join(albums,by="album")

# Determine which key joins labels and songs
labels
songs

# Check your understanding
songs %>% 
  # Find the rows of songs that match a row in labels
  semi_join(labels,by="album") %>% 
  # Number of matches between labels and songs
  nrow()

aerosmith %>% 
  # Create the new dataset using a set operation
  union(greatest_hits) %>% 
  # Count the total number of songs
  nrow()

# Create the new dataset using a set operation
aerosmith %>% 
  intersect(greatest_hits)

# Select the song names from live
live_songs <- live %>% select(song)

# Select the song names from greatest_hits
greatest_songs <- greatest_hits %>% select(song)

# Create the new dataset using a set operation
live_songs %>% 
  setdiff(greatest_songs)

# Select songs from live and greatest_hits
live_songs <- select(live, song)
greatest_songs <-  select(greatest_hits, song)

# Return the songs that only exist in one dataset
un <- union(live_songs, greatest_songs, by="song")
inter <- intersect(live_songs, greatest_songs, by="song")
setdiff(un,inter,by="song")

# Check if same order: definitive and complete
identical(definitive,complete)

# Check if any order: definitive and complete
setequal(definitive,complete)

# Songs in definitive but not complete
setdiff(definitive,complete)

# Songs in complete but not definitive
setdiff(complete,definitive)

# Return songs in definitive that are not in complete
definitive %>% 
  anti_join(complete)

# Return songs in complete that are not in definitive
complete %>% 
  anti_join(definitive)

# Check if same order: definitive and union of complete and soundtrack
definitive %>%
  identical(union(complete,soundtrack))

# Check if any order: definitive and union of complete and soundtrack
definitive %>%
setequal(union(complete,soundtrack))

