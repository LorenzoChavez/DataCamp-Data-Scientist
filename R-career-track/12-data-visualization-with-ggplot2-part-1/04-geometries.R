# Shown in the viewer:
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_point()

# 1 - With geom_jitter()
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_jitter()

# 2 - Set width in geom_jitter()
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_jitter(width=0.1)

# 3 - Set position = position_jitter() in geom_point() ()
ggplot(mtcars, aes(x = cyl, y = wt)) +
  geom_point(position = position_jitter(0.1))

# Examine the structure of Vocab
str(Vocab)

# Basic scatter plot of vocabulary (y) against education (x). Use geom_point()
ggplot(Vocab, aes(x=education,y=vocabulary)) +
  geom_point()

# Use geom_jitter() instead of geom_point()
ggplot(Vocab, aes(x=education,y=vocabulary)) +
geom_jitter()

# Using the above plotting command, set alpha to a very low 0.2
ggplot(Vocab, aes(x=education,y=vocabulary)) +
geom_jitter(alpha=0.2)

# Using the above plotting command, set the shape to 1
ggplot(Vocab, aes(x=education,y=vocabulary)) +
geom_jitter(alpha=0.2, shape=1)

# 1 - Make a univariate histogram
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

# 2 - Plot 1, plus set binwidth to 1 in the geom layer
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth=1)

# 3 - Plot 2, plus MAP ..density.. to the y aesthetic (i.e. in a second aes() function)
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth=1, aes(y=..density..))

# 4 - plot 3, plus SET the fill attribute to "#377EB8"
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth=1, aes(y=..density.., fill="#377EB8"))

# Draw a bar plot of cyl, filled according to am
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar()

# Change the position argument to stack
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position="stack")


# Change the position argument to fill
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position="fill")

# Change the position argument to dodge
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position="dodge")

# 1 - The last plot form the previous exercise
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = "dodge")

# 2 - Define posn_d with position_dodge()
posn_d <- position_dodge(width=0.2)

# 3 - Change the position argument to posn_d
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = posn_d)

# 4 - Use posn_d as position and adjust alpha to 0.6
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar(position = posn_d, alpha=0.6)

# A basic histogram, add coloring defined by cyl
ggplot(mtcars, aes(mpg, fill=cyl)) +
  geom_histogram(binwidth = 1)

# Change position to identity
ggplot(mtcars, aes(mpg, fill=cyl)) +
  geom_histogram(binwidth = 1, position="identity")

# Change geom to freqpoly (position is identity by default)
ggplot(mtcars, aes(mpg,col=cyl)) +
  geom_freqpoly(binwidth=1)

# Example of how to use a brewed color palette
ggplot(mtcars, aes(x = cyl, fill = am)) +
  geom_bar() +
  scale_fill_brewer(palette = "Set1")

# Use str() on Vocab to check out the structure
str(Vocab)

# Plot education on x and vocabulary on fill
# Use the default brewed color palette
ggplot(Vocab, aes(x=education,fill=vocabulary))+
  geom_bar(position= "fill") + 
  scale_fill_brewer()

# Final plot of last exercise
ggplot(Vocab, aes(x = education, fill = vocabulary)) +
  geom_bar(position = "fill") +
  scale_fill_brewer()

# Definition of a set of blue colors
blues <- brewer.pal(9, "Blues") # from the RColorBrewer package

# 1 - Make a color range using colorRampPalette() and the set of blues
blue_range <- colorRampPalette(blues)

# 2 - Use blue_range to adjust the color of the bars, use scale_fill_manual()
ggplot(Vocab, aes(x = education, fill = vocabulary)) +
  geom_bar(position = "fill") +
  scale_fill_manual(values=blue_range(11))

# 1 - Basic histogram plot command
ggplot(mtcars, aes(mpg)) +
  geom_histogram(binwidth = 1)

# 2 - Plot 1, Expand aesthetics: am onto fill
ggplot(mtcars, aes(mpg, fill=am)) +
  geom_histogram(binwidth = 1, position="stack")

# 3 - Plot 2, change position = "dodge"
ggplot(mtcars, aes(mpg, fill=am)) +
  geom_histogram(binwidth = 1, position="dodge")

# 4 - Plot 3, change position = "fill"
ggplot(mtcars, aes(mpg, fill=am)) +
  geom_histogram(binwidth = 1, position="fill")

# 5 - Plot 4, plus change position = "identity" and alpha = 0.4
ggplot(mtcars, aes(mpg, fill=am)) +
  geom_histogram(binwidth = 1, position="identity", alpha=0.4)

# 6 - Plot 5, plus change mapping: cyl onto fill
ggplot(mtcars, aes(mpg, fill=cyl)) +
  geom_histogram(binwidth = 1, position="identity", alpha=0.4)

# Print out head of economics
head(economics)

# Plot unemploy as a function of date using a line plot
ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line()

# Adjust plot to represent the fraction of total population that is unemployed
ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_line()

# Basic line plot
ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_line()

# Expand the following command with geom_rect() to draw the recess periods
ggplot(economics, aes(x = date, y = unemploy/pop)) +
  geom_rect(data = recess, aes(xmin = begin, xmax = end, ymin = -Inf, ymax = +Inf), 
  inherit.aes =  FALSE, fill = "red", alpha = 0.2) + geom_line()

# Check the structure as a starting point
str(fish.species)

# Use gather to go from fish.species to fish.tidy
fish.tidy <- gather(fish.species, key="Species",value="Capture", -Year)

# Recreate the plot shown on the right
ggplot(fish.tidy, aes(x = Year, y = Capture, col=Species)) +
geom_line()

