library(readr)
train_titanic <- read_csv("GitHub/DSA/Dataset/train_titanic.csv")
View(train_titanic)

#Q1. Rename the columns of Titanic dataset to lowercase.
train_titanic <- train_titanic %>%
  rename_with(tolower)


#Q2.Sort the Titanic dataset by Age in descending order.
train_titanic_sorted <- train_titanic %>%
  arrange(desc(age))


#Q3. 3. Create a new column in Titanic dataset AgeGroup:
#- “Child” (< 12),
#- “Teen” (12–18),
#- “Adult” (19–59),
#- “Senior” (60+).
train_titanic <- train_titanic %>%
  mutate(
    AgeGroup = case_when(
      age < 12                 ~ "Child",
      age >= 12 & age <= 18    ~ "Teen",
      age >= 19 & age <= 59    ~ "Adult",
      age >= 60                ~ "Senior",
      TRUE                     ~ "Unknown" 
    )
  )


#Q4.Calculate mean Fare by Pclass and Survived status.
mean_fare_by_status <- train_titanic %>%
  
  group_by(pclass, survived) %>%
  summarise(
    mean_fare = mean(fare, na.rm = TRUE), 
    .groups = 'drop'                      
  )

print(mean_fare_by_status)


#Q5.From Facebook dataset, group posts by Type (e.g., Photo, Link, Status) and compute average likes.(error)

average_likes_by_type <- dataset_Facebook %>%
  group_by(Type) %>%
  summarise(
    average_likes = mean(like, na.rm = TRUE),
    .groups = 'drop'
  )

print(average_likes_by_type)

