# Get_Clean_Data_Project
This repository is to carry out the project for the course of "Getting and Cleaning Data".

The R code "run_analysis.R" does the following:

Step 0 - 
  Read the files for activity labels (activity_labels.txt) and features (features.txt) into R workspace.
  Read the files for train data set and test data set into R workspace.
    Only X, y, and subject are read.
   
Step 1 -
  Merge the training and the test data sets to create one data set.
    Merge "x_train" and "x_test" into "x".
    Merge "y_train" and "y_test" into "y".
    Merge "subject_train" and "subject_test" into "subject".
  
Step 2 -
  Extract only the measurements on the mean and standard deviation for each measurement. 
    Look up all the feature names that have either "mean()" or "std()" in data frame "features".
    Assign the found feature names and their indices into "features_mean_std".
    Use the indices to select the corresponding columns in "x".
  
Step 3 -
  Assign descriptive activity names to name the activities in the data set.
    Use the second column of data frame "activity_labels" to assign descriptive activity names to "y".
  
Step 4 -
  Assign the data set with descriptive variable names.   
    Assign name "subjectid" to the column of data frame "subject".
    Assign name "activity" to the column of data frame "y".
    Modify the variable names in the columns of data frame "x" and make the names more understandable. For example, change "std" into "StandardDeviation".
  
Step 5 -
  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each       activity and each subject. We name this data set as "ComprehensiveDataSet".
  To do this, we need to group the data set with respect to "subjectid" and "activity"; order the data set according to the ascending order of "subjectid" and "activit"y; and then use function summarise_each() to get the means for all variables.
  In addtion, save this data set into one .txt file.
