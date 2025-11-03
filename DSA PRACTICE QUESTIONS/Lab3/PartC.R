data(mtcars)

# Q1. Construct a 95% confidence interval for the mean of mpg.
# Run the t-test on the mpg column
ci_mpg_t_test <- t.test(mtcars$mpg, conf.level = 0.95)

# Print the result
print(ci_mpg_t_test)

cat("\n--- Result 1: 95% CI for mean(mpg) ---\n")
cat("Confidence Interval: ", ci_mpg_t_test$conf.int[1], "to", ci_mpg_t_test$conf.int[2], "\n")
cat("Sample Mean: ", ci_mpg_t_test$estimate, "\n\n")



# Q2. Use bootstrapping (boot package) to estimate CI for hp (horsepower).
install.packages("boot")
library(boot)

mean_stat <- function(data, indices) {
  d <- data[indices, ]
  return(mean(d$hp))
}

set.seed(42) 
boot_results_hp <- boot(data = mtcars, statistic = mean_stat, R = 5000)

ci_hp_bootstrap <- boot.ci(boot_results_hp, type = c("perc", "bca"))

# Print the results
cat("\n--- Result 2: Bootstrap CI for mean(hp) ---\n")
print(ci_hp_bootstrap)

cat("\nSummary of Bootstrap CI (95%):\n")
cat("Percentile CI: ", ci_hp_bootstrap$percent[4], "to", ci_hp_bootstrap$percent[5], "\n")
cat("BCa CI: ", ci_hp_bootstrap$bca[4], "to", ci_hp_bootstrap$bca[5], "\n\n")


# Q3. Compare confidence intervals of mpg for automatic vs manual cars (am variable).
mtcars$am_factor <- factor(mtcars$am, labels = c("Automatic", "Manual"))

ci_diff_t_test <- t.test(mpg ~ am_factor, data = mtcars, conf.level = 0.95)

cat("\n--- Result 3A: 95% CI for the Difference in Means (Automatic - Manual) ---\n")
print(ci_diff_t_test)
cat("CI for Mean Difference: ", ci_diff_t_test$conf.int[1], "to", ci_diff_t_test$conf.int[2], "\n\n")

