#DSA LAB 6


# Q1. Create a histogram of mpg from the mtcars dataset.
print("1. Generating Histogram of mpg...")
hist(mtcars$mpg,
     main = "Histogram of Miles Per Gallon (mpg)",
     xlab = "Miles Per Gallon (mpg)",
     col = "darkblue",
     border = "white")


# Q2. Generate a scatterplot of hp vs wt from mtcars.
print("2. Generating Scatterplot of Horsepower (hp) vs. Weight (wt)...")
plot(mtcars$wt, mtcars$hp,
     main = "Scatterplot: Horsepower vs. Weight",
     xlab = "Weight (wt, in 1000 lbs)",
     ylab = "Horsepower (hp)",
     pch = 16, # Solid circle points
     col = "red")


# Q3. Draw a boxplot of Ozone values from the airquality dataset.
print("3. Generating Boxplot for Ozone...")
boxplot(airquality$Ozone,
        main = "Boxplot of Ozone Levels",
        ylab = "Ozone (parts per billion)",
        col = "lightgreen",
        notch = TRUE)


# Q4. Find the correlation between Sepal.Length and Sepal.Width in iris.
print("4. Correlation between Sepal.Length and Sepal.Width:")
correlation_value <- cor(iris$Sepal.Length, iris$Sepal.Width)

cat("Pearson Correlation Coefficient:", correlation_value, "\n")


# Q5. Create a pair plot of the first four columns of mtcars.
print("5. Generating Pair Plot of the first four mtcars columns...")

# Select the first four columns (mpg, cyl, disp, hp)
mtcars_subset <- mtcars[, 1:4]

# The pairs() function creates a matrix of scatterplots
pairs(mtcars_subset,
      main = "Pair Plot of mtcars: mpg, cyl, disp, hp",
      pch = 20,
      col = "blue")
