#DSA LAB 5

install.packages("dplyr")
install.packages("fastDummies")


library(dplyr)
library(fastDummies)

# Q1. Perform binning on Sepal.Length from iris into categories: Short, Medium, Long.
print("1. Binning Sepal.Length into Short, Medium, Long:")

breaks <- quantile(iris$Sepal.Length, probs = c(0, 1/3, 2/3, 1))

# Create the binned variable using the cut() function
iris$Sepal.Length_Binned <- cut(
  iris$Sepal.Length,
  breaks = breaks,
  labels = c("Short", "Medium", "Long"),
  include.lowest = TRUE
)

# Display the frequency of the new bins
print(table(iris$Sepal.Length_Binned))


# Q2. Convert Species column in iris into dummy variables 
print("2. One-Hot Encoding the Species column:")

# Use the dummy_cols function from the fastDummies package
iris_encoded <- dummy_cols(
  iris,
  select_columns = "Species",
  remove_first_dummy = FALSE, # Keep all three dummies for full encoding
  remove_selected_columns = TRUE # Remove the original Species column
)

# Display the head of the new encoded columns
print("New One-Hot Encoded Columns:")
head(iris_encoded[, c("Species_setosa", "Species_versicolor", "Species_virginica")], 3)


# Q3. Normalize the mpg column in mtcars dataset (Min-Max Normalization).
print("3. Normalize the mpg column (Min-Max Scaling):")

# Min-Max Normalization formula: (x - min(x)) / (max(x) - min(x))
min_mpg <- min(mtcars$mpg)
max_mpg <- max(mtcars$mpg)

mtcars$mpg_normalized <- (mtcars$mpg - min_mpg) / (max_mpg - min_mpg)

# Check the range of the new column (should be 0 to 1)
cat("Range of Normalized MPG:", range(mtcars$mpg_normalized), "\n")


# Q4. Standardize the Sepal.Width column in iris (Z-score Standardization).
print("4. Standardize the Sepal.Width column (Z-score):")

iris$Sepal.Width_standardized <- scale(iris$Sepal.Width)

# Check the mean and standard deviation of the new column (should be close to 0 and 1)
cat("Mean of Standardized Sepal.Width:", mean(iris$Sepal.Width_standardized), "\n")
cat("SD of Standardized Sepal.Width:", sd(iris$Sepal.Width_standardized), "\n")


# Q5. Create a new feature in mtcars: efficiency = mpg / hp.
print("5. Create new feature: efficiency = mpg / hp:")

# Feature engineering by simple division
mtcars$efficiency <- mtcars$mpg / mtcars$hp

# Display the new feature for the first few rows
print("First 5 rows with new 'efficiency' feature:")
head(mtcars[, c("mpg", "hp", "efficiency")], 5)