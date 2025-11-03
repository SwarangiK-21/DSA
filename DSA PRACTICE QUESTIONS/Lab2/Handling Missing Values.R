library(dplyr)

#Q1. Identify the columns with missing values in the Titanic dataset.
missing_counts <- train_titanic %>%
  summarise_all(~sum(is.na(.)))

print(missing_counts)


#Q2. Replace missing Age values with the median Age.
median_age <- median(train_titanic$age, na.rm = TRUE)

train_titanic <- train_titanic %>%
  mutate(age = tidyr::replace_na(age, median_age)) 

sum(is.na(train_titanic$age))


#Q3. Drop rows where Embarked is missing.
train_titanic <- train_titanic %>%
  filter(!is.na(embarked))

# Check the result (optional)
sum(is.na(train_titanic$embarked))


#Q4.For Lung Capacity dataset, fill missing values of LungCap with the mean LungCap.(ERROR)
# 1. Calculate the mean 'lungcap'
mean_lungcap <- mean(LungCap_Dataset$lungcap, na.rm = TRUE)

# 2. Replace missing 'lungcap' values with the calculated mean
LungCap_Dataset <- LungCap_Dataset %>%
  mutate(lungcap = tidyr::replace_na(lungcap, mean_lungcap))

# 3. Check the result (optional)
sum(is.na(LungCap_Dataset$lungcap))