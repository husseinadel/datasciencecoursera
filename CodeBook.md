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
  * $ features       :'data.frame':  561 obs. of  2 variables: 
    .$ id  : int [1:561]
    .$ name: chr [1:561] "tBodyAcc-mean()-X"
    
  * $activity_labels:'data.frame':  6 obs. of  2 variables:
    .$ id      : int [1:6]
    .$ Activity: Factor w/ 6 levels "LAYING"
    
  * $ test           :'data.frame':  2947 obs. of  563 variables:
    .$ volunteer  : int [1:2947], this is the subject of the experiment (persons)
    .$ Activity.ID: int [1:2947], a number between 1-6
    .$ x.V1 - $ x.V561      : num [1:2947] 
  
  * $ train         :'data.frame':  2947 obs. of  563 variables:
    .$ volunteer  : int [1:2947], this is the subject of the experiment (persons)
    .$ Activity.ID: int [1:2947], a number between 1-6
    .$ x.V1 - $ x.V561      : num [1:2947] 

5- Extracts only the measurements on the mean and standard deviation for each measurement.

## 6- Uses descriptive activity names to name the activities in the data set

## Features Names 

##OriginalFeature Name         New Feature Name

tBodyAcc-mean()-X   			    "TimeBodyAccMeanX"           
tBodyAcc-mean()-Y             "TimeBodyAccMeanY"           
tBodyAcc-mean()-Z             "TimeBodyAccMeanZ"           
tBodyAcc-std()-X              "TimeBodyAccStdX"            
tBodyAcc-std()-Y              "TimeBodyAccStdY"            
tBodyAcc-std()-Z              "TimeBodyAccStdZ"            
tGravityAcc-mean()-X          "TimeGravityAccMeanX"        
tGravityAcc-mean()-Y          "TimeGravityAccMeanY"        
tGravityAcc-mean()-Z          "TimeGravityAccMeanZ"        
tGravityAcc-std()-X           "TimeGravityAccStdX"         
tGravityAcc-std()-Y           "TimeGravityAccStdY"         
tGravityAcc-std()-Z           "TimeGravityAccStdZ"         
tBodyAccJerk-mean()-X         "TimeBodyAccJerkMeanX"       
tBodyAccJerk-mean()-Y         "TimeBodyAccJerkMeanY"       
tBodyAccJerk-mean()-Z         "TimeBodyAccJerkMeanZ"       
tBodyAccJerk-std()-X          "TimeBodyAccJerkStdX"        
tBodyAccJerk-std()-Y          "TimeBodyAccJerkStdY"        
tBodyAccJerk-std()-Z          "TimeBodyAccJerkStdZ"        
tBodyGyro-mean()-X            "TimeBodyGyroMeanX"          
tBodyGyro-mean()-Y            "TimeBodyGyroMeanY"          
tBodyGyro-mean()-Z            "TimeBodyGyroMeanZ"          
tBodyGyro-std()-X             "TimeBodyGyroStdX"           
tBodyGyro-std()-Y             "TimeBodyGyroStdY"           
tBodyGyro-std()-Z             "TimeBodyGyroStdZ"           
tBodyGyroJerk-mean()-X        "TimeBodyGyroJerkMeanX"      
tBodyGyroJerk-mean()-Y        "TimeBodyGyroJerkMeanY"      
tBodyGyroJerk-mean()-Z        "TimeBodyGyroJerkMeanZ"      
tBodyGyroJerk-std()-X         "TimeBodyGyroJerkStdX"       
tBodyGyroJerk-std()-Y         "TimeBodyGyroJerkStdY"       
tBodyGyroJerk-std()-Z         "TimeBodyGyroJerkStdZ"       
tBodyAccMag-mean()            "TimeBodyAccMagMean"         
tBodyAccMag-std()             "TimeBodyAccMagStd"          
tGravityAccMag-mean()         "TimeGravityAccMagMean"      
tGravityAccMag-std()          "TimeGravityAccMagStd"       
tBodyAccJerkMag-mean()        "TimeBodyAccJerkMagMean"     
tBodyAccJerkMag-std()         "TimeBodyAccJerkMagStd"      
tBodyGyroMag-mean()           "TimeBodyGyroMagMean"        
tBodyGyroMag-std()            "TimeBodyGyroMagStd"         
tBodyGyroJerkMag-mean()       "TimeBodyGyroJerkMagMean"    
tBodyGyroJerkMag-std()        "TimeBodyGyroJerkMagStd"     
fBodyAcc-mean()-X             "FFTBodyAccMeanX"            
fBodyAcc-mean()-Y             "FFTBodyAccMeanY"            
fBodyAcc-mean()-Z             "FFTBodyAccMeanZ"            
fBodyAcc-std()-X              "FFTBodyAccStdX"             
fBodyAcc-std()-Y              "FFTBodyAccStdY"             
fBodyAcc-std()-Z              "FFTBodyAccStdZ"             
fBodyAccJerk-mean()-X         "FFTBodyAccJerkMeanX"        
fBodyAccJerk-mean()-Y         "FFTBodyAccJerkMeanY"        
fBodyAccJerk-mean()-Z         "FFTBodyAccJerkMeanZ"        
fBodyAccJerk-std()-X          "FFTBodyAccJerkStdX"         
fBodyAccJerk-std()-Y          "FFTBodyAccJerkStdY"         
fBodyAccJerk-std()-Z          "FFTBodyAccJerkStdZ"         
fBodyGyro-mean()-X            "FFTBodyGyroMeanX"           
fBodyGyro-mean()-Y            "FFTBodyGyroMeanY"           
fBodyGyro-mean()-Z            "FFTBodyGyroMeanZ"           
fBodyGyro-std()-X             "FFTBodyGyroStdX"            
fBodyGyro-std()-Y             "FFTBodyGyroStdY"            
fBodyGyro-std()-Z             "FFTBodyGyroStdZ"            
fBodyAccMag-mean()            "FFTBodyAccMagMean"          
fBodyAccMag-std()             "FFTBodyAccMagStd"           
fBodyBodyAccJerkMag-mean(     "FFTBodyBodyAccJerkMagMean"  
fBodyBodyAccJerkMag-std()     "FFTBodyBodyAccJerkMagStd"   
fBodyBodyGyroMag-mean()       "FFTBodyBodyGyroMagMean"     
fBodyBodyGyroMag-std()        "FFTBodyBodyGyroMagStd"      
fBodyBodyGyroJerkMag-mean()   "FFTBodyBodyGyroJerkMagMean" 
fBodyBodyGyroJerkMag-std()    "FFTBodyBodyGyroJerkMagStd"  


7- Appropriately labels the data set with descriptive activity names.
8- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  8.1 melt the data over the subject and activity
  8.2 then use it as a data set to calculate the means

All the above steps are clearly identified within the script file.


  
    
