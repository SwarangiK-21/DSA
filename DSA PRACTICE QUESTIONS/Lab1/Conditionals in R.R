# 1. Write an if statement to check if a number is positive or negative.
number <- -10

if (number > 0) {
  print("The number is positive.")
} else if (number < 0) {
  print("The number is negative.")
} else {
  print("The number is zero.")
}

# 2. Write an if-else statement to check if a given number is even or odd.
number_check <- 7

if (number_check %% 2 == 0) {
  print(paste(number_check, "is an even number."))
} else {
  print(paste(number_check, "is an odd number."))
}

# 3. Write a program to check if a given year is a leap year.
year <- 2024

if ((year %% 4 == 0 & year %% 100 != 0) | (year %% 400 == 0)) {
  print(paste(year, "is a leap year."))
} else {
  print(paste(year, "is not a leap year."))
}

# 4. Take a numeric input for marks and print "Pass" or "Fail".
marks <- 65

if (marks >= 40) {
  print("Pass")
} else {
  print("Fail")
}

# 5. Using nested if-else (or if-else if structure), assign grades.
student_marks <- 82

if (student_marks >= 90) {
  print("Grade A")
} else if (student_marks >= 75) { # Already know marks < 90 here
  print("Grade B")
} else if (student_marks >= 60) { # Already know marks < 75 here
  print("Grade C")
} else { # For marks < 60
  print("Fail")
}