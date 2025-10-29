#DSA LAB 7 


# Q1. Perform a one-sample t-test to check if the mean mpg in mtcars differs from 20.
print("1. One-Sample t-test for mtcars mean mpg vs. 20:")

# t.test(x, mu = value)
t_test_result_1 <- t.test(mtcars$mpg, mu = 20)
print(t_test_result_1)


# Q2. Compare Petal.Width across species in iris using ANOVA.
print("2. ANOVA to compare Petal.Width across iris Species:")

anova_model <- aov(Petal.Width ~ Species, data = iris)

# Display the ANOVA table summary
anova_summary <- summary(anova_model)
print(anova_summary)


# Q3. Find the correlation between mpg and hp in mtcars.
print("3. Correlation between mpg and hp in mtcars:")

# cor() calculates Pearson correlation by default
correlation_mpg_hp <- cor(mtcars$mpg, mtcars$hp)

cat("Correlation (r):", correlation_mpg_hp, "\n")


# Q4. Perform a paired t-test on Sepal.Length and Sepal.Width in iris.
print("4. Paired t-test for Sepal.Length and Sepal.Width:")

t_test_result_2 <- t.test(iris$Sepal.Length, iris$Sepal.Width, paired = TRUE)
print(t_test_result_2)


# Q5. Check if Ozone and Temp in airquality are significantly correlated.
print("5. Correlation test between Ozone and Temp in airquality:")

correlation_test_result <- cor.test(airquality$Ozone, airquality$Temp, method = "pearson", use = "complete.obs")
print(correlation_test_result)

