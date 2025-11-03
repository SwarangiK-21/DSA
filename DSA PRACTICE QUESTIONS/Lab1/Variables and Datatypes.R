# 1. Create variables to store:
my_name <- "Alex"

my_age <- 30

is_student <- FALSE

# 2. Create a vector containing the numbers 1 to 10.
vector_1_to_10 <- 1:10

# 3. Create a sequence from 5 to 50 with a step size of 5.
sequence_5_50 <- seq(from = 5, to = 50, by = 5)

# 4. Store the names of 5 fruits in a character vector
fruits <- c("Apple", "Banana", "Cherry", "Date", "Elderberry")

# Display the second and fourth fruit
print(fruits[c(2, 4)])

# 5. Create a numeric vector of 10 random numbers between 1 and 100
set.seed(42) # Optional: Makes the random numbers reproducible
random_numbers <- sample(1:100, size = 10, replace = TRUE)

# a. Maximum value
max_value <- max(random_numbers)
print(paste("Maximum value:", max_value))

# b. Minimum value
min_value <- min(random_numbers)
print(paste("Minimum value:", min_value))

# c. Mean
mean_value <- mean(random_numbers)
print(paste("Mean:", mean_value))

# 6. Create a data frame with columns: Name, Age, Marks (at least 5 records)
data_frame_students <- data.frame(
  Name = c("Liam", "Olivia", "Noah", "Emma", "Ava"),
  Age = c(22, 21, 23, 20, 22),
  Marks = c(85, 92, 78, 95, 88)
)

print(data_frame_students)

# 7. Write code to sort the data frame by Marks in descending order.
sorted_data_frame <- data_frame_students[order(data_frame_students$Marks, decreasing = TRUE), ]

print(sorted_data_frame)