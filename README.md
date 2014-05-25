## Getting and Cleaning Data Course Project
========================================================
We will be working with Data from located in the link below:

'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

 Our objective is to create one R script called "run_analysis.R" that does the following. 

1- Merges the training and the test sets to create one data set.
2- Extracts only the measurements on the mean and standard deviation for each measurement. 
3- Uses descriptive activity names to name the activities in the data set
4- Appropriately labels the data set with descriptive activity names. 
5- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

To a complish this objective the following was done:

1- Did some house keeping to allow us to set data paths for the files needed.
2- Create a function to change feature names to more readaple ones
3- Create a list that holds all needed data as data frames. 
4- Loading features, activity, test data and training data files into the list.
 Merges the training and the test sets to create one data set.

  Data list name:  "main.data" has the following variables
  1- $ features       :'data.frame':  561 obs. of  2 variables: 
    .$ id  : int [1:561]
    .$ name: chr [1:561] "tBodyAcc-mean()-X"
    
  2- $activity_labels:'data.frame':  6 obs. of  2 variables:
    .$ id      : int [1:6]
    .$ Activity: Factor w/ 6 levels "LAYING"
    
  3- $ test           :'data.frame':  2947 obs. of  563 variables:
    .$ volunteer  : int [1:2947], this is the subject of the experiment (persons)
    .$ Activity.ID: int [1:2947], a number between 1-6
    .$ x.V1 - $ x.V561      : num [1:2947] 
  
  4- $ train         :'data.frame':  2947 obs. of  563 variables:
    .$ volunteer  : int [1:2947], this is the subject of the experiment (persons)
    .$ Activity.ID: int [1:2947], a number between 1-6
    .$ x.V1 - $ x.V561      : num [1:2947] 

5- Extracts only the measurements on the mean and standard deviation for each measurement.
6- Uses descriptive activity names to name the activities in the data set
7- Appropriately labels the data set with descriptive activity names.
8- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  8.1 melt the data over the subject and activity
  8.2 then use it as a data set to calculate the means

All the above steps are clearly identified within the script file.
  
    
