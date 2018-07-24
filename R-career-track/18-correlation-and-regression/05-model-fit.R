# View summary of model
summary(mod)

# Compute the mean of the residuals
mean(residuals(mod))

# Compute RMSE
sqrt(sum(residuals(mod)^2) / df.residual(mod))

# View model summary
summary(mod)

# Compute R-squared
bdims_tidy %>%
  summarize(var_y = var(wgt), var_e = var(.resid)) %>%
  mutate(R_squared = 1 - (var_e/var_y))

# Compute SSE for null model
mod_null %>%
  summarize(SSE = var(.resid))

# Compute SSE for regression model
mod_hgt %>%
  summarize(SSE = var(.resid))

# Rank points of high leverage
mod %>%
  augment() %>%
  arrange(desc(.hat)) %>%
  head()

# Rank influential points
augment(mod) %>%
  arrange(desc(.cooksd)) %>%
  head()

# Create nontrivial_players
nontrivial_players <- filter(mlbBat10, AB >= 10 & OBP < 0.500)

# Fit model to new data
mod_cleaner = lm(SLG ~ OBP, data = nontrivial_players)

# View model summary
summary(mod_cleaner)
summary(mod)

# Visualize new model
ggplot(nontrivial_players, aes(x=OBP, y=SLG)) +
geom_point() +
geom_smooth(method="lm")

# Rank high leverage points
augment(mod) %>%
  arrange(desc(.hat), .cooksd)%>%
  head()

