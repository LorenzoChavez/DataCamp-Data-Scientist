# hflights and dplyr are loaded in the workspace
# Print out a summary with variables min_dist and max_dist
summarise(hflights, min_dist = min(Distance), max_dist = max(Distance))

# Print out a summary with variable max_div
summarise(filter(hflights, Diverted == 1), max_div = max(Distance))

# hflights is available

# Remove rows that have NA ArrDelay: temp1
temp1 <- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarise(temp1, earliest = min(ArrDelay), average = mean(ArrDelay), latest = max(ArrDelay), sd = sd(ArrDelay))

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, !is.na(TaxiIn) & !is.na(TaxiOut))
dim(temp2)
# Print the maximum taxiing difference of temp2 with summarise()
summarise(temp2, max_taxi_diff = max(abs((TaxiIn - TaxiOut))))

# hflights is available with full names for the carriers
glimpse(hflights)
# Generate summarizing statistics for hflights
summarise(hflights,n_obs = n(), n_carrier = n_distinct(UniqueCarrier), n_dest = n_distinct(Dest))

# All American Airline flights
aa <- filter(hflights, UniqueCarrier == "American")

# Generate summarizing statistics for aa 
summarise(aa, n_flights = n(), n_canc = sum(Cancelled == 1), avg_delay = mean(ArrDelay, na.rm = TRUE))

# hflights and dplyr are both loaded and ready to serve you

# Write the 'piped' version of the English sentences.
hflights %>%
  mutate(diff = TaxiOut - TaxiIn) %>%
  filter(!is.na(diff)) %>%
  summarise(avg = mean(diff))

# Chain together mutate(), filter() and summarise()
glimpse(hflights)
hflights %>%
  mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
  filter(!is.na(mph) & mph < 70) %>%
  summarise(n_less = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))

# Finish the command with a filter() and summarise() call
glimpse(hflights)
hflights %>%
  mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
  filter(mph < 105 | Cancelled == 1 | Diverted == 1) %>%
  summarise(n_non = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))

# hflights and dplyr are loaded
# Count the number of overnight flights
hflights %>%
  filter(!is.na(DepTime) & !is.na(ArrTime) & DepTime > ArrTime) %>%
summarise(num = n())
