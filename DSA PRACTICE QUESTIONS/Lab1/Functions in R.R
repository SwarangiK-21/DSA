# 1. Write a function add_numbers(a, b) to return the sum of two numbers.
add_numbers <- function(a, b) {
  return(a + b)
}
# Example usage:
# print(add_numbers(5, 12))

# 2. Write a function square(n) to return the square of a number.
square <- function(n) {
  return(n * n)
}
# Example usage:
# print(square(7))

# 3. Write a function to calculate the factorial of a number using recursion.
factorial_recursive <- function(n) {
  # Base condition: Factorial of 0 or 1 is 1
  if (n <= 1) {
    return(1)
  } else {
    # Recursive step: n * factorial(n-1)
    return(n * factorial_recursive(n - 1))
  }
}

# Example usage:
# print(factorial_recursive(5)) # Output: 120

# 4. Write a function to check if a number is prime.
is_prime <- function(n) {
  if (n <= 1) {
    return(FALSE)
  }
  
  # Check divisibility from 2 up to the square root of n
  for (i in 2:sqrt(n)) {
    if (n %% i == 0) {
      return(FALSE)
    }
  }
  return(TRUE)
}

# Example usage:
# print(is_prime(17)) # TRUE
# print(is_prime(15)) # FALSE

# 5. Write a function that takes a vector and returns: Mean, Median, Standard Deviation.
vector_stats <- function(vec) {
  stats <- list(
    Mean = mean(vec),
    Median = median(vec),
    Standard_Deviation = sd(vec)
  )
  return(stats)
}

# Example usage:
# data_vector <- c(10, 15, 20, 25, 30)
# print(vector_stats(data_vector))

# 6. Write a function that accepts a data frame and a column name, 
#    and returns the top 5 highest values in that column.
top_5_values <- function(df, column_name) {
  # Get the column data using the column name (as a string)
  column_data <- df[[column_name]]
  
  # Sort the column data in descending order
  sorted_data <- sort(column_data, decreasing = TRUE)
  
  return(head(sorted_data, 5)) 
}

# Example usage:
# Create a sample data frame:
# sample_df <- data.frame(ID = 1:10, Score = c(88, 92, 75, 99, 81, 60, 95, 70, 85, 90))
# print(top_5_values(sample_df, "Score"))