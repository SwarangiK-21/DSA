# 📊 Data Science and Analytics (DSA) using R

![Language](https://img.shields.io/badge/Language-R-blue.svg)
![GitHub last commit](https://img.shields.io/github/last-commit/your-username/your-repo-name)

This repository contains the lab assignments for the **Data Science and Analytics (DSA)** course. It provides a comprehensive, hands-on journey through the core concepts of data science, from basic data manipulation to advanced machine learning, all implemented in the **R programming language**.

## 📚 Lab Assignments Overview

Each lab is a self-contained `.R` script focusing on a specific area of the data science lifecycle. The progression of labs is designed to build a solid foundation in data analysis and modeling.

| Lab No. | Topic                                      | Key Concepts & Functions Covered                                                                                                                                     |
| :------ | :----------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Lab 1** | **Introduction to R** | Loading built-in datasets (`data()`), inspecting data frames (`head()`, `str()`), basic calculations (`max()`, `min()`, `mean()`), and logical operations.                               |
| **Lab 2** | **Data Exploration** | Getting summary statistics (`summary()`), checking for missing values (`is.na()`), and performing grouped aggregations using `dplyr` (`group_by()`, `summarise()`).              |
| **Lab 3** | **Data Cleaning & Preprocessing** | Handling missing data (counting with `sum(is.na())`, imputation), managing duplicate records (`unique()`), and transforming data types (`as.numeric()`, `toupper()`).        |
| **Lab 4** | **Descriptive Statistics & Visualization** | Calculating measures of central tendency and dispersion (`mean()`, `median()`, `sd()`, `var()`). Creating basic plots: scatterplots (`plot()`), histograms (`hist()`), and boxplots (`boxplot()`). |
| **Lab 5** | **Feature Engineering & Transformation** | Binning continuous variables (`cut()`), one-hot encoding for categorical features (`caret::dummyVars()`), min-max normalization, and Z-score standardization (`scale()`).      |
| **Lab 6** | **Correlation & Advanced Visualization** | Measuring the linear relationship between variables (`cor()`). Creating a matrix of scatterplots (`pairs()`) to visualize relationships across multiple variables.       |
| **Lab 7** | **Hypothesis Testing** | Performing statistical tests to validate hypotheses: one-sample t-test (`t.test()`), ANOVA (`aov()`), paired t-test, and correlation significance testing (`cor.test()`).         |
| **Lab 8** | **Linear Regression** | Building predictive models. Covers **Simple Linear Regression** and **Multiple Linear Regression** (`lm()`), interpreting model summaries (`summary()`), and analyzing residuals (`plot()`). |
| **Lab 9** | **Classification Algorithms** | Building models for categorical prediction: **Logistic Regression** (`glm()`) and **Decision Trees** (`rpart()`). Evaluating models with confusion matrices, accuracy, and ROC/AUC curves. |
| **Lab 10**| **Clustering (Unsupervised Learning)** | Grouping data with **K-Means clustering** (`kmeans()`). Using the **Elbow Method** to find the optimal number of clusters and visualizing results with `factoextra::fviz_cluster()`. |

## 💻 Technologies & Packages

-   **Primary Language:** **R**
-   **Key Packages:**
    -   `dplyr`: For data manipulation and transformation.
    -   `caret`: For feature engineering and model training tasks.
    -   `rpart` & `rpart.plot`: For building and visualizing decision trees.
    -   `pROC`: For ROC curve analysis.
    -   `factoextra`: For visualizing clustering results.
