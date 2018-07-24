# Scatterplot of weight vs. weeks
ggplot(ncbirths, aes(x=weeks, y=weight)) +
geom_point()

# Boxplot of weight vs. weeks
ggplot(data = ncbirths, 
       aes(x = cut(weeks , breaks = 5), y = weight)) + 
  geom_boxplot()

# Mammals scatterplot
ggplot(mammals,aes(y=BrainWt,x=BodyWt)) +
  geom_point()

# Baseball player scatterplot
ggplot(mlbBat10,aes(y=SLG,x=OBP)) +
  geom_point()

# Body dimensions scatterplot
ggplot(bdims,aes(y=wgt,x=hgt, color=factor(sex))) +
  geom_point()

# Smoking scatterplot
ggplot(smoking,aes(y=amtWeekdays,x=age)) +
  geom_point()

# Scatterplot with coord_trans()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() + 
  coord_trans(x = "log10", y = "log10")

# Scatterplot with scale_x_log10() and scale_y_log10()
ggplot(data = mammals, aes(x = BodyWt, y = BrainWt)) +
  geom_point() +
  scale_x_log10() + scale_y_log10()

# Scatterplot of SLG vs. OBP
mlbBat10 %>%
  filter(AB >= 200) %>%
  ggplot(aes(x = OBP, y = SLG)) +
  geom_point()

# Identify the outlying player
mlbBat10 %>%
filter(OBP < 0.200, AB >= 200)

