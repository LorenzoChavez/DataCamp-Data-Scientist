# Define ratio() function
ratio <- function(x, y) {
  x/y
}

# Call ratio() with arguments 3 and 4
ratio(3,4)


# Rewrite the call to follow best practices
mean(c(1:9, NA), trim = 0.1, na.rm= TRUE)


# 2nd element in tricky_list
typeof(tricky_list[[2]])

# Element called x in tricky_list
typeof(tricky_list[["x"]])

# 2nd element inside the element called x in tricky_list
typeof(tricky_list[["x"]][[2]])


# Guess where the regression model is stored
names(tricky_list)

# Use names() and str() on the model element
names(tricky_list[["model"]])
str(tricky_list[["model"]])

# Subset the coefficients element
tricky_list[["model"]][["coefficients"]]

# Subset the wt element
tricky_list[["model"]][["coefficients"]][["wt"]]


# Replace the 1:ncol(df) sequence
for (i in seq_along(df)) {
  print(median(df[[i]]))
}

# Change the value of df
df <- data.frame()

# Repeat for loop to verify there is no error
for (i in seq_along(df)) {
  print(median(df[[i]]))
}

# Create new double vector: output
output <- vector("double", ncol(df))

# Alter the loop
for (i in seq_along(df)) {
  # Change code to store result in output
  output[[i]] <- median(df[[i]])
}

# Print output
print(output)
