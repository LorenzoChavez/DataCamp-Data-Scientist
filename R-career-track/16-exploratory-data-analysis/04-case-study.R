# Load packages
library(ggplot2)
library(dplyr)
library(openintro)

# Compute summary statistics
email %>%
  group_by(spam) %>%
  summarise(median(num_char),IQR(num_char))

# Create plot
email %>%
  mutate(log_num_char = log(num_char)) %>%
  ggplot(aes(x = spam, y = log_num_char)) +
  geom_boxplot()

# Compute center and spread for exclaim_mess by spam
email %>%
  group_by(spam) %>%
  summarise(median(exclaim_mess), IQR(exclaim_mess))

# Create plot for spam and exclaim_mess
email %>%
  ggplot(aes(x=log(exclaim_mess+0.1))) +
  geom_histogram() +
  facet_wrap(~ spam)

# Create plot of proportion of spam by image
email %>%
  mutate(has_image = image > 0) %>%
  ggplot(aes(x = has_image, fill = spam)) +
  geom_bar(position = "fill")

# Test if images count as attachments
sum(email$image > email$attach)

# Question 1
email %>%
  filter(dollar > 0) %>%
  group_by(spam) %>%
  summarize(median(dollar))

# Question 2
email %>%
  filter(dollar > 10) %>%
  ggplot(aes(x = spam)) +
  geom_bar()

# Reorder levels
email$number <- factor(email$number, levels = c("none", "small", "big"))

# Construct plot of number
ggplot(email, aes(x=number)) +
  geom_bar() +
  facet_wrap(~ spam)

