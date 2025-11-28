#DSA LAB 2



# Q1. Import the airquality dataset and check its structure using str().
print("1. Structure of airquality:")
str(airquality)


# Q2.Find the number of missing values in airquality.
print("2. Total number of missing values in airquality:")
total_missing <- sum(is.na(airquality))

cat("Total Missing Values (NAs):", total_missing, "\n")


# Q3. Use summary() on the mtcars dataset and interpret the output.
print("3. Summary of mtcars:")
summary(mtcars)


# Q4. Find the mean horsepower (hp) in the mtcars dataset.
print("4. Mean Horsepower (hp) in mtcars:")
mean_hp <- mean(mtcars$hp)

cat("Mean Horsepower (hp):", mean_hp, "\n")


# Q5. Group the iris dataset by species and calculate the average Sepal.Width.
# This task requires the 'dplyr' package for easy grouping and summarizing.
# Install it first if you haven't: install.packages("dplyr")

# Load the required package
library(dplyr)

print("5. Average Sepal.Width grouped by Species:")
average_sepal_width <- iris %>%
  group_by(Species) %>%
  summarise(
    Avg_Sepal.Width = mean(Sepal.Width)
  )

print(average_sepal_width)