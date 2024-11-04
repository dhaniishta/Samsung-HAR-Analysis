# Human Activity Recognition Using Smartphones - Data Cleaning Project

This project cleans and processes accelerometer data from the Samsung Galaxy S smartphone. The data originates from [UCI's Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and contains observations from wearable devices used by participants in various activities.

## Project Files

- **run_analysis.R**: R script to process and clean the data.
- **tidy_data.txt**: The final tidy data set.
- **CodeBook.md**: Detailed documentation on the variables, data, and transformations.

## Steps to Run the Analysis

1. Clone the repository and set the working directory to this folder.
2. Run the `run_analysis.R` script in R or RStudio.
3. The final tidy data will be saved as `tidy_data.txt`.

## Summary of Analysis Steps

1. Merges training and test datasets to create one dataset.
2. Extracts only the measurements on the mean and standard deviation.
3. Uses descriptive names for activities.
4. Labels dataset variables with descriptive names.
5. Creates a tidy dataset with averages for each variable by activity and subject.
