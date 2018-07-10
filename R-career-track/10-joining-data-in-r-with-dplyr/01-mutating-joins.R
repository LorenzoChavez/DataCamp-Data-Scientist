# Complete the code to join artists to bands
bands2 <- left_join(bands, artists, by = c("first","last"))

# Examine the results
bands2

# Fix the code to recreate bands2
left_join(bands, artists, by = c("first","last"))
bands2

# Finish the code below to recreate bands3 with a right join
bands2 <- left_join(bands, artists, by = c("first", "last"))
bands3 <- right_join(artists, bands, by = c("first","last"))

# Check that bands3 is equal to bands2
setequal(bands2, bands3)

# Join albums to songs using inner_join()
inner_join(songs, albums,by="album")

# Join bands to artists using full_join()
full_join(artists, bands, by = c("first", "last"))

# Find guitarists in bands dataset (don't change)
temp <- left_join(bands, artists, by = c("first", "last"))
temp <- filter(temp, instrument == "Guitar")
select(temp, first, last, band)

# Reproduce code above using pipes
bands %>% 
  left_join(artists, by = c("first", "last")) %>%
  filter(instrument == "Guitar") %>%
  select(first, last, band)

# Examine the contents of the goal dataset
goal

# Create goal2 using full_join() and inner_join() 
goal2 <- inner_join(full_join(artists,bands,by=c("first","last")), songs, by=c("first","last"))
  
# Check that goal and goal2 are the same
setequal(goal, goal2)

# Create one table that combines all information
artists %>%
  full_join(bands,by=c("first","last")) %>%
  full_join(songs,by=c("first", "last")) %>%
  full_join(albums,by=c("album", "band"))
