#DSA LAB 3

data(airquality)
data(mtcars)
data(iris)

# Q1. Count how many missing values are present in the airquality dataset.
print("1. Total number of missing values in airquality:")
total_missing_count <- sum(is.na(airquality))

cat("Total Missing Values (NAs):", total_missing_count, "\n")


#Q2. Replace missing values in Ozone with the median instead of mean.
print("2. Impute missing Ozone values with the median:")

# Calculate the median of the non-missing Ozone values
median_ozone <- median(airquality$Ozone, na.rm = TRUE)

# Impute the missing values
airquality$Ozone[is.na(airquality$Ozone)] <- median_ozone

# Check the number of missing values in Ozone after imputation (should be 0)
cat("Missing Ozone values after imputation:", sum(is.na(airquality$Ozone)), "\n")


# Q3. Create a duplicate dataset from mtcars and remove the duplicates.
print("3. Create duplicate dataset and remove duplicates:")

# Create a duplicate dataset (using the original 'mtcars' dataset for this step)
mtcars_dup <- mtcars

# Add a duplicate row (e.g., duplicate the first row)
mtcars_dup <- rbind(mtcars_dup, mtcars_dup[1, ])

cat("Rows before removing duplicates:", nrow(mtcars_dup), "\n")

# Remove duplicates based on all columns
mtcars_unique <- unique(mtcars_dup)

cat("Rows after removing duplicates:", nrow(mtcars_unique), "\n")


# Q4. Convert all car names in mtcars row names to uppercase.
print("4. Convert mtcars row names to uppercase:")

# Row names are special in R; use rownames() function.
current_row_names <- rownames(mtcars)
uppercase_row_names <- toupper(current_row_names)

# Reassign the new uppercase names
rownames(mtcars) <- uppercase_row_names

# Display the first few uppercase names
print("First 5 uppercase car names:")
head(rownames(mtcars), 5)


# Q5.Convert the Species column in iris dataset into numeric codes (1, 2, 3).
print("5. Convert Species column into numeric codes (1, 2, 3):")


iris$Species_Code <- as.numeric(iris$Species)

# Display the first few rows showing the new code
print("First 5 rows of iris with new numeric code:")
head(iris[, c("Species", "Species_Code")], 5)

# Check the mapping:
print("Species to Numeric Code Mapping:")
levels(iris$Species)