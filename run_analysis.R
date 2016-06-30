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

#Read and union test and train data together.
subject_merge  <- rbind(
  read.table(paste(data_dir, "/test/subject_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/subject_train.txt", sep=""))
)
y_merge  <- rbind(
  read.table(paste(data_dir, "/test/y_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/y_train.txt", sep=""))
)


body_acc_x_merge  <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/body_acc_x_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/body_acc_x_train.txt", sep=""))
)
body_acc_y_merge  <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/body_acc_y_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/body_acc_y_train.txt", sep=""))
)  
body_acc_z_merge  <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/body_acc_z_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/body_acc_z_train.txt", sep=""))
)  
body_gyro_x_merge <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/body_gyro_x_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/body_gyro_x_train.txt", sep=""))
) 
body_gyro_y_merge <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/body_gyro_y_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/body_gyro_y_train.txt", sep=""))
) 
body_gyro_z_merge <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/body_gyro_z_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/body_gyro_z_train.txt", sep=""))
) 
total_acc_x_merge <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/total_acc_x_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/total_acc_x_train.txt", sep=""))
) 
total_acc_y_merge <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/total_acc_y_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/total_acc_y_train.txt", sep=""))
) 
total_acc_z_merge <- rbind(
  read.table(paste(data_dir, "/test/Inertial Signals/total_acc_z_test.txt", sep="")), 
  read.table(paste(data_dir, "/train/Inertial Signals/total_acc_z_train.txt", sep=""))
)

#Add the subject and activity IDs, merge in the activity labels, plus find the means and standard deviations for each set of data

#body_acc_x_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(body_acc_x_merge), stdev = apply(body_acc_x_merge, 1, sd))
#body_acc_y_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(body_acc_y_merge), stdev = apply(body_acc_y_merge, 1, sd))
#body_acc_z_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(body_acc_z_merge), stdev = apply(body_acc_z_merge, 1, sd))
#body_gyro_x_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(body_gyro_x_merge), stdev = apply(body_gyro_x_merge, 1, sd))
#body_gyro_y_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(body_gyro_y_merge), stdev = apply(body_gyro_y_merge, 1, sd))
#body_gyro_z_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(body_gyro_z_merge), stdev = apply(body_gyro_z_merge, 1, sd))
#total_acc_x_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(total_acc_x_merge), stdev = apply(total_acc_x_merge, 1, sd))
#total_acc_y_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(total_acc_y_merge), stdev = apply(total_acc_y_merge, 1, sd))
#total_acc_z_summary <- data.frame(subject=subject_merge$V1, activity_id=y_merge$V1, mean=rowMeans(total_acc_z_merge), stdev = apply(total_acc_z_merge, 1, sd))

summary <-  merge(
  data.frame(
    subject = subject_merge$V1, 
    activity_id = y_merge$V1, 
    
    body_acc_x_mean = rowMeans(body_acc_x_merge),
    body_acc_x_stdev = apply(body_acc_x_merge, 1, sd),
    
    body_acc_y_mean = rowMeans(body_acc_y_merge),
    body_acc_y_stdev = apply(body_acc_y_merge, 1, sd),
    
    body_acc_z_mean = rowMeans(body_acc_z_merge),
    body_acc_z_stdev = apply(body_acc_z_merge, 1, sd),
    
    body_gyro_x_mean = rowMeans(body_gyro_x_merge),
    body_gyro_x_stdev = apply(body_gyro_x_merge, 1, sd),
    
    body_gyro_y_mean = rowMeans(body_gyro_y_merge),
    body_gyro_y_stdev = apply(body_gyro_y_merge, 1, sd),
    
    body_gyro_z_mean = rowMeans(body_gyro_z_merge),
    body_gyro_z_stdev = apply(body_gyro_z_merge, 1, sd),
    
    total_acc_x_mean = rowMeans(total_acc_x_merge),
    total_acc_x_stdev = apply(total_acc_x_merge, 1, sd),
    
    total_acc_y_mean = rowMeans(total_acc_y_merge),
    total_acc_y_stdev = apply(total_acc_y_merge, 1, sd),
    
    total_acc_z_mean = rowMeans(total_acc_z_merge),
    total_acc_z_stdev = apply(total_acc_z_merge, 1, sd)
  ), activity_labels, by="activity_id")


#Merge in the activity factors

#Apply the feature labels to the dataset as the colnames









