library(ggplot2)

data(iris)

#Q1.Plot a normal distribution curve with mean = mean of Sepal.Length and sd = sd of Sepal.Length.
# Calculate mean and standard deviation for Sepal.Length
mean_sl <- mean(iris$Sepal.Length)
sd_sl <- sd(iris$Sepal.Length)

# Create the plot
ggplot(iris, aes(x = Sepal.Length)) +
  
  geom_histogram(aes(y = after_stat(density)),
                 bins = 10,
                 fill = "#0072B2",
                 color = "black",
                 alpha = 0.6) +
  
  stat_function(fun = dnorm,
                args = list(mean = mean_sl, sd = sd_sl),
                color = "#D55E00",
                linewidth = 1.2) +
  labs(
    title = "Sepal.Length Distribution with Fitted Normal Curve",
    x = "Sepal Length",
    y = "Density"
  ) +
  theme_minimal()



#Q2.Perform a Shapiro–Wilk test to check if Sepal.Length follows a normal distribution.
# Perform the Shapiro-Wilk Test
shapiro_test_result <- shapiro.test(iris$Sepal.Length)

print("Shapiro-Wilk Normality Test for Sepal.Length:")
print(shapiro_test_result)

# Interpretation
cat("\nInterpretation:\n")
if (shapiro_test_result$p.value > 0.05) {
  cat(paste0("Since the p-value (", round(shapiro_test_result$p.value, 4), ") is > 0.05, we DO NOT reject the null hypothesis.\n"))
  cat("Conclusion: Sepal.Length is likely to be normally distributed.\n")
} else {
  cat(paste0("Since the p-value (", round(shapiro_test_result$p.value, 4), ") is <= 0.05, we reject the null hypothesis.\n"))
  cat("Conclusion: Sepal.Length does NOT follow a normal distribution.\n")
}


#Q3.Simulate 1000 samples from a binomial distribution (n = 10, p = 0.5) and plot its histogram.
# Set parameters for the Binomial Distribution
n_trials <- 10  
prob_success <- 0.5 
n_samples <- 1000 

# Simulate 1000 samples from Binomial(n=10, p=0.5)
binomial_samples <- rbinom(n = n_samples, size = n_trials, prob = prob_success)

# Create a data frame for ggplot
binomial_df <- data.frame(Successes = binomial_samples)

# Plot the histogram
ggplot(binomial_df, aes(x = Successes)) +
  geom_bar(fill = "#FF7F0E", color = "black", width = 0.8) +
  labs(
    title = paste0("Simulated Binomial Distribution (n=", n_trials, ", p=", prob_success, ")"),
    x = "Number of Successes (k)",
    y = "Frequency"
  ) +
  scale_x_continuous(breaks = 0:n_trials) + # Ensure integer breaks
  theme_minimal()


#Q4.Compare the sample mean and variance with theoretical values for the binomial distribution.
# Calculate Theoretical Values
theoretical_mean <- n_trials * prob_success
theoretical_variance <- n_trials * prob_success * (1 - prob_success)

# Calculate Sample (Observed) Values
sample_mean <- mean(binomial_samples)
sample_variance <- var(binomial_samples)

# Compare the values
comparison_table <- data.frame(
  Metric = c("Mean", "Variance"),
  Theoretical = c(theoretical_mean, theoretical_variance),
  Sampled = c(sample_mean, sample_variance)
)

print("\nComparison of Theoretical vs. Sampled Binomial Statistics:")
print(comparison_table)

# Interpretation
cat("\nInterpretation:\n")
cat("The Sampled Mean and Variance are very close to the Theoretical values.\n")
cat("This demonstrates the Law of Large Numbers, where the statistics from a large sample (1000 samples) converge towards the true parameters of the distribution.\n")
