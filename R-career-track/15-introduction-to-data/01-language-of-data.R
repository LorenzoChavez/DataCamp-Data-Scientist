# Load data
data(email50)

# View its structure
str(email50)

# Glimpse email50
glimpse(email50)

# Subset of emails with big numbers: email50_big
email50_big <- email50 %>%
  filter(number ==  "big")

# Glimpse the subset
glimpse(email50_big)

# Table of number variable
table(email50_big$number)

# Drop levels
email50_big$number <- droplevels(email50_big$number)

# Another table of number variable
table(email50_big$number)

# Calculate median number of characters: med_num_char
med_num_char <- median(email50$num_char)

# Create num_char_cat variable in email50
email50 <- email50 %>%
  mutate(num_char_cat = ifelse(num_char < med_num_char, "below median", "at or above median"))
  
# Count emails in each category
table(email50$num_char_cat)

# Create number_yn column in email50
email50 <- email50 %>%
  mutate(number_yn = ifelse(number == "none","no", "yes"))

# Visualize number_yn
ggplot(email50, aes(x = number_yn)) +
  geom_bar()

# Load ggplot2
library(ggplot2)

# Scatterplot of exclaim_mess vs. num_char
ggplot(email50, aes(x = num_char, y = exclaim_mess, color = factor(spam))) +
  geom_point()

