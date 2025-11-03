# 1. Write a for loop to print numbers from 1 to 10.
for (i in 1:10) {
  print(i)
}

# 2. Write a while loop to sum numbers from 1 to 100.
i <- 1
total_sum <- 0

while (i <= 100) {
  total_sum <- total_sum + i
  i <- i + 1
}

print(paste("The sum of 1 to 100 is:", total_sum))


# 3. Write a loop to print only even numbers between 1 and 50.
for (i in 1:50) {
  # Check if the number is even (remainder is 0 when divided by 2)
  if (i %% 2 == 0) {
    print(i)
  }
}


# 4. Write a loop to print the multiplication table of 7 (up to 7 x 10).
table_number <- 7
for (i in 1:10) {
  result <- table_number * i
  print(paste(table_number, "x", i, "=", result))
}

# 5. Create a loop to calculate the factorial of a given number n.
n <- 5 # Example number
factorial_result <- 1

if (n < 0) {
  print("Factorial is not defined for negative numbers.")
} else if (n == 0) {
  print("The factorial of 0 is 1.")
} else {
  for (i in 1:n) {
    factorial_result <- factorial_result * i
  }
  print(paste("The factorial of", n, "is:", factorial_result))
}


# 6. Write a nested loop to print a star pattern (4 rows).
num_rows <- 4

for (i in 1:num_rows) {
  # Generate the string of stars
  stars <- paste(rep("*", i), collapse = "")
  
  # Print the string
  print(stars)
}



