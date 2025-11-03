install.packages("moments")
library(ggplot2)
library(moments) 
library(dplyr)

data(mtcars)

#Q1.Calculate mean, median, mode, variance, standard deviation, and range of the mpg column.
mpg_stats <- data.frame(
  Metric = c("Mean", "Median", "Mode", "Variance", "Standard Deviation", "Min", "Max", "Range"),
  Value = c(
    mean(mtcars$mpg),
    median(mtcars$mpg),
    mode(mtcars$mpg),
    var(mtcars$mpg),
    sd(mtcars$mpg),
    min(mtcars$mpg),
    max(mtcars$mpg),
    max(mtcars$mpg) - min(mtcars$mpg) # Range
  )
)

print(mpg_stats)


#Q2.Create a frequency table of the number of cylinders (cyl).
cylinder_frequency <- table(mtcars$cyl)

print("Frequency Table for Number of Cylinders:")
print(cylinder_frequency)


#Q3.Generate a histogram of mpg and overlay a density curve.
ggplot(mtcars, aes(x = mpg)) +
  # Histogram layer
  geom_histogram(aes(y = after_stat(density)),
                 bins = 8, # Adjust bins for better visualization
                 fill = "#0072B2", # Blue fill
                 color = "black") +
  # Density curve layer
  geom_density(color = "#D55E00", linewidth = 1.2) + # Orange line
  labs(
    title = "Distribution of Miles Per Gallon (mpg)",
    x = "Miles Per Gallon (mpg)",
    y = "Density"
  ) +
  theme_minimal()


#Q4.Create a boxplot of mpg by cyl and interpret the spread.
ggplot(mtcars, aes(x = factor(cyl), y = mpg, fill = factor(cyl))) +
  geom_boxplot() +
  labs(
    title = "MPG Distribution by Number of Cylinders",
    x = "Number of Cylinders (cyl)",
    y = "Miles Per Gallon (mpg)",
    fill = "Cylinders"
  ) +
  theme_minimal()


#Q5.Use summary() to produce a descriptive statistics report of the dataset.
# The built-in summary function
print("Descriptive Statistics Report for mtcars:")
summary(mtcars)