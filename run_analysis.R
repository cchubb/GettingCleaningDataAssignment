#Problem Description:
#Data set description at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#Data source at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Ensure I am working in the right project directory.
setwd("C:\\Users\\cchubb\\Coursera\\DataScience\\3Getting and Cleaning Data\\GettingCleaningDataAssignment")


#Connect to the server and download the file if it does not already exist
if (! file.exists("./data")) { dir.create("./data")}

if (! file.exists("./data/dataset.zip")) {
  fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile="./data/dataset.zip")

  if (! file.exists("./data/dataset.zip")) { stop("Unable to download zip file")}
}

#Unizp the file if it hasn't already been unzipped
if (! file.exists("./data/UCI HAR Dataset/README.txt")) {
  unzip("./data/dataset.zip", overwrite=TRUE, exdir="./data")
}

#At this point all of the files should be in place. 
data_dir <- "./data/UCI HAR Dataset"

#Get activity labels
activity_labels <- read.table(paste(data_dir, "/activity_labels.txt", sep=""))
colnames(activity_labels) <- c("activity_id", "activity_label")

#Get feature labels
feature_labels <- read.table(paste(data_dir, "/features.txt", sep=""))
colnames(feature_labels) <- c("feature_id", "feature_label")











