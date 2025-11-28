#DSA LAB 1

data(mtcars)
data(iris)
data(airquality)

# Q1. Display the first 15 rows of the mtcars dataset.
print("1. First 15 rows of mtcars:")
head(mtcars, 15)

# Q2. Find the maximum and minimum value of Sepal.Length from iris.
print("2. Max and Min of Sepal.Length in iris:")
max_sepal_length <- max(iris$Sepal.Length)
min_sepal_length <- min(iris$Sepal.Length)

cat("Maximum Sepal.Length:", max_sepal_length, "\n")
cat("Minimum Sepal.Length:", min_sepal_length, "\n")


# Q3. Calculate the mean of the variable mpg in mtcars.
print("3. Mean of mpg in mtcars:")
mean_mpg <- mean(mtcars$mpg)

cat("Mean MPG:", mean_mpg, "\n")

# Q4. Display the structure of the airquality dataset.
print("4. Structure of airquality:")
str(airquality)

# Q5. Check whether the number 100 is greater than 50 in R.
print("5. Check if 100 > 50:")
is_100_greater_than_50 <- 100 > 50

cat("Is 100 greater than 50? ", is_100_greater_than_50, "\n")









