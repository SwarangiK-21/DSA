#DSA LAB 8


# Q1. Build a regression model predicting Petal.Length from Sepal.Length in iris.
print("1. Simple Linear Regression: Petal.Length ~ Sepal.Length")

# Build the model using the lm() function
model_Q1 <- lm(Petal.Length ~ Sepal.Length, data = iris)

# Display the model summary
summary(model_Q1)

# Q2. Create a multiple regression model predicting mpg using wt, hp, and drat in mtcars.
print("2. Multiple Linear Regression: mpg ~ wt + hp + drat")

# Build the model
model_Q2 <- lm(mpg ~ wt + hp + drat, data = mtcars)

# Display the model summary
summary(model_Q2)


# Q3. Check the R² and Adjusted R² of the model in Q2.
print("3. R-squared and Adjusted R-squared for Model Q2:")

# Get the full summary of the model
summary_Q2 <- summary(model_Q2)

# Extract R-squared and Adjusted R-squared
R_squared <- summary_Q2$r.squared
Adjusted_R_squared <- summary_Q2$adj.r.squared

cat("R-squared:", R_squared, "\n")
cat("Adjusted R-squared:", Adjusted_R_squared, "\n")


# Q4. Plot residuals of your regression model in Q1 and interpret the result.
print("4. Plotting Residuals for Model Q1 and Interpretation:")


plot(model_Q1)


# Q5. Build a regression model predicting Ozone using Temp from the airquality dataset.
print("5. Simple Linear Regression: Ozone ~ Temp (Handling NAs)")

model_Q5 <- lm(Ozone ~ Temp, data = airquality, na.action = na.omit)

# Display the model summary
summary(model_Q5)