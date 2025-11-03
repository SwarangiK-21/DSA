library(ggplot2)
library(dplyr)
library(tidyr) 


#Q1.1. Using the Titanic dataset: Create a boxplot of Fare and visually identify potential outliers.
 ggplot(train_titanic, aes(y = fare)) +
  geom_boxplot(fill = "#1F77B4", color = "black") +
  labs(
    title = "Boxplot of Passenger Fare",
    y = "Fare Paid"
  ) +
  theme_minimal()

#Q1.2 Using the Titanic dataset:Create a boxplot of Age separated by Survived (use boxplot(Age ~ Survived, data=Titanic) in R).
boxplot(age ~ factor(survived, labels = c("Not Survived", "Survived")),
        data = train_titanic,
        main = "Age Distribution by Survival Status",
        xlab = "Survival Status",
        ylab = "Age")

#Q2.1 Using the Facebook dataset:Create a boxplot of Likes and identify extreme posts.
ggplot(dataset_Facebook, aes(y = like)) +
  geom_boxplot(fill = "#FF7F0E", color = "black") +
  labs(
    title = "Boxplot of Post Likes",
    y = "Number of Likes"
  ) +
  theme_minimal()

#Q2.2 Using the Facebook dataset:Draw a combined boxplot of Likes, Shares, and Comments side by side.
# Step 1: Prepare the data by selecting the three columns and pivoting
facebook_long <- dataset_Facebook %>%
  select(like, share, comment) %>%
  
  pivot_longer(
    cols = c(like, share, comment),
    names_to = "Metric",
    values_to = "Count"
  )

# Step 2: Plot the combined boxplot
ggplot(facebook_long, aes(x = Metric, y = Count, fill = Metric)) +
  geom_boxplot() +
  labs(
    title = "Comparison of Post Interactions (Likes, Shares, Comments)",
    x = "Metric Type",
    y = "Count"
  ) +
  scale_fill_manual(values = c("#2CA02C", "#D62728", "#9467BD")) + # Custom colors
  theme_minimal()


