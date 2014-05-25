library(plyr)
library(reshape2)
library(stringr)

### Adel Hussein
### Getting and Cleaning Data Project

### Objectives

### Create one R script called run_analysis.R that does the following. 

### 1. Merges the training and the test sets to create one data set.
### 2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
### 3.	Uses descriptive activity names to name the activities in the data set
### 4.	Appropriately labels the data set with descriptive activity names. 
### 5.	Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Prepare appropriate paths for directiory and sub_directories to Merges the training and the test sets to create one data set.

setwd("C:/Users/Adel/Desktop/Data Science material/Coursera")
features.dir <- ("HARDataset/features.txt")
activity.dir <- ("HARDataset/activity_labels.txt")
test.dir <- "HARDataset/test"
train.dir <- "HARDataset/train"
main.data <- list()             ### create the data list

## Create a function to rename features to a more readable name.

features.new <- function(feature) {
  feature <- gsub("\\-mean\\(\\)\\-", "Mean", feature)
  feature <- gsub("\\-std\\(\\)\\-", "Std", feature)
  
  feature <- gsub("tBody", "TimeBody", feature)
  feature <- gsub("tGravity", "TimeGravity", feature)
  
  feature <- gsub("\\-mean\\(\\)", "Mean", feature)
  feature <- gsub("\\-std\\(\\)", "Std", feature)
  
  feature <- gsub("fBody", "FFTBody", feature)
  feature <- gsub("fGravity", "FFTGravity", feature)
  
  return(feature)
}
### Loading features, activity, test data and training data into the list
### 1.  Merges the training and the test sets to create one data set.

main.data$features <- read.table(features.dir, col.names=c('id', 'name'), stringsAsFactors=FALSE)

main.data$activity_labels <- read.table(activity.dir, col.names=c('id', 'Activity'))

main.data$train <- cbind(volunteer=read.table(paste(train.dir, "subject_train.txt", sep="/"), col.names="volunteer"),
                         y=read.table(paste(train.dir, "y_train.txt", sep="/"), col.names="Activity.ID"),
                         x=read.table(paste(train.dir, "X_train.txt", sep="/")))

main.data$test <- cbind(volunteer=read.table(paste(test.dir, "subject_test.txt", sep="/"), col.names="volunteer"),
                       y=read.table(paste(test.dir, "y_test.txt", sep="/"), col.names="Activity.ID"),
                       x=read.table(paste(test.dir, "x_test.txt", sep="/")))



### 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 

tidy.data <- rbind(main.data$test, main.data$train)[,c(1, 2, grep("mean\\(|std\\(", main.data$features$name) + 2)]

## 3.  Uses descriptive activity names to name the activities in the data set

names(tidy.data) <- c("Subject", "Activity.ID", features.new(main.data$features$name[grep("mean\\(|std\\(", main.data$features$name)]))

## 4.  Appropriately labels the data set with descriptive activity names. 

tidy.data <- merge(tidy.data, main.data$activity_labels, by.x="Activity.ID", by.y="id")
tidy.data <- tidy.data[,!(names(tidy.data) %in% c("Activity.ID"))]

## 5.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## melt the data over the subject and activity 

tidy.data.temp <-melt(tidy.data, id.vars=c("Subject", "Activity"))

## then use it as a data set to calculate the means
tidy.data.mean <- ddply(tidy.data.temp, .(Subject, Activity), summarise, Means=mean(value))

### Write the tidy data and the mean data into CSV files.

write.csv(tidy.data, file = "tidy_data.txt",row.names = FALSE)
write.csv(tidy.data.mean, file = "tidy_data_mean.txt",row.names = FALSE)