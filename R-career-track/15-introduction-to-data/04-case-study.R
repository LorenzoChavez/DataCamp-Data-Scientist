# Inspect evals
str(evals)

# Inspect variable types
glimpse(evals)

# Remove non-factor variables from this vector
cat_vars <- c("rank", "ethnicity", "gender", "language", "cls_level", "cls_profs", "cls_credits","pic_outfit", "pic_color")

# Recode cls_students as cls_type: evals
evals <-  evals %>%
  # Create new variable
  mutate(cls_type = ifelse(cls_students < 19, "small", 
                      ifelse(cls_students < 60, "midsize", "large")))

# Scatterplot of score vs. bty_avg
ggplot(evals, aes(x=bty_avg, y=score)) +
  geom_point()

# Scatterplot of score vs. bty_avg colored by cls_type
ggplot(evals, aes(x=bty_avg, y=score,color=cls_type)) +
  geom_point()
