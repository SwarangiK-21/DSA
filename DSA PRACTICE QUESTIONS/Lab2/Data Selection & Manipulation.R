library(dplyr)

#Q1.From the Titanic dataset:Select only the columns Name, Sex, Age, and Survived.
titanic_selected <- train_titanic %>%
  select(name, sex, age, survived)


#Q2.From the Titanic dataset:Show passengers older than 50.
titanic_old_passengers <- train_titanic %>%
  filter(age > 50)


#Q3.From the Titanic dataset:Count the number of survivors in each passenger class (Pclass).
survivors_by_pclass <- train_titanic %>%
  # Group by Passenger Class (pclass)
  group_by(pclass) %>%
  # Filter for survivors (assuming 1 means Survived) and count them
  summarise(
    Total_Survivors = sum(survived == 1, na.rm = TRUE),
    .groups = 'drop'
  )

print(survivors_by_pclass)


#Q4.From the Facebook dataset:Find the post with the maximum number of likes.
max_likes_post <- dataset_Facebook %>%
  # Use slice_max to find the row(s) with the highest 'like' value
  slice_max(order_by = like, n = 1)

print(max_likes_post)


#Q5.From the Facebook dataset:Calculate the average number of shares per post.
average_shares <- dataset_Facebook %>%
  summarise(
    Mean_Shares = mean(share, na.rm = TRUE)
  )

print(average_shares)

#Q6.From the Facebook dataset:Create a new column Engagement = Likes + Comments + Shares.
dataset_Facebook <- dataset_Facebook %>%
  
  mutate(
    
    Engagement = coalesce(like, 0) + coalesce(comment, 0) + coalesce(share, 0)
  )




#Q7.Using the Lung Capacity dataset:Select children below age 12.(ERROR)
lungcap_children <- LungCap_Dataset %>%
  
  filter(Age < 12)



#Q8.Using the Lung Capacity dataset:Group by Gender and calculate average Lung Capacity.(ERROR)
average_lungcap_by_gender <- LungCap_Dataset %>%
  
  group_by(Gender) %>%
  summarise(
    Average_LungCap = mean(LungCap, na.rm = TRUE),
    .groups = 'drop'
  )

print(average_lungcap_by_gender)

#Q9.Using the Lung Capacity dataset: Find the child with the maximum Lung Capacity.(ERROR)
max_lungcap_child <- LungCap_Dataset %>%
  
  filter(Age < 12) %>%
  
  slice_max(order_by = LungCap, n = 1)

print(max_lungcap_child)