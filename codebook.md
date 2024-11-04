# CodeBook for Human Activity Recognition Using Smartphones

This CodeBook describes the variables, data, and transformations applied in the `tidy_data.txt` dataset.

## Source Data

Data was collected from accelerometers of the Samsung Galaxy S smartphone, with full documentation available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data Dictionary

- **subject**: Identifier for the subject who performed the activity, ranging from 1 to 30.
- **activity**: Activity label with six categories:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

### Measurement Variables

These variables represent mean or standard deviation measurements from the accelerometer and gyroscope of the smartphone. Variable names were modified for clarity:

- `TimeBodyAccelerometer-mean-X/Y/Z`: Mean of body acceleration time for X/Y/Z axes.
- `TimeBodyAccelerometer-std-X/Y/Z`: Standard deviation of body acceleration time for X/Y/Z axes.
- `FrequencyBodyAccelerometer-mean-X/Y/Z`: Mean of body acceleration frequency for X/Y/Z axes.
- `FrequencyBodyGyroscope-mean-X/Y/Z`: Mean of gyroscope frequency for X/Y/Z axes.
- `TimeBodyGyroscope-mean-X/Y/Z`: Mean of gyroscope time for X/Y/Z axes.

### Transformation Summary

1. Merged training and test data.
2. Extracted columns with `mean` and `std` in their names.
3. Applied descriptive names for activities.
4. Created a tidy dataset with averages for each activity and subject.
