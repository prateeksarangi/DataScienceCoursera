# Getting and Cleaning Data Project
# Stefan Gloutnikov
#
# Original Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Original Data Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
#!!! Setup: Set working directory to current location of this script. 
#!!!        Have the unzippsed data in 'UCI HAR Dataset' directory in
#!!!        the same directory as this script.  


# Package Check and Install
pkg <- "reshape2"
if (!require(pkg, character.only = TRUE)) {
  install.packages(pkg)
  if (!require(pkg, character.only = TRUE)) 
    stop(paste("Load failure: ", pkg))
}


# Data Directories
dataBaseDirectory <- "./UCI HAR Dataset/"
dataTestDirectory <- "./UCI HAR Dataset/test/"
dataTrainDirectory <- "UCI HAR Dataset/train/"

message("Importing meta data...")
activities <- read.table(paste0(dataBaseDirectory, "activity_labels.txt"), header=FALSE, 
                         stringsAsFactors=FALSE)
features <- read.table(paste0(dataBaseDirectory, "features.txt"), header=FALSE, 
                       stringsAsFactors=FALSE)
message("Importing meta data. DONE.")

# Test Data Import & Prepare
message("Importing and preparing Test data...")
subject_test <- read.table(paste0(dataTestDirectory, "subject_test.txt"), header=FALSE)
x_test <- read.table(paste0(dataTestDirectory, "X_test.txt"), header=FALSE)
y_test <- read.table(paste0(dataTestDirectory, "y_test.txt"), header=FALSE)
tmp <- data.frame(Activity = factor(y_test$V1, labels = activities$V2))
testData <- cbind(tmp, subject_test, x_test)
message("Importing and preparing Test data. DONE.")

# Train Data Import & Prepare
message("Importing and preparing Train data...")
subject_train <- read.table(paste0(dataTrainDirectory, "subject_train.txt"), header=FALSE)
x_train <- read.table(paste0(dataTrainDirectory, "X_train.txt"), header=FALSE)
y_train <- read.table(paste0(dataTrainDirectory, "y_train.txt"), header=FALSE)
tmp <- data.frame(Activity = factor(y_train$V1, labels = activities$V2))
trainData <- cbind(tmp, subject_train, x_train)
message("Importing and preparing Train data. DONE.")

# Tidy Data
message("Preparing Tidy Data from mean() and std() data...")
tmpTidyData <- rbind(testData, trainData)
names(tmpTidyData) <- c("Activity", "Subject", features[,2])
select <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
tidyData <- tmpTidyData[c("Activity", "Subject", select)]
message("Preparing Tidy Data from mean() and std() data. DONE.")

# Write Tidy Data to Disk
message("Writing Tidy Data to disk in tidyData.txt...")
write.table(tidyData, file="./tidyData.txt", row.names=FALSE)
message("Writing Tidy Data to disk in tidyData.txt. DONE.")

# Tidy Data Average/Activity. Melt and Cast.
message("Preparing Tidy Average Data per Activity...")
tidyDataMelt <- melt(tidyData, id=c("Activity", "Subject"), measure.vars=select)
tidyDataMean <- dcast(tidyDataMelt, Activity + Subject ~ variable, mean)
message("Preparing Tidy Average Data per Activity. DONE.")

# Write Tidy Average Data
message("Writing Tidy Average Data to tidyAverageData.txt...")
write.table(tidyDataMean, file="./tidyAverageData.txt", row.names=FALSE)
message("Writing Tidy Average Data to tidyAverageData.txt. DONE.")

