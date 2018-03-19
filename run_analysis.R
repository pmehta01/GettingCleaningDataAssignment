#########################################################################################
###   Script Name: run_analysis.R 
###   Written by: Preeti Mehta, submitted on March 18, 2018
###   In completion of requirements for the Week 4 assignment of Getting and Cleaning Data
##########################################################################################

# This script follows instructions in the following order given by the assignment:

## Step 1. Merge the training and the test sets to create one data set.
##
## First, set working directory and load required packages

setwd("C:/Users/Preeti/Data Science Course/GettingCleaningDataWeek4Assgt/")
library(dplyr)

# Read in all the data into data frames using read.table command
# Read in training and test data sets

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt") #read X training data into a dataframe - x_train
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt") #read X test data into a dataframe x_test
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") #read y training data into a dataframe y_train
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") #read y test data into a dataframe y_test
subj_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #read subject training data into a dataframe subj_train
subj_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") #read subject test data into a dataframe subj_test

# Read in the "look-up" tables
features_table <- read.table("./UCI HAR Dataset/features.txt")
activity_table <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Now merge the training and tests sets 
x_all <- rbind(x_train, x_test) #Merge X training data
y_all <- rbind(y_train, y_test) #Merge y training data
subj_all <- rbind(subj_train, subj_test)

## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Create a vector that contains the row numbers (indices returned by grep) of the required measurements
meanstddev_vector <- features_table[grep("mean\\(\\)|std", features_table[,2]),]

# Subset the data frame x_all based on this vector
x_all <- x_all[,meanstddev_vector[,1]]

## Step 3. Uses descriptive activity names to name the activities in the data

# First rename activity_table and y_all columns 
colnames(activity_table) <- c("ActivityId", "ActivityNames")
colnames(y_all) <- "Activity"

# Use the match function to lookup Activity Names for Activity Ids in the activity_tables data frame
Activity_vector <- y_all$Activity
# Create the index vector
index <- match(Activity_vector, activity_table$ActivityId)
# Use the index vector to retrieve the corresponding Activity names
Activity_vector <- activity_table$ActivityNames[index]
# Update the "Acbtivityid" column in the data set to the Actual activity names 
y_all$Activity <- Activity_vector 

## Step 4. Appropriately labels the data set with descriptive variable names

# Rename columns of x_all using subsetted features table
colnames(x_all) <- meanstddev_vector[,2]
# Rename column of subj_all to Subject_Id
colnames(subj_all) <- "SubjectId"

# Note: Column name of y_all was already renamed in previous step

## Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
# First create one combined dataset called one_set 
# This data frame now has all the observations (feature measurements), and related subject-ids and activity-ids
one_set <- cbind(subj_all, cbind(y_all, x_all))
# Now create the tidy dataset and write it to tidydata.txt using write.table
one_set_tidy <- one_set  %>% group_by(SubjectId, Activity) %>% summarize_all(funs(mean))
write.table(one_set_tidy, file="./UCI HAR Dataset/tidydata.txt", row.names=FALSE)
