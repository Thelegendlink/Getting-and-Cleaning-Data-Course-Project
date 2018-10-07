This is the codebook which describes how all the tasks are done in run_analysis.R:

1. Merges the training and the test sets to create one data set
+x_train: training set 
+x_test: test set
+feature: feature names (column names for the full dataset)
+merged: full dataset with proper variable names

2. Extracts only the measurements on the mean and standard deviation for each measurement
+merged_full: full dataset with only mean and standard deviation measurements

3. Uses descriptive activity names to name the activities in the data set
+y_train: training labels
+y_test: test labels
+activity_label: activity id and names
+merged_label: full data labels with activity names
+merged_df: merge full dataset with variable names with full data labels data with activity names

4. Appropriately labels the data set with descriptive variable names
+subject_train: training set subjects
+subject_test: test set subjects
+merged_subject: full subjects
+merged_all: merge all data include merged_df and merged_subject 
+result: final result with variable name cleaned up (numeric index and special charactors removed)

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
+tidy_df: cleaned data frame created based on the result from step 4
