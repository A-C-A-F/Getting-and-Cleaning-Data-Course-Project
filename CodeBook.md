# DATA TRANSFORMATION
The details are compeletely shown in the R script called run_analysis.R.

## Prior performing the given procedures:
I have assigned the following variables:
- "features" for features.txt
- "activity_labels" for activity_labels.txt
### From test sub folder:
- "subject_test# for subject_test.txt
- "x_test" for X_test.txt
- "y_test" for y_test.txt
### From train sub folder:
- "subject_train" for subject_train.txt
- "x_train" for X_train.txt
- "y_train" for y_train.txt

## The following are the required procedures for this project:
### 1. Merges the training and the test sets to create one data set.
#### Assigned Variables:
- "x_dataset" for rbinding the x_train and x_test
- "y_dataset" for rbinding y_train and y_test
- "subject_dataset" for rbinding the subject_train and subject_test
- "all_dataset" for cbinding the subject_dataset, y_dataset and x_dataset
### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
#### Assigned Variables:
- "mean_and_std" to select the columns for the measurement of mean and standard deviation.
### 3. Uses descriptive activity names to name the activities in the data set
#### Assigned Variables:
- "mean_and_std$code"
### 4. Appropriately labels the data set with descriptive variable names. 
#### Assigned Variables:
- Although I have performed this already in the first phase, I decided to rename some of the abbreviated description of the variable names to make it easier to read.
### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
In this step, I created the variable "Tidy_dataset" as my second independent tidy data set.

# Final part
After completing the steps above, I then used the function write.table() to write and save my second indepent dataset as .txt file.

