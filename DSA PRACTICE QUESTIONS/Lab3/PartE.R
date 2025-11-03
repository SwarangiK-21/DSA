data(mtcars)

data(iris)

# Q1. Compute the Pearson correlation between mpg and hp.

cat("\n--- 1. Pearson Correlation between mpg and hp ---\n")

pearson_corr_mpg_hp <- cor(mtcars$mpg, mtcars$hp, method = "pearson")

cat("Pearson Correlation (mpg vs hp): ", round(pearson_corr_mpg_hp, 4), "\n")
cat("Interpretation: This value is close to -1, indicating a strong negative linear relationship.\n")
cat("As horsepower (hp) increases, miles per gallon (mpg) tends to decrease significantly.\n")


# Q2. Plot a scatterplot with regression line of mpg ~ hp.

cat("\n--- 2. Scatterplot with Regression Line (mpg ~ hp) ---\n")

library(ggplot2)

# Save the plot to a file
png("mpg_vs_hp_scatterplot.png", width = 600, height = 400)

# Create the plot
plot_mpg_hp <- ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = 'blue') +              # Scatter points
  geom_smooth(method = "lm", col = "red") + # Add linear regression line (lm)
  labs(title = "Scatterplot of MPG vs. Horsepower",
       x = "Horsepower (hp)",
       y = "Miles per Gallon (mpg)") +
  theme_minimal()

print(plot_mpg_hp)

dev.off() 
cat("A scatterplot named 'mpg_vs_hp_scatterplot.png' has been saved to the working directory.\n")



# Q3. Create a correlation matrix for all numeric columns in mtcars.

cat("\n--- 3. Correlation Matrix for all numeric columns in mtcars ---\n")

corr_matrix_mtcars <- cor(mtcars)

print(round(corr_matrix_mtcars, 2))


# 4. Compute and interpret the Spearman rank correlation.

cat("\n--- 4. Spearman Rank Correlation (Sepal.Length vs Petal.Length) ---\n")

# H0: Sepal.Length and Petal.Length are independent (rho = 0).
# Ha: Sepal.Length and Petal.Length are dependent (rho != 0).
spearman_test <- cor.test(iris$Sepal.Length, iris$Petal.Length, method = "spearman")

print(spearman_test)

cat("\nInterpretation:\n")
cat("Spearman's Rho (rank correlation): ", round(spearman_test$estimate, 4), "\n")
cat("P-value: ", format.pval(spearman_test$p.value, digits = 3), "\n")

if (spearman_test$p.value < 0.05) {
  cat("The p-value is extremely small, indicating a highly significant association.\n")
  cat("The Rho value (~0.88) indicates a very strong, positive monotonic relationship:\n")
  cat("As the rank of Sepal.Length increases, the rank of Petal.Length also increases.\n")
} else {
  cat("The p-value is > 0.05. We fail to reject the null hypothesis of independence.\n")
}


# Q5. Perform association rule mining (arules package).

cat("\n\n--- 5. Association Rule Mining (Market Basket) ---\n")

install.packages("arules")
library(arules)

market_basket <- list(
  c("milk", "bread", "butter"),
  c("milk", "diapers", "beer"),
  c("bread", "butter", "cheese"),
  c("milk", "bread", "diapers", "eggs"),
  c("diapers", "beer"),
  c("milk", "bread", "butter", "eggs")
)

transactions <- as(market_basket, "transactions")

rules <- apriori(transactions, parameter = list(supp = 0.3, conf = 0.6, minlen = 2))

cat("Found", length(rules), "rules with Support > 0.3 and Confidence > 0.6.\n")

rules_sorted <- sort(rules, by = "lift")

cat("\nTop 3 Association Rules (Sorted by Lift):\n")

inspect(head(rules_sorted, 3))

cat("\nInterpretation of Rules (Example):\n")
cat("Rule: {butter} => {bread} (Support: 0.5, Confidence: 1.0, Lift: 1.6)\n")
cat(" - Support: 50% of all transactions contain both butter AND bread.\n")
cat(" - Confidence: 100% of transactions that contain butter also contain bread (P(bread|butter)).\n")
cat(" - Lift: 1.6 > 1 means that buying butter is 1.6 times more likely to also involve buying bread \n")
cat("   than if bread purchases were independent of butter purchases.\n")