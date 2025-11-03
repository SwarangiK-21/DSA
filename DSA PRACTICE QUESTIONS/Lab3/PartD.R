data(iris)

data(mtcars)

train_titanic <- read.csv("train_titanic.csv")

# Q1. One-Sample t-test: Sepal.Length vs 5.5

cat("\n--- 1. One-Sample t-test: Sepal.Length vs 5.5 ---\n")

# H0: mean(Sepal.Length) = 5.5
# Ha: mean(Sepal.Length) != 5.5
t_test_one_sample <- t.test(iris$Sepal.Length, mu = 5.5)

print(t_test_one_sample)

cat("\nInterpretation:\n")
if (t_test_one_sample$p.value < 0.05) {
  cat("The p-value is < 0.05. We reject the null hypothesis.\n")
  cat("The mean Sepal.Length (", round(t_test_one_sample$estimate, 3), ") is significantly different from 5.5.\n")
} else {
  cat("The p-value is > 0.05. We fail to reject the null hypothesis.\n")
  cat("The mean Sepal.Length is NOT significantly different from 5.5.\n")
}



# 2. Two-Sample t-test: mpg (Automatic vs Manual)

cat("\n\n--- 2. Two-Sample t-test: mpg (Automatic vs Manual) ---\n")

mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))

# H0: mean(mpg_Automatic) = mean(mpg_Manual)
# Ha: mean(mpg_Automatic) != mean(mpg_Manual)

t_test_two_sample <- t.test(mpg ~ am, data = mtcars)

print(t_test_two_sample)

cat("\nInterpretation:\n")
if (t_test_two_sample$p.value < 0.05) {
  cat("The p-value is < 0.05. We reject the null hypothesis.\n")
  cat("There is a significant difference in mpg between automatic and manual cars.\n")
} else {
  cat("The p-value is > 0.05. We fail to reject the null hypothesis.\n")
  cat("There is no significant difference in mpg between automatic and manual cars.\n")
}



# 3. Chi-Square Test of Independence: Survived and Sex (Titanic)(ERROR)

cat("\n\n--- 3. Chi-Square Test of Independence: Survived and Sex ---\n")

# H0: Survived and Sex are independent.
# Ha: Survived and Sex are dependent (related).

# Create a contingency table (cross-tabulation) of the two variables
contingency_table <- table(train_titanic$Survived, train_titanic$Sex)
colnames(contingency_table) <- c("Female", "Male")
rownames(contingency_table) <- c("Did Not Survive", "Survived")
print(contingency_table)

# Perform the Chi-square test
chi_square_test <- chisq.test(contingency_table)

print(chi_square_test)

cat("\nInterpretation:\n")
if (chi_square_test$p.value < 0.05) {
  cat("The p-value is < 0.05. We reject the null hypothesis.\n")
  cat("Survived and Sex are significantly dependent (related).\n")
} else {
  cat("The p-value is > 0.05. We fail to reject the null hypothesis.\n")
  cat("Survived and Sex are independent.\n")
}

# 4. One-Way ANOVA: Compare Sepal.Length means across 3 iris species
cat("\n\n--- 4. One-Way ANOVA: Sepal.Length by Species ---\n")

# H0: mean(Setosa) = mean(Versicolor) = mean(Virginica)
# Ha: At least one species mean is different.

# Create the ANOVA model
aov_model <- aov(Sepal.Length ~ Species, data = iris)

# Print the ANOVA table (Summary of the model)
aov_summary <- summary(aov_model)
print(aov_summary)

cat("\nInterpretation:\n")
if (aov_summary[[1]]$'Pr(>F)'[1] < 0.05) {
  cat("The ANOVA p-value is < 0.05. We reject the null hypothesis.\n")
  cat("There is a statistically significant difference in the mean Sepal.Length among the three iris species.\n")
} else {
  cat("The ANOVA p-value is > 0.05. We fail to reject the null hypothesis.\n")
  cat("There is no statistically significant difference in the mean Sepal.Length among the three iris species.\n")
}

# Q5. Post-hoc Tukey HSD Test

cat("\n\n--- 5. Post-hoc Tukey HSD Test ---\n")

tukey_hsd_results <- TukeyHSD(aov_model)

print(tukey_hsd_results)

cat("\nInterpretation of Tukey HSD:\n")
cat("The 'diff' column shows the difference in means between the two groups.\n")
cat("The 'p adj' column is the adjusted p-value for the pairwise comparison.\n")
cat("If 'p adj' is < 0.05, the difference between that pair of species is statistically significant.\n")
cat("\n")

# Loop through the results to provide a specific interpretation
for (i in 1:nrow(tukey_hsd_results$Species)) {
  comparison <- rownames(tukey_hsd_results$Species)[i]
  p_value <- tukey_hsd_results$Species[i, "p adj"]
  mean_diff <- tukey_hsd_results$Species[i, "diff"]
  
  if (p_value < 0.05) {
    cat(paste0("   - ", comparison, ": SIGNIFICANT (Difference: ", round(mean_diff, 3), ", p-value: ", round(p_value, 5), ").\n"))
  } else {
    cat(paste0("   - ", comparison, ": NOT significant (Difference: ", round(mean_diff, 3), ", p-value: ", round(p_value, 5), ").\n"))
  }
}