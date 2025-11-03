
# Q1. List all objects in the Global Environment to confirm dataset names
print("Objects currently in the Global Environment:")
ls()

# 2. Display the first few rows of a dataset (e.g., train_titanic) to confirm loading
print("First 6 rows of train_titanic:")
head(train_titanic, 6)

# 3. Display the structure and data types of another dataset (e.g., LungCap_Dataset)
print("Structure of LungCap_Dataset:")
str(LungCap_Dataset)

# 4. Check the dimensions (rows and columns) of LA_2017
print("Dimensions (rows, columns) of LA_2017:")
dim(LA_2017)