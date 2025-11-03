library(ggplot2)
library(dplyr)

#Q1. Draw a histogram of Age (Titanic dataset).
ggplot(train_titanic, aes(x = age)) +
  geom_histogram(binwidth = 5, fill = "#1F77B4", color = "black") +
  labs(
    title = "Distribution of Passenger Ages (Titanic)",
    x = "age",
    y = "Count of Passengers"
  ) +
  theme_minimal()


#Q2.Create a bar chart of Pclass vs. count of passengers.
ggplot(train_titanic, aes(x = factor(pclass))) +
  geom_bar(fill = "#FF7F0E") +
  labs(
    title = "Count of Passengers by Pclass",
    x = "Passenger Class",
    y = "Count of Passengers"
  ) +
  
  scale_x_discrete(labels = c("1" = "First Class", "2" = "Second Class", "3" = "Third Class")) +
  theme_minimal()


#Q3. Plot a boxplot of LungCap by Gender. (ERROR)
ggplot(LungCap_Dataset, aes(x = Gender, y = LungCap, fill = Gender)) +
  geom_boxplot(outlier.color = "red") +
  labs(
    title = "Lung Capacity by Gender",
    x = "Gender",
    y = "Lung Capacity"
  ) +
  theme_minimal()

#Q4.1.4. In Facebook dataset:Create a scatter plot of Likes vs Comments.

ggplot(dataset_Facebook, aes(x = comment, y = like)) +
  geom_point(alpha = 0.6, color = "#2CA02C") + # green points
  geom_smooth(method = "lm", color = "#D62728", se = FALSE) + # red linear trend line
  labs(
    title = "Relationship Between Post Comments and Likes",
    x = "Number of Comments (comment)",
    y = "Number of Likes (like)"
  ) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))


#Q4.2.In Facebook dataset:Create a histogram of Shares.
ggplot(dataset_Facebook, aes(x = share)) +
  geom_histogram(bins = 30, fill = "#9467BD", color = "white") +
  labs(
    title = "Distribution of Post Shares",
    x = "Number of Shares",
    y = "Count of Posts"
  ) +
  theme_minimal()

#Q5.For Titanic dataset, use a pie chart to show the proportion of survivors vs non-survivors.
## 1. Data Preparation: Create the 'survival_data' object
survival_data <- train_titanic %>%
  group_by(survived) %>%
  summarise(Count = n()) %>%
  mutate(
    # Convert Survived status to meaningful labels
    Status = ifelse(survived == 1, "Survived", "Non-Survivor"),
    # Calculate percentage for labels
    Proportion = Count / sum(Count),
    Percentage = paste0(round(Proportion * 100), "%"),
    # Create y-axis position for labels
    Y_Pos = cumsum(Proportion) - 0.5 * Proportion
  )

## 2. Plotting the Pie Chart
ggplot(survival_data, aes(x = "", y = Proportion, fill = Status)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  # Add text labels (percentages)
  geom_text(aes(y = Y_Pos, label = Percentage), color = "black", size = 4) +
  labs(
    title = "Proportion of Survivors vs Non-Survivors",
    fill = "Survival Status"
  ) +
  theme_void() + # Remove all background elements for a clean pie chart
  theme(legend.position = "right")

