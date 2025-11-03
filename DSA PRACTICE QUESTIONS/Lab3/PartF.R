install.packages("broom")
library(ggplot2)
library(dplyr)
library(broom)

data(iris)
data(mtcars)

train_titanic <- read.csv("train_titanic.csv")

# Q1. Logistic Regression (Titanic)

cat("\n--- 1. Logistic Regression (Survived ~ Age + Sex + Pclass) ---\n")

titanic_clean <- train_titanic %>%
  mutate(
    survived = factor(survived, levels = c(0, 1), labels = c("No", "Yes")),
    pclass = factor(pclass),
    sex = factor(sex),
    age = ifelse(is.na(age), median(age, na.rm = TRUE), age) 
  )

logistic_model <- glm(survived ~ age + sex + pclass, data = titanic_clean, family = binomial(link = "logit"))

summary(logistic_model)

cat("\n--- Interpretation ---\n")

odds_ratios <- exp(coef(logistic_model))

cat("Odds Ratios (OR):\n")
print(round(odds_ratios, 4))

cat("\nInterpretation Summary:\n")

# 1. Sex (Male):
sex_or <- odds_ratios["Sexmale"]
cat(sprintf("Sex (Male): OR = %.3f. Being male decreases the odds of survival by approximately %.1f%%, relative to being female (holding other factors constant).\n", 
            sex_or, (1 - sex_or) * 100))

# 2. Pclass (2nd Class):
pclass2_or <- odds_ratios["Pclass2"]
cat(sprintf("Pclass (2nd vs 1st): OR = %.3f. The odds of survival for 2nd class passengers are %.1f%% of the odds for 1st class passengers (holding other factors constant).\n", 
            pclass2_or, pclass2_or * 100))

# 3. Age:
age_or <- odds_ratios["age"]
cat(sprintf("age: OR = %.3f. For every one-year increase in age, the odds of survival change by a factor of %.3f.\n",
            age_or, age_or))
if (age_or < 1) {
  cat("   This means increasing age slightly decreases the odds of survival.\n")
} else {
  cat("   This means increasing age slightly increases the odds of survival.\n")
}

# Q2. Linear Regression (Iris)

cat("\n\n--- 2. Linear Regression (Petal.Length ~ Sepal.Length) ---\n")

linear_model <- lm(Petal.Length ~ Sepal.Length, data = iris)

summary(linear_model)

plot_line <- ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
  geom_point(color = "darkgreen") +
  geom_smooth(method = "lm", color = "red", se = TRUE) + # Add the fitted line
  labs(title = "Linear Regression: Petal Length vs. Sepal Length",
       x = "Sepal Length (cm)",
       y = "Petal Length (cm)") +
  theme_minimal()

png("iris_fitted_line_plot.png", width = 600, height = 400)
print(plot_line)
dev.off()
cat("Fitted line plot saved as 'iris_fitted_line_plot.png'.\n")

plot_residuals <- ggplot(augment(linear_model), aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Residuals vs Fitted Values Plot",
       x = "Fitted Values (Petal.Length)",
       y = "Residuals") +
  theme_minimal()

png("iris_residuals_plot.png", width = 600, height = 400)
print(plot_residuals)
dev.off()
cat("Residuals plot saved as 'iris_residuals_plot.png'.\n")

# Q3. K-Means Clustering (mtcars)

cat("\n\n--- 3. K-Means Clustering (k=3 on mpg, hp, wt) ---\n")

mtcars_scaled <- mtcars %>%
  select(mpg, hp, wt) %>%
  scale() %>% 
  as.data.frame()

set.seed(123) 
kmeans_model <- kmeans(mtcars_scaled, centers = 3, nstart = 25)

mtcars_scaled$cluster <- factor(kmeans_model$cluster)

cat("K-Means Cluster Centers (Scaled Data):\n")
print(kmeans_model$centers)

plot_clusters <- mtcars %>%
  mutate(cluster = kmeans_model$cluster) %>%
  ggplot(aes(x = mpg, y = hp, color = factor(cluster), size = wt)) +
  geom_point(alpha = 0.8) +
  labs(title = "K-Means Clustering of Cars (k=3)",
       x = "Miles per Gallon (mpg)",
       y = "Horsepower (hp)",
       color = "Cluster",
       size = "Weight (wt)") +
  scale_color_manual(values = c("1" = "#1f78b4", "2" = "#33a02c", "3" = "#e31a1c")) +
  theme_classic() +
  theme(legend.position = "right")


png("mtcars_k_means_clusters.png", width = 700, height = 500)
print(plot_clusters)
dev.off()
cat("Cluster visualization saved as 'mtcars_k_means_clusters.png'.\n")

cat("\n--- Cluster Interpretation (Based on Unscaled Means) ---\n")

cluster_summary <- mtcars %>%
  mutate(cluster = factor(kmeans_model$cluster)) %>%
  group_by(cluster) %>%
  summarise(
    N = n(),
    Mean_MPG = mean(mpg),
    Mean_HP = mean(hp),
    Mean_WT = mean(wt)
  )

print(cluster_summary)

cat("\nCluster Description:\n")
cat("Cluster 1 (e.g., Sports Cars): Low MPG, High HP, High WT.\n")
cat("Cluster 2 (e.g., Compact/Economy): High MPG, Low HP, Low WT.\n")
cat("Cluster 3 (e.g., Mid-Range/Performance): Mid-MPG, Mid-HP, Mid-WT.\n")