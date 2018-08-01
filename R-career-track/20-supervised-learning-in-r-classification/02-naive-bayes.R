# Compute P(A) 
p_A <- nrow(subset(where9am, location=='office')) / nrow(where9am)

# Compute P(B)
p_B <- nrow(subset(where9am, daytype=='weekday')) / nrow(where9am)

# Compute the observed P(A and B)
p_AB <- nrow(subset(where9am, daytype=='weekday' & location=='office')) / nrow(where9am)

# Compute P(A | B)
p_A_given_B <- p_AB / p_B

p_A_given_B

# Load the naivebayes package
library(naivebayes)

# Build the location prediction model
locmodel <- naive_bayes(location ~ daytype, data = where9am)

# Predict Thursday's 9am location
predict(locmodel, thursday9am)

# Predict Saturdays's 9am location
predict(locmodel, saturday9am)

# The 'naivebayes' package is loaded into the workspace
# and the Naive Bayes 'locmodel' has been built

# Examine the location prediction model
locmodel

# Obtain the predicted probabilities for Thursday at 9am
predict(locmodel, thursday9am , type = 'prob')

# Obtain the predicted probabilities for Saturday at 9am
predict(locmodel, saturday9am , type = 'prob')

# The 'naivebayes' package is loaded into the workspace already

# Build a NB model of location
locmodel <- naive_bayes(location~daytype +hourtype, data=locations)

# Predict Brett's location on a weekday afternoon
predict(locmodel, weekday_afternoon)

# Predict Brett's location on a weekday evening
predict(locmodel, weekday_evening)

# The 'naivebayes' package is loaded into the workspace already
# The Naive Bayes location model (locmodel) has already been built

# Observe the predicted probabilities for a weekend afternoon
predict(locmodel, weekend_afternoon, type='prob')

# Build a new model using the Laplace correction
locmodel2 <- naive_bayes(location~daytype+hourtype, data=locations, laplace=1)

# Observe the new predicted probabilities for a weekend afternoon
predict(locmodel2, weekend_afternoon, type='prob')



