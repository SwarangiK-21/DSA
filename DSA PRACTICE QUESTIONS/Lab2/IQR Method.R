library(dplyr)

# PART 1: Titanic Dataset - Outlier Detection and Capping (Fare and Age)

# FUNCTION TO HANDLE OUTLIER DETECTION AND CAPPING 
handle_outliers <- function(data, column_name) {
  # 1. Compute Quartiles and IQR
  q1 <- quantile(data[[column_name]], 0.25, na.rm = TRUE)
  q3 <- quantile(data[[column_name]], 0.75, na.rm = TRUE)
  iqr_val <- q3 - q1
  
  # 2. Define Boundaries
  lower_bound <- q1 - 1.5 * iqr_val
  upper_bound <- q3 + 1.5 * iqr_val
  
  # 3. Count Outliers
  outlier_count <- data %>%
    filter(!is.na(.data[[column_name]]) &
             (.data[[column_name]] < lower_bound | .data[[column_name]] > upper_bound)) %>%
    nrow()
  
  # 4. Cap Outliers (Using base R for conditional assignment within the pipe)
  capped_data <- data %>%
    mutate(
      !!column_name := case_when(
        .data[[column_name]] < lower_bound ~ lower_bound,
        .data[[column_name]] > upper_bound ~ upper_bound,
        TRUE                               ~ .data[[column_name]] # Keep non-outliers as is
      )
    )
  
  # 5. Print Summary
  cat(sprintf("\n--- Analysis for %s ---\n", column_name))
  cat(sprintf("Q1: %.2f, Q3: %.2f, IQR: %.2f\n", q1, q3, iqr_val))
  cat(sprintf("Lower Bound: %.2f, Upper Bound: %.2f\n", lower_bound, upper_bound))
  cat(sprintf("Total Outliers Detected: %d\n", outlier_count))
  
  return(list(
    data = capped_data,
    outlier_count = outlier_count
  ))
}

# A. Fare Outlier Handling
fare_results <- handle_outliers(train_titanic, "fare")
train_titanic_capped_fare <- fare_results$data
fare_outliers <- fare_results$outlier_count

# B. Age Outlier Handling 
age_results <- handle_outliers(train_titanic, "age")
train_titanic_final <- age_results$data 
age_outliers <- age_results$outlier_count


# C. How many passengers have ages outside the IQR range? 
cat("\n--- Age IQR Analysis ---\n")
cat(sprintf("Number of passengers with Age outside the 1.5*IQR range: %d\n", age_outliers))



# PART 2: LungCap_dataset - Outlier Detection and Removal (ERROR)

# D. Compare Mean LungCap before and after outlier removal 

# Calculate initial average LungCap
mean_lungcap_initial <- mean(LungCap_Dataset$LungCap, na.rm = TRUE)

# Calculate IQR bounds for LungCap
q1_lungcap <- quantile(LungCap_Dataset$LungCap, 0.25, na.rm = TRUE)
q3_lungcap <- quantile(LungCap_Dataset$LungCap, 0.75, na.rm = TRUE)
iqr_lungcap <- q3_lungcap - q1_lungcap

lower_bound_lungcap <- q1_lungcap - 1.5 * iqr_lungcap
upper_bound_lungcap <- q3_lungcap + 1.5 * iqr_lungcap

# Remove rows containing outliers (IQR method)
LungCap_Dataset_cleaned <- LungCap_Dataset %>%
  filter(!is.na(LungCap) &
           LungCap >= lower_bound_lungcap &
           LungCap <= upper_bound_lungcap)

# Calculate average LungCap after removal
mean_lungcap_cleaned <- mean(LungCap_Dataset_cleaned$LungCap, na.rm = TRUE)
rows_removed <- nrow(LungCap_Dataset) - nrow(LungCap_Dataset_cleaned)

cat("\n--- LungCap Outlier Removal Analysis ---\n")
cat(sprintf("Initial Mean Lung Capacity: %.4f\n", mean_lungcap_initial))
cat(sprintf("Cleaned Mean Lung Capacity: %.4f\n", mean_lungcap_cleaned))
cat(sprintf("Number of Outlier Rows Removed: %d\n", rows_removed))

