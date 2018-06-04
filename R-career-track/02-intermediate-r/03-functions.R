# Consult the documentation on the mean() function
?mean

# Inspect the arguments of the mean() function
args(mean)

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views
avg_li <- mean(linkedin)
avg_fb <- mean(facebook)

# Inspect avg_li and avg_fb
avg_li
avg_fb

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_sum <- mean(linkedin+facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin+facebook, trim= 0.2)

# Inspect both new variables
avg_sum_trimmed
avg_sum

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Basic average of linkedin
mean(linkedin)

# Advanced average of linkedin
mean(linkedin, na.rm = TRUE)

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Calculate the mean absolute deviation
mean(abs(linkedin - facebook), na.rm = TRUE)

# Create a function pow_two()
pow_two <- function(x) {
  x^2
}


# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(a,b){
  abs(a)+abs(b)
}


# Use the function
sum_abs(-2,3)

# Define the function hello()

hello <- function(){
  print("Hi there!")
  return(TRUE)
}



# Call the function hello()
hello()

# Finish the pow_two() function
pow_two <- function(x, print_info=TRUE) {
  y <- x ^ 2
  if (print_info == TRUE){
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}

pow_two(5, FALSE)

# The linkedin and facebook vectors have already been created for you

# Define the interpret function
interpret <- function(num_views) {
  if (num_views > 15) {
 print("You're popular!")
 return(num_views)
  } else {
print("Try to be more visible!")
return(0)
  }
}

interpret(linkedin[1])
interpret(facebook[2])

# Call the interpret function twice

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# The interpret() can be used inside interpret_all()
interpret <- function(num_views) {
  if (num_views > 15) {
    print("You're popular!")
    return(num_views)
  } else {
    print("Try to be more visible!")
    return(0)
  }
}

# Define the interpret_all() function
# views: vector with data to interpret
# return_sum: return total number of views on popular days?

interpret_all <- function(views, return_sum=TRUE) {
  count <- 0

  for (v in views) {
count <- count + interpret(v)
  }

  if (return_sum == TRUE) {
return(count)
  } else {
return(NULL)
  }
}

# Call the interpret_all() function on both linkedin and facebook

interpret_all(linkedin)
interpret_all(facebook)

# Load the ggplot2 package
library(ggplot2)

# Retry the qplot() function
qplot(mtcars$wt, mtcars$hp)

# Check out the currently attached packages again
search()
