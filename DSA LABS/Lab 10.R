#DSA LAB 10


install.packages("factoextra")
library(factoextra)


#Prepare Data for Clustering
iris_scaled <- scale(iris[, 1:4])
mtcars_subset <- mtcars[, c("mpg", "hp", "wt")]
mtcars_scaled <- scale(mtcars_subset)


# Q1. Perform K-means clustering with K = 4 on iris dataset and compare with species labels.
print("1. K-Means Clustering with K=4 on iris:")

# Perform K-Means on the scaled data
set.seed(42) # Set seed for reproducibility
kmeans_k4 <- kmeans(iris_scaled, centers = 4, nstart = 25)

# Compare cluster assignments with the actual Species labels
print("Comparison of K=4 Clusters vs. Actual Species:")
# Use the table() function to create a contingency table
print(table(Cluster = kmeans_k4$cluster, Actual_Species = iris$Species))


# 2. Apply clustering on mtcars using mpg, hp, and wt. Interpret clusters.
print("2. K-Means Clustering on mtcars (mpg, hp, wt) with K=3:")

# Use K=3 as a common choice for initial interpretation
set.seed(42)
kmeans_mtcars <- kmeans(mtcars_scaled, centers = 3, nstart = 25)

print("Cluster Sizes:")
print(kmeans_mtcars$size) # Number of observations in each cluster

print("Cluster Centers (scaled):")
print(kmeans_mtcars$centers) # Mean value of variables in each cluster

# To interpret, look at the mean of the original (unscaled) variables in each cluster:
mtcars_subset$cluster <- kmeans_mtcars$cluster
print("Mean of Original Variables per Cluster:")
mtcars_interpretation <- aggregate(. ~ cluster, data = mtcars_subset, FUN = mean)
print(mtcars_interpretation)


# Q3. Use the elbow method to find optimal number of clusters for iris.
print("3. Elbow Method for Optimal K (iris):")

 Method = "wss" stands for Within-Cluster Sum of Squares (the standard Elbow criterion)
elbow_plot <- fviz_nbclust(iris_scaled, kmeans, method = "wss")
print(elbow_plot) 

# Q4. Visualize clusters using PCA-based scatterplot in factoextra.
print("4. Visualizing K-Means Clusters (K=3) with PCA (factoextra):")

set.seed(42)
kmeans_k3 <- kmeans(iris_scaled, centers = 3, nstart = 25)

# fviz_cluster performs PCA dimensionality reduction automatically before plotting
fviz_cluster(kmeans_k3, data = iris_scaled,
             geom = "point", # Plot points
             stand = FALSE,  # Data is already scaled
             ellipse.type = "convex", # Draw convex hull around clusters
             main = "Iris Clusters visualized via PCA")


# 5. Create a subset of iris with only Sepal.Length and Sepal.Width and cluster it.
print("5. Clustering on Sepal.Length and Sepal.Width only (K=3):")

# Create the subset and scale it
iris_sepal_subset <- iris[, c("Sepal.Length", "Sepal.Width")]
iris_sepal_scaled <- scale(iris_sepal_subset)

# Perform K-Means clustering (using K=3)
set.seed(42)
kmeans_sepal <- kmeans(iris_sepal_scaled, centers = 3, nstart = 25)

# Visualize the resulting clusters directly on the two dimensions
fviz_cluster(kmeans_sepal, data = iris_sepal_scaled,
             geom = "point",
             ellipse.type = "convex",
             main = "Clusters based on Sepal Length and Width")
