# Getting and Cleaning Data Week 4 Assignment
by Preeti Mehta (pmehta01)
This is the README file for the Week 4 final project of the Getting and Cleaning Data Course of the Coursera Data Science Specialization.

The files for this course are saved in the Github respository GettingCleaningDataAssignment under my username pmehta01.

Data for assignment was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped into a subdirectory (UCI HAR Dataset) in my working directory.
The work was done in the R_studio environment.

The files in this repository are:

1) An R script run_analysis.R which contains the R code that is executed to complete the requirements of the Assignment

This code performs the following functions per the instructions:
a) First, it sets the working directory, loads the "dplyr" package needed, and reads in all the data into data frames from the UCI HAR Dataset subdirectory: the x training and test data, the y training and test data, the subject training and test data, the features file and the activity label lookup file
b) Then it subsets the "x" or measurement data to include only those measurements that include the mean or standard deviations (mean() or std()) - it uses the grep function to subset the measurement data
c) Next, it uses the match function to lookup activity names (or labels) in the activity lookup table and using the activity ids as the index, renames the activity ids to activity renames
d) It then renames data variables with descriptive variable names (rather than V1, V2, etc).
e) Finally, the script creates a tidy data set using the "group by" and "piping" functions  calculating mean measurements for each (subject, activity) pair, creating a tidy dataset and using write.table to write this dataset to the file tidydata.txt.

2) The file tidydata.txt which contains the output of the above script. This file has 180 rows and 68 columns.

3) A code book called codebook.md that describes the variables, the data, and any transformations or work that was done by the script run_analyis.R to clean up the dataset
