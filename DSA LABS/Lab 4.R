#DSA LAB 4

data(iris)
data(mtcars)
data(airquality)


# Q1. Calculate the mean, median, mode, and standard deviation of Petal.Width from iris.

print("1. Descriptive Statistics for Petal.Width:")

# Mean
mean_pw <- mean(iris$Petal.Width)
cat("Mean (Average):", mean_pw, "\n")

# Median
median_pw <- median(iris$Petal.Width)
cat("Median (Middle Value):", median_pw, "\n")

# Mode (R requires a custom function or table usage)
get_mode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
mode_pw <- get_mode(iris$Petal.Width)
cat("Mode (Most Frequent):", mode_pw, "\n")

# Standard Deviation
sd_pw <- sd(iris$Petal.Width)
cat("Standard Deviation (Spread):", sd_pw, "\n")


# Q2. Draw a histogram of mpg from the mtcars dataset.
print("2. Generating Histogram of mpg...")
hist(mtcars$mpg,
     main = "Histogram of Miles Per Gallon (mpg)", # Title of the plot
     xlab = "Miles Per Gallon (mpg)",             # X-axis label
     col = "skyblue",                             # Bar color
     border = "black")                            # Border color

# Q3. Create a scatterplot of hp vs mpg from mtcars.
print("3. Generating Scatterplot of hp vs mpg...")
plot(mtcars$hp, mtcars$mpg,
     main = "Scatterplot: Horsepower vs. MPG", # Title
     xlab = "Horsepower (hp)",                 # X-axis
     ylab = "Miles Per Gallon (mpg)",          # Y-axis
     pch = 19,                                 # Plotting symbol (solid circle)
     col = "red")                              # Point color



# Q4. Generate a boxplot for Ozone in the airquality dataset.
print("4. Generating Boxplot for Ozone...")
boxplot(airquality$Ozone,
        main = "Boxplot of Ozone Levels",
        ylab = "Ozone (parts per billion)",
        col = "lightgreen",
        border = "darkgreen",
        notch = TRUE) 

# Q5. Find the variance of Sepal.Width in the iris dataset.
print("5. Variance of Sepal.Width:")
variance_sw <- var(iris$Sepal.Width)

cat("Variance of Sepal.Width:", variance_sw, "\n")