Getting and Cleaning Data Course Project
========================================
Chris Chubb
cchubb@codegurus.com
Create Date: July 6, 2016

---


### Requirements:

  * Merge the training and the test sets to create one data set.
  * Extract only the measurements on the mean and standard deviation for each measurement.
  * Use descriptive activity names to name the activities in the data set
  * Appropriately label the data set with descriptive variable names.
  * From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data Description

The source data consists of accelerometer data collected from smartphones worn by test subjects performing a variety of actions. 

### Synopsis:

---
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
---

Additional details can be found at the [Human Activity Recognition Using Smartphones Data Set] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The data is downloaded from the [compressed archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Process

The included script, run_analysis.R, performs the following steps on the provided data in order to reformat and summarize the data into a tidy data set for further analysis.

  * Prepares a ./data directory, downloads the source .zip archive and unzips it, if necessary.
  * Read in the activity and feature labels. 
  * Read in and merge the subject and "y" (activity) tables from both test and train data sets. 
  * Build a data frame from the subject and activity columns. Merge in the activity labels by activity_id.
  * Read and merge the test and train "X" (features) data sets. 
  * Assuming that the feature labels are in the same order as the feature columns, (not explicity stated in the source documentation, but assumed for this excercise), apply the feature labels as column names to the features data set.
  * Select only the columns of the features data set that contain the strings "mean()" or "std()", then column bind it with the subject and activity columns. 
  * Remove the activity_id column as redundant and convert the subject column to a factor.
  * Convert the column names (activity label) to a more tidy format. 
  * The data set is then grouped and sorted by subject and activity level factors and the mean() function is applied to all numeric columns. 
  * The script persists the final data set to a CSV file "./data_summary_grouped.csv" with no row names to preserve maximum compatibility.
  
  
  
  
  
  
  
  