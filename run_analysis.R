## Getting and Cleaning Data Course Project
##
## Downloaded UCI HAR Dataset from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
##
## created run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
##      3 files in train and 3 files in test (using rbind)
##
##      for subject_test.txt and subject_train.txt
subjectTest <- read.table("./data/test/subject_test.txt")
subjectTrain <- read.table("./data/train/subject_train.txt")
merge_subject <- rbind(subjectTest,subjectTrain)
##      for X_test.txt and X_train.txt (x is features)
featuresTest <- read.table("./data/test/X_test.txt")
featuresTrain <- read.table("./data/train/X_train.txt")
merge_features <- rbind(featuresTest,featuresTrain)
##      for Y_test.txt and Y_train.txt (y is activity)
activityTest <- read.table("./data/test/y_test.txt")
activityTrain <- read.table("./data/train/y_train.txt")
merge_activity <- rbind(activityTest,activityTrain)

## 2. Extracts only the measurements on the mean and standard deviation 
## for each measurement. 
## only merge_features have the mean & standard deviation (std)
## for features, read features.txt into R
featuresTxt <- read.table("./data/features.txt")
featuresColNames <- featuresTxt[,2]
meanAndStd <- grepl("mean|std",featuresColNames)
## now named the column in merge_features
colnames(merge_features) <- featuresColNames
## subsets with the mean and std column only.
merge_features <- merge_features[,meanAndStd]

## 3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("./data/activity_labels.txt")
for (i in 1:6) {
        merge_activity$V1[merge_activity$V1==i] <- as.character(activityLabels[i,2])
}

## 4. Appropriately labels the data set with descriptive variable names.
colnames(merge_subject) <- c("Subject")
colnames(merge_activity) <- c("Activity")

## 5. a  tidy data set with the average of each variable 
## for each activity and each subject
tidyData <- cbind(merge_subject,merge_activity,merge_features)

tidyData2 <- aggregate(. ~Subject + Activity, tidyData, mean)
write.table(tidyData2, file = "./data/Tidy_2.txt", row.names = FALSE)
