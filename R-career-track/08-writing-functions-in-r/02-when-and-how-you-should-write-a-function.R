# Define example vector x
x <- (1:10)

# Rewrite this snippet to refer to x
(x - min(x, na.rm = TRUE)) /
  (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))

# Define example vector x
x <- 1:10 

# Define rng
rng <- range(x, na.rm = TRUE)

# Rewrite this snippet to refer to the elements of rng
(x - rng[1]) / 
  (rng[2] - rng[1])


# Define example vector x
x <- 1:10 

# Use the function template to create the rescale01 function
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

# Test your function, call rescale using the vector x as the argument
rescale01(x)

# Define example vectors x and y
x <- c( 1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3,  4)

# Count how many elements are missing in both x and y
sum(is.na(x) & is.na(y))

# Define example vectors x and y
x <- c( 1, 2, NA, 3, NA)
y <- c(NA, 3, NA, 3,  4)

# Turn this snippet into a function: both_na()
both_na <- function(x, y) {
  sum(is.na(x) & is.na(y))
}


# Define x, y1 and y2
x <-  c(NA, NA, NA)
y1 <- c( 1, NA, NA)
y2 <- c( 1, NA, NA, NA)

# Call both_na on x, y1
both_na(x, y1)

# Call both_na on x, y2
both_na(x, y2)


# Rewrite mean_ci to take arguments named level and x
mean_ci <- function(level, x) {
  se <- sd(x) / sqrt(length(x))
  alpha <- 1 - level
  mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}

# Alter the arguments to mean_ci
mean_ci <- function(x, level=0.95) {
  se <- sd(x) / sqrt(length(x))
  alpha <- 1 - level
  mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}

# Alter the mean_ci function
mean_ci <- function(x, level = 0.95) {
  if (length(x) == 0) {
    warning("`x` was empty", call. = FALSE)
    return(c(-Inf, Inf))
  } else {
  se <- sd(x) / sqrt(length(x))
  alpha <- 1 - level
  mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
  }
}

# Define a numeric vector x with the values 1, 2, NA, 4 and 5
x <- c(1,2,NA,4,5)

# Call f() with the arguments x = x and y = 3
f(x=x,y=3)

# Call f() with the arguments x = x and y = 10
f(x=x, y=10)


# Rename the function f() to replace_missings()
replace_missings <- function(x, replacement) {
  # Change the name of the y argument to replacement
  x[is.na(x)] <- replacement
  cat(sum(is.na(x)), replacement, "\n")
  x
}

# Rewrite the call on df$z to match our new names
df$z <- replace_missings(df$z, 0)


replace_missings <- function(x, replacement) {
  # Define is_miss
  is_miss <- is.na(x)
  
  # Rewrite rest of function to refer to is_miss
  x[is_miss] <- replacement
  cat(sum(is_miss), replacement, "\n")
  x
}


replace_missings <- function(x, replacement) {
  is_miss <- is.na(x)
  x[is_miss] <- replacement
  
  # Rewrite to use message()
  message(sum(is_miss), " missings replaced by the value ", replacement)
  x
}

# Check your new function by running on df$z
replace_missings(df$z,0)

