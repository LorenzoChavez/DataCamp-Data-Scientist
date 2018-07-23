# Load dplyr package
library(dplyr)

# Print the votes_processed dataset
votes_processed

# Print the descriptions dataset
descriptions

# Join them together based on the "rcid" and "session" columns
votes_joined <- inner_join(votes_processed, descriptions, by=c("rcid", "session"))

# Filter for votes related to colonialism
filter(votes_joined, co == 1)

# Load the ggplot2 package
library(ggplot2)

# Filter, then summarize by year: US_co_by_year
US_co_by_year <- filter(votes_joined, country == "United States" & co == 1) %>%
  group_by(year) %>%
  summarise(percent_yes = mean(vote == 1))

# Graph the % of "yes" votes over time
ggplot(US_co_by_year, aes(x=year, y=percent_yes)) +
  geom_line()

# Load the tidyr package
library(tidyr)

# Gather the six me/nu/di/hr/co/ec columns
gather(votes_joined, topic, has_topic, me:ec)

# Perform gather again, then filter
votes_gathered <- votes_joined %>%
  gather(topic, has_topic, me:ec) %>%
  filter(has_topic == 1)

# Replace the two-letter codes in topic: votes_tidied
votes_tidied <- votes_gathered %>%
  mutate(topic = recode(topic,
                        me = "Palestinian conflict",
                        nu = "Nuclear weapons and nuclear material",
                        di = "Arms control and disarmament",
                        hr = "Human rights",
                        co = "Colonialism",
                        ec = "Economic development"))

# Print votes_tidied
votes_tidied

# Summarize the percentage "yes" per country-year-topic
by_country_year_topic <- votes_tidied %>%
  group_by(country, year, topic) %>%
  summarise(total = n(), percent_yes = mean(vote==1)) %>%
  ungroup()

# Print by_country_year_topic
by_country_year_topic

# Load the ggplot2 package
library(ggplot2)

# Filter by_country_year_topic for just the US
US_by_country_year_topic <- filter(by_country_year_topic, country == "United States")

# Plot % yes over time for the US, faceting by topic
ggplot(US_by_country_year_topic, aes(x=year, y=percent_yes)) +
  geom_line() +
  facet_wrap(~ topic)

# Load purrr, tidyr, and broom
library(purrr)
library(tidyr)
library(broom)

# Print by_country_year_topic
by_country_year_topic

# Fit model on the by_country_year_topic dataset
country_topic_coefficients <- by_country_year_topic %>%
  nest(-country, -topic) %>%
  mutate(model = map(data, ~ lm(percent_yes ~ year, data= .)),
    tidied = map(model, tidy)) %>%
  unnest(tidied)
 
# Print country_topic_coefficients
country_topic_coefficients

# Create country_topic_filtered
country_topic_filtered <- country_topic_coefficients %>%
  filter(term=="year") %>%
  mutate(p.adjusted = p.adjust(p.value)) %>%
  filter(p.adjusted < 0.05)

# Create vanuatu_by_country_year_topic
vanuatu_by_country_year_topic <- filter(by_country_year_topic, country == "Vanuatu")

# Plot of percentage "yes" over time, faceted by topic
ggplot(vanuatu_by_country_year_topic, aes(x=year, y=percent_yes)) +
  geom_line() +
facet_wrap(~ topic)

