# Plot 1: Change the plot background fill to myPink
z +
  theme(plot.background = element_rect(fill = myPink))

# Plot 2: Adjust the border to be a black line of size 3
z +
  theme(plot.background = element_rect(fill = myPink, color="black", size=3)) # expanded from plot 1

# Theme to remove all rectangles
no_panels <- theme(rect = element_blank())

# Plot 3: Combine custom themes
z +
  no_panels +
  theme(plot.background = element_rect(fill = myPink, color="black", size=3)) # from plot 2


# Extend z using theme() function and 3 args
z +
  theme(panel.grid = element_blank(), axis.line = element_line(color = "red"), axis.ticks = element_line(color = "red"))


# Original plot, color provided
z
myRed

# Extend z with theme() function and 3 args
z +
  theme(strip.text = element_text(color = myRed, size = 16),
        axis.title = element_text(color = myRed, hjust = 0, face = "italic"),
        axis.text = element_text(color = "black"))

# Move legend by position
z +
  theme(legend.position = c(0.85, 0.85))

# Change direction
z +
  theme(legend.direction = "horizontal")
  
# Change location by name
z +
  theme(legend.position = "bottom")

# Remove legend entirely
z +
  theme(legend.position = "none")


# Increase spacing between facets
library(grid)
z + theme(panel.spacing.x = unit(2, "cm"))

# Adjust the plot margin
z + theme(panel.spacing.x = unit(2, "cm"),
          plot.margin = unit(c(1,2,1,1), "cm"))

# Original plot
z2

# Theme layer saved as an object, theme_pink
theme_pink <- theme(panel.background = element_blank(),
                    legend.key = element_blank(),
                    legend.background = element_blank(),
                    strip.background = element_blank(),
                    plot.background = element_rect(fill = myPink, color = "black", size = 3),
                    panel.grid = element_blank(),
                    axis.line = element_line(color = "red"),
                    axis.ticks = element_line(color = "red"),
                    strip.text = element_text(size = 16, color = myRed),
                    axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
                    axis.text = element_text(color = "black"),
                    legend.position = "none")
  
# 1 - Apply theme_pink to z2
z2 +
  theme_pink

# 2 - Update the default theme, and at the same time
# assign the old theme to the object old.
old <- theme_update(panel.background = element_blank(),
             legend.key = element_blank(),
             legend.background = element_blank(),
             strip.background = element_blank(),
             plot.background = element_rect(fill = myPink, color = "black", size = 3),
             panel.grid = element_blank(),
             axis.line = element_line(color = "red"),
             axis.ticks = element_line(color = "red"),
             strip.text = element_text(size = 16, color = myRed),
             axis.title.y = element_text(color = myRed, hjust = 0, face = "italic"),
             axis.title.x = element_text(color = myRed, hjust = 0, face = "italic"),
             axis.text = element_text(color = "black"),
             legend.position = "none")

# 3 - Display the plot z2 - new default theme used
z2

# 4 - Restore the old default theme
theme_set(old)

# Display the plot z2 - old theme restored
z2


# Original plot
z2

# Load ggthemes
library(ggthemes)

# Apply theme_tufte(), plot additional modifications
custom_theme <- theme_tufte() +
  theme(legend.position = c(0.9, 0.9),
        legend.title = element_text(face="italic", size=12),
        axis.title = element_text(face = "bold", size=14))

# Draw the customized plot
z2 + custom_theme
 
# Use theme set to set custom theme as default
theme_set(custom_theme)

# Plot z2 again
z2

