# Q1. 1. Define the column names for the dataset
col_names <- c("age", "workclass", "fnlwgt", "education", "education_num", 
               "marital_status", "occupation", "relationship", "race", "sex", 
               "capital_gain", "capital_loss", "hours_per_week", "native_country",
               "income")

# 2. Provide the URL to the raw data file
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"

# 3. Read the CSV data into a data frame

adult_data <- read.csv(url, 
                       header = FALSE, 
                       col.names = col_names, 
                       na.strings = " ?", 
                       strip.white = TRUE)

# 4. Verify the import by checking the first few rows and the structure
print("First 6 rows of the data:")
head(adult_data)

print("Structure of the data frame:")
str(adult_data)

#--------------------------------

#Q2: Display the first 10 rows.
head(adult_data, 10)

#Q3: Find the structure of the dataset
str(adult_data)

#Q4. Find the average age of all individuals
mean(adult_data$age)

#Q5: Count individuals by income level
# Get the counts for each category in the 'income' column
income_counts <- table(adult_data$income)

# Print the table
print(income_counts)

#Q6: Find the most common occupation
# Create a table of occupation counts
occupation_counts <- table(adult_data$occupation)

# Sort the table in ascending order
sorted_occupations <- sort(occupation_counts)

# The most common occupation is the last one in the sorted list
most_common_occupation <- tail(sorted_occupations, 1)

# Print the result
print(most_common_occupation)

#Q7. Calculate average hours-per-week for different income groups
# Calculate the mean of 'hours_per_week' grouped by 'income'
avg_hours <- aggregate(hours_per_week ~ income, data = adult_data, FUN = mean)

# Print the result
print(avg_hours)

# Q8. Create a bar chart showing the distribution of education levels
# Get the counts for each education level
education_counts <- table(adult_data$education)

# Create the bar plot
barplot(education_counts, 
        main = "Distribution of Education Levels",
        xlab = "Education Level",
        ylab = "Number of Individuals",
        las = 2,  # Makes the x-axis labels vertical so they don't overlap
        col = "skyblue")

# Q9. Find which native country has the highest percentage of people earning >50K
# Install dplyr if you don't have it already
install.packages("dplyr")

# Load the library
library(dplyr)

# Calculate the percentage of high-income earners for each country
country_income_stats <- adult_data %>%
  
  # Remove rows with NA values, especially in native_country and income
  na.omit() %>%
  
  # Group the data by the native_country column
  group_by(native_country) %>%
  
  # For each country, create summary statistics
  summarise(
    total_people = n(),
    high_income_people = sum(income == ">50K"),
    percentage_high_income = (high_income_people / total_people) * 100
  ) %>%
  
  # Arrange the results in descending order of the percentage
  arrange(desc(percentage_high_income))

# Print the top result
print(head(country_income_stats, 1))

#> # A tibble: 1 × 4
#>   native_country total_people high_income_people percentage_high_income
#>   <fct>                 <int>              <int>                  <dbl>
#> 1 Iran                     42                 18                   42.9
