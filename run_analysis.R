#Problem Description:
#Data set description at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#Data source at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Ensure I am working in the right project directory. Uncomment only on my own system. Evaluators will need to set this themselves.
setwd("C:\\Users\\cchubb\\Coursera\\DataScience\\3Getting and Cleaning Data\\GettingCleaningDataAssignment")
#Clear out any local variables, start fresh and remove unneeded data from the global environment
rm(list = ls())

library(dplyr)

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
activity_labels <- read.table(paste0(data_dir, "/activity_labels.txt"))
colnames(activity_labels) <- c("activity_id", "activity_label")

#Get feature labels
feature_labels <- read.table(paste0(data_dir, "/features.txt"))
colnames(feature_labels) <- c("feature_id", "feature_label")

#Read and union test and train data together.
subject_merge  <- rbind(
  read.table(paste0(data_dir, "/test/subject_test.txt")), 
  read.table(paste0(data_dir, "/train/subject_train.txt"))
)
y_merge  <- rbind(
  read.table(paste0(data_dir, "/test/y_test.txt")), 
  read.table(paste0(data_dir, "/train/y_train.txt"))
)


#Add the subject and activity IDs, merge in the activity labels
data_summary <-  merge(
  data.frame(
    subject = subject_merge$V1, 
    activity_id = y_merge$V1
  ), 
  activity_labels, 
  by="activity_id",
  sort=FALSE
  )

#Read the X feature summary for test/train and merge together
X_merge <- rbind(
  read.table(paste(data_dir, "/test/X_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/X_train.txt", sep=""))
)

#Apply the feature labels to the dataset as the colnames
colnames(X_merge) <- feature_labels$feature_label
#X_merge[["subject"]] <- subject_merge$V1
#X_merge[["activity_id"]] <- y_merge$V1

#Normalize the labels to make them more "tidy".


#Extract only the mean()/std() variables from the feature set for column appending to the real data
data_summary <- cbind(
  data_summary,
  X_merge[, grepl("(mean\\()|(std\\()", names(X_merge))]
)

#Convert the subject integer column to a factor. 
data_summary$subject <- as.factor(data_summary$subject)

#I no longer need the activity_id column, that data is in the activity_label factor column:
data_summary <- select(data_summary, -activity_id)



#From the data set in step 4, creates a second, independent tidy data set 
#  with the average of each variable for each activity and each subject.

data_summary_grouped <- group_by(data_summary, subject, activity_label)








