# hflights is pre-loaded as a tbl, together with the necessary libraries.
# Print out a tbl with the four columns of hflights related to delay
select(hflights,ActualElapsedTime,AirTime,ArrDelay,DepDelay)

# Print out the columns Origin up to Cancelled of hflights
select(hflights, Origin:Cancelled)

# Answer to last question: be concise!
select(hflights,Year:DayOfWeek,ArrDelay:Diverted)

# As usual, hflights is pre-loaded as a tbl, together with the necessary libraries.

# Print out a tbl containing just ArrDelay and DepDelay
select(hflights, ends_with("Delay"))

# Print out a tbl as described in the second instruction, using both helper functions and variable names
select(hflights, UniqueCarrier, ends_with("Num"), starts_with("Cancel"))

# Print out a tbl as described in the third instruction, using only helper functions.
select(hflights, ends_with("Time"), ends_with("Delay"))

# both hflights and dplyr are available
names(hflights)
# Finish select call so that ex1d matches ex1r
ex1r <- hflights[c("TaxiIn", "TaxiOut", "Distance")]
ex1d <- select(hflights, starts_with("Taxi"), Distance)

# Finish select call so that ex2d matches ex2r
ex2r <- hflights[c("Year", "Month", "DayOfWeek", "DepTime", "ArrTime")]
ex2d <- select(hflights, Year:ArrTime, -DayofMonth)

# Finish select call so that ex3d matches ex3r
ex3r <- hflights[c("TailNum", "TaxiIn", "TaxiOut")]
ex3d <- select(hflights, starts_with("Ta"))

# hflights and dplyr are loaded and ready to serve you.

# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)

# Add the new variable GroundTime to g1. Save the result as g2.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)

# Add the new variable AverageSpeed to g2. Save the result as g3.
g3 <- mutate(g2, AverageSpeed = Distance / AirTime *60)

# Print out g3
g3

# hflights and dplyr are ready, are you?
# Add a second variable loss_ratio to the dataset: m1
m1 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_ratio = loss/DepDelay)

# Add the three variables as described in the third instruction: m2
m2 <- mutate(hflights, TotalTaxi = TaxiIn + TaxiOut, ActualGroundTime = ActualElapsedTime - AirTime, Diff = TotalTaxi - ActualGroundTime)

