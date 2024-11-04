# Load necessary library
library(dplyr)

# Step 1: Download and unzip the dataset if it doesn't already exist in the working directory
if (!file.exists("UCI HAR Dataset")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "dataset.zip")
  unzip("dataset.zip")
}

# Step 2: Read the data
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Load training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity")

# Load test data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity")

# Step 3: Merge datasets
subject <- rbind(subject_train, subject_test)
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)

# Merge into a single dataset
merged_data <- cbind(subject, y, x)

# Step 4: Extract measurements on mean and standard deviation
# First, sanitize the feature names to match those in x data columns
features$feature <- make.names(features$feature, unique = TRUE)

# Re-assign sanitized feature names to x_train and x_test
colnames(x_train) <- features$feature
colnames(x_test) <- features$feature

# Merge x data with subject and activity data
x <- rbind(x_train, x_test)
merged_data <- cbind(subject, y, x)

# Now select mean and standard deviation columns using modified feature names
mean_std_features <- grep("mean|std", features$feature, value = TRUE, ignore.case = TRUE)

# Check the actual features present in merged_data
mean_std_features <- intersect(mean_std_features, colnames(merged_data))

# Select columns based on subject, activity, and mean/std features
selected_data <- merged_data %>%
  select(subject, activity, all_of(mean_std_features))
