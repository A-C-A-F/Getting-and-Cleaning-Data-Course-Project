# Getting-and-Cleaning-Data-Course-Project
Data Science Specialization - Getting and Cleaning Data Course Project. 

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The repository here is my submission for the course project stated above.

# Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Repository of codes for this project are detailed in the run_analysis.R script.

# About the R script
The run_analysis.R script shows the detailed process of the following analysis steps I've conducted for this project. I used RStudio as my IDE for R.

## FIRST Phase
In this phase, i have performed the following tasks:
- Prepare the R package by installing and loading the "dplyr".
- Then I downloaded and stored in my local machine the dataset from the link provided above.
- After downloading, I have read the file and renamed some of the columns that I will be conducting analysis in the later part of this project.

## SECOND Phase
This is the analysis phase where I performed following steps and procedure as provided in this project:
### Step 1: Merges the training and the test sets to create one data set.
In this step, I have merged all the datasets after assigning variables to each.
### Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
I created a variable "mean_and_std" to perform the necessary action in this step.
### Step 3: Uses descriptive activity names to name the activities in the data set.
### Step 4: Appropriately labels the data set with descriptive variable names.
Although I have performed this already in the first phase, I decided to rename some of the abbreviated description of the variable names to make it easier to read.
### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
In this step, I created the variable "Tidy_dataset" as my second independent tidy data set.

## FINAL Phase
In this phase, I used the function write.table() to write and save my second indepent dataset as .txt file.
