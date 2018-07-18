# Load data
data(gapminder)

# Glimpse data
glimpse(gapminder)

# Identify type of study
type_of_study <- "observational"

# Load packages
library(dplyr)
library(tidyr)

# Count number of male and female applicants admitted
ucb_counts <- ucb_admit %>%
  count(Gender,Admit)

# View result
ucb_counts
  
# Spread the output across columns
ucb_counts %>%
  spread(key= Admit, n)


ucb_admit %>%
  # Table of counts of admission status and gender
  count(Admit, Gender) %>%
  # Spread output across columns based on admission status
  spread(Admit, n) %>%
  # Create new variable
  mutate(Perc_Admit =  Admitted/ ( Admitted+Rejected))

# Table of counts of admission status and gender for each department
admit_by_dept <- ucb_admit %>%
  count(Dept, Admit, Gender) %>%
  spread(Admit, n)

# View result
admit_by_dept

# Percentage of those admitted to each department
admit_by_dept %>%
  mutate(Perc_Admit = Admitted / (Admitted + Rejected))
