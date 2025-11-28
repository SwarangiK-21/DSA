#DSA LAB 9


install.packages("pROC")
install.packages(c("rpart", "caret"))
library(pROC)    # For ROC curve
library(rpart)   # For Decision Tree
library(caret)   # For Confusion Matrix (or use base table function)



# Q1. Build a logistic regression model predicting am (automatic/manual) in mtcars using hp and wt.
print("1. Logistic Regression Model: am ~ hp + wt")

# Ensure 'am' is treated as a factor for clarity, though 0/1 works fine.
mtcars$am <- factor(mtcars$am, levels = c(0, 1), labels = c("Automatic", "Manual"))

# Build the logistic model using glm() with family=binomial
logistic_model_Q1 <- glm(am ~ hp + wt, data = mtcars, family = binomial)

# Display the model summary
print(summary(logistic_model_Q1))


# Q2. Construct a decision tree to classify Species in the full iris dataset.
print("2. Decision Tree Model for iris Species:")


tree_model <- rpart(Species ~ ., data = iris, method = "class")

# Display the tree structure (optional: use plot(tree_model) to visualize)
print(tree_model)


# Q3. Calculate confusion matrix and accuracy for Q1 (Logistic Regression).
print("3. Confusion Matrix and Accuracy for Logistic Regression Model (Q1):")

# Generate predicted probabilities for the 'Manual' class (level 1)
mtcars$prob_manual <- predict(logistic_model_Q1, type = "response")

# Convert probabilities to binary class predictions (e.g., using a threshold of 0.5)
mtcars$pred_am <- factor(ifelse(mtcars$prob_manual > 0.5, "Manual", "Automatic"),
                         levels = c("Automatic", "Manual"))

# Calculate the Confusion Matrix
conf_matrix_Q1 <- table(Actual = mtcars$am, Predicted = mtcars$pred_am)
print("Confusion Matrix:")
print(conf_matrix_Q1)

# Calculate Accuracy (or use the caret package's confusionMatrix function for more detail)
accuracy_Q1 <- sum(diag(conf_matrix_Q1)) / sum(conf_matrix_Q1)
cat("\nAccuracy:", accuracy_Q1, "\n")



# Q4. Plot the ROC curve for the logistic regression model in Q1.
print("4. Plotting ROC Curve for Logistic Regression Model (Q1)...")

# 'response' refers to the predicted probabilities (manual class)
roc_curve <- roc(mtcars$am, mtcars$prob_manual)

# Plot the ROC curve
plot(roc_curve, main = "ROC Curve for am Prediction", col = "blue", lwd = 2)
# Add AUC (Area Under the Curve) to the plot
auc_value <- auc(roc_curve)
legend("bottomright", legend = paste("AUC =", round(auc_value, 3)), col = "blue", lwd = 2)

cat("\nArea Under the Curve (AUC):", auc_value, "\n")



# Q5. Compare logistic regression and decision tree performance on the iris dataset.
print("5. Comparing Logistic Regression and Decision Tree performance on iris (Sample Comparison):")

# Make predictions using the Decision Tree (Q2)
iris$tree_pred <- predict(tree_model, iris, type = "class")

# Calculate Confusion Matrix for Decision Tree
conf_matrix_tree <- table(Actual = iris$Species, Predicted = iris$tree_pred)
print("Decision Tree Confusion Matrix:")
print(conf_matrix_tree)

# Calculate Accuracy for Decision Tree
accuracy_tree <- sum(diag(conf_matrix_tree)) / sum(conf_matrix_tree)
cat("\nDecision Tree Accuracy:", accuracy_tree, "\n")

