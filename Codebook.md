Codebook for the Getting and Cleaning data course project

This codebook describes the variables, data, and any transformations or work that was done by
the script run_analysis.R to clean up the dataset.

The dataset used for this project is a set of measurements collected from experiments carried out the accelerometers from a Samsung Galaxy S smartphone. The experiments were carried out with a group of 30 volunteers where each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, the project team captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. To begin, there are 561 measurements obtained from the accelerometers, but only 66 of these are eventually used for the project (although all 561 are used to begin).  These are the measurements that are the mean or standard deviation of measurements. These 66 variables are:

  "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
[3] "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
[5] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"           
[7] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
[9] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"        
[11] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
[15] "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"       
[19] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"          
[23] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
[27] "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"      
[31] "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"       
[35] "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"         
[39] "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
[43] "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"           
[47] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"       
[51] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
[55] "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"          
[59] "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"  
[63] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()"

The project files contained several sets of data:

1) A set of test (X_test) and training (X_train) measurements with generic column names (V1....Vn) - a total of 10299 observations with 561 different measurements
2) A set of test (y_test) and training (y_train) activity with a generic colum name (V1) - a total of 10299 activity ids (10299 observations)
3) A set of test (subj_test) and (subj_train) training subject ids - there were 30 volunteer subjects in the experiment (subject ids from 1 to 30) -  the file contained 10,299 ids (one id for each measurement)
4) A "lookup" file that lists activity ids and their corresponding activity names (or tables)
5) A features file that contains a list of 561 features (which correspond to the 561 measurements in the x_test and x_train files).

The data was cleaned up and transformed per the assignment instructions as follows:

1) The  and training was first read into the following data frames using read.table:
x_train, x_test, y_train, y_test, subj_train, subj_test
2) The activity lookup data was read into activity_table and the features were read into features_table
3) The training and test data for each of x, y, and subj were merged into x_all, y_all and subj_all.
4) Then, as required, only those measurements that were the means and standard deviations of measurements were extracted, modifying x_all to have only 66 columns or variables (instead of 561). The subset of 66 variables were extracted into the vector meanstddev_vector.
5) Column names in y_all (from V1 to "Activity") and activity_table (from V1 and V2 to "ActivityId and AcitivityNames") were renamed
6) Using "match" to create an index to "lookup" the activity names in the activity_table, the column of activityids in y_all was transformed to reflect the actual activity name instead of the id.
7) Then the column names of x_all were changed to reflect the 66 features extracted into the variable meanstddev_vector and column name of subj_all to be subject_id instead of v1.
8) All data sets: x_all, y_all, subj_all were then combined into a single dataset called one_set.
Finally, one_set was created into a "tidy" dataset using group_by and summarize_all to create a tidy data set for a single observation for each (subjctid, activity) pair.
