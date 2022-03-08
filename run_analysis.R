#=========================================================
# FIRST PHASE - Preparing the R package and the datasets
#=========================================================

## Installing(if not yet done) and loading the R package that will be used
install.packages("dplyr")
library(dplyr)

## Downloading the datasets provided for this project
if (!file.exists("DSS_C3_proj.zip")){
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, "DSS_C3_proj.zip", method="curl")
}

### Verify if the "UCI HAR Dataset" folder exist in the zip file
if (!file.exists("UCI HAR Dataset")) { 
  unzip("DSS_C3_proj.zip") 
}


## Time to: 
#(a) assign a variable for each dataframes and; 
#(b) assign column names

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# From test folder
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

#From train folder
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")



#=======================================
#SECOND PHASE - Analysis
#=======================================

#You should create one R script called run_analysis.R that does the following.

# Step 1 - Merges the training and the test sets to create one data set.
x_dataset <- rbind(x_train, x_test)
y_dataset <- rbind(y_train, y_test)
subject_dataset <- rbind(subject_train, subject_test)
all_dataset <- cbind(subject_dataset, y_dataset, x_dataset)

# Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
mean_and_std <- all_dataset %>% 
  select(subject, code, contains("mean"), contains("std"))


# Step 3 - Uses descriptive activity names to name the activities in the data set.
mean_and_std$code <- activities[mean_and_std$code, 2]

# Step 4 - Appropriately labels the data set with descriptive variable names.
# Assigning descriptive variable name performed already prior Step 1. 
# However, we will be renaming some abbreviated description.
names(mean_and_std)[2] = "actions"
names(mean_and_std)<-gsub("BodyBody", "body", names(mean_and_std))
names(mean_and_std)<-gsub("^t", "time", names(mean_and_std))
names(mean_and_std)<-gsub("^f", "frequency", names(mean_and_std))
names(mean_and_std)<-gsub("tBody", "time_body", names(mean_and_std))
names(mean_and_std)<-gsub("-mean()", "mean", names(mean_and_std), ignore.case = TRUE)
names(mean_and_std)<-gsub("-std()", "STD", names(mean_and_std), ignore.case = TRUE)
names(mean_and_std)<-gsub("-freq()", "frequency", names(mean_and_std), ignore.case = TRUE)

# Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Tidy_dataset <- mean_and_std %>% 
  group_by(subject, actions) %>% 
  summarise_all(funs(mean))


#========================================================
# FINAL PHASE - Writing the tidy data set as a txt file.
#========================================================

write.table(Tidy_dataset, "Tidy_dataset.txt", row.name=FALSE)