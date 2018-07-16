# 1 - Map mpg to x and cyl to y
ggplot(mtcars, aes(x = mpg, y = cyl)) +
  geom_point()

# 2 - Reverse: Map cyl to x and mpg to y
ggplot(mtcars, aes(x = cyl, y = mpg)) +
  geom_point()

# 3 - Map wt to x, mpg to y and cyl to col
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point()

# Change shape and size of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)

# am and cyl are factors, wt is numeric
class(mtcars$am)
class(mtcars$cyl)
class(mtcars$wt)

# Given from the previous exercise
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)

# 1 - Map cyl to fill
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 1, size = 4)

# 2 - Change shape and alpha of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 21, size = 4, alpha = 0.6)
  
# 3 - Map am to col in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl, col = am)) +
  geom_point(shape = 21, size = 4, alpha = 0.6)

# Map cyl to size
ggplot(mtcars, aes(x=wt,y=mpg,size=cyl)) +
geom_point()

# Map cyl to alpha
ggplot(mtcars, aes(x=wt,y=mpg,alpha=cyl)) +
geom_point()

# Map cyl to shape 
ggplot(mtcars, aes(x=wt,y=mpg,shape=cyl)) +
geom_point()

# Map cyl to label
ggplot(mtcars, aes(x=wt,y=mpg,label=cyl)) +
geom_text()

# Define a hexadecimal color
my_color <- "#4ABEFF"

# Set the color aesthetic 
ggplot(mtcars, aes(x = wt, y = mpg, color = cyl)) +
  geom_point()

# Set the color aesthetic and attribute 
ggplot(mtcars, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(color = my_color)

# Set the fill aesthetic and color, size and shape attributes
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(size = 10, shape = 23, color = my_color)

# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(alpha = 0.5)

# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point(shape = 24, color = 'yellow')

# Expand to draw text with label rownames(mtcars) and color red
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_text(label = rownames(mtcars), color = 'red')

# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(mtcars,aes(x=mpg, y=qsec, col=factor(cyl)))+
geom_point()

# Add mapping: factor(am) onto shape
ggplot(mtcars,aes(x=mpg, y=qsec, col=factor(cyl), shape=factor(am)))+
geom_point()

# Add mapping: (hp/wt) onto size
ggplot(mtcars,aes(x=mpg, y=qsec, col=factor(cyl), shape=factor(am), size=(hp/wt)))+
geom_point()

# The base layer, cyl.am, is available for you
# Add geom (position = "stack" by default)
cyl.am + 
  geom_bar(position="stack")

# Fill - show proportion
cyl.am + 
  geom_bar(position = "fill")  

# Dodging - principles of similarity and proximity
cyl.am +
  geom_bar(position = "dodge") 

# Clean up the axes with scale_ functions
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am +
  geom_bar(position = "dodge") +
  scale_x_discrete("Cylinders") + 
  scale_y_continuous("Number") +
  scale_fill_manual("Transmission", 
                    values = val,
                    labels = lab) 

# 1 - Create jittered plot of mtcars, mpg onto x, 0 onto y
ggplot(mtcars, aes(x = mpg, y = 0)) +
  geom_jitter()

# 2 - Add function to change y axis limits
ggplot(mtcars, aes(x = mpg, y = 0)) +
  geom_jitter()+
  scale_y_continuous(limits=c(-2,2))

# Basic scatter plot: wt on x-axis and mpg on y-axis; map cyl to col
ggplot(mtcars, aes(x=wt, y=mpg, col=cyl)) +
geom_point(size=4)

# Hollow circles - an improvement
ggplot(mtcars, aes(x=wt, y=mpg, col=cyl)) +
geom_point(size=4, shape=1)

# Add transparency - very nice
ggplot(mtcars, aes(x=wt, y=mpg, col=cyl)) +
geom_point(size=4, shape=1, alpha=0.6)

# Scatter plot: carat (x), price (y), clarity (color)
ggplot(diamonds, aes(x=carat,y=price,col=clarity)) + 
geom_point()

# Adjust for overplotting
ggplot(diamonds, aes(x=carat,y=price,col=clarity)) + 
geom_point(alpha=0.5)

# Scatter plot: clarity (x), carat (y), price (color)
ggplot(diamonds, aes(x=clarity,y=carat,col=price)) + 
geom_point(alpha=0.5)

# Dot plot with jittering
ggplot(diamonds, aes(x=clarity,y=carat,col=price)) + 
geom_point(position="jitter", alpha=0.5)

