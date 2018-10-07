This is the codebook which describes how all the tasks are done in run_analysis.R:

1. Merges the training and the test sets to create one data set
<br />
x_train: training set 
<br />
x_test: test set
<br />
feature: feature names (column names for the full dataset)
<br />
merged: full dataset with proper variable names

2. Extracts only the measurements on the mean and standard deviation for each measurement
<br />
merged_full: full dataset with only mean and standard deviation measurements

3. Uses descriptive activity names to name the activities in the data set
<br />
y_train: training labels
<br />
y_test: test labels
<br />
activity_label: activity id and names
<br />
merged_label: full data labels with activity names
<br />
merged_df: merge full dataset with variable names with full data labels data with activity names

4. Appropriately labels the data set with descriptive variable names
<br />
subject_train: training set subjects
<br />subject_test: test set subjects
<br />merged_subject: full subjects
<br />merged_all: merge all data include merged_df and merged_subject 
<br />result: final result with variable name cleaned up (numeric index and special charactors removed)

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
<br />tidy_df: cleaned data frame created based on the result from step 4
