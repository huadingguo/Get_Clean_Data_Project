This data set is derived from the original data set 
===
"Human Activity Recognition Using Smartphones Dataset"    Version 1.0
    
General description about the original data set
===
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.    

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

Feature selection in the original data set
=================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

What files are used to generate our new data set?
===
activity_labels.txt,
features.txt,
X_train.txt, y_train.txt, subject_train.txt
X_test.txt, y_test.txt, subject_test.txt

Files in new data set 
===
The new data set includes the following files
- ComprehensiveDataSet.txt - The file that includes the merged and summarized data of subject id,training data and test data from the original data set.
- run_analysis.R - The R code which is used to merge and summarize the original data set.
- README.md - The file explains what the analysis code does to process the original data set.
The followings are the variables in the data set

Variables in ComprehensiveDataSet.txt
===
- "subjectid" - integer class - records the id of subjects in ascending order
- "activity" - factor class - records the activities
 - "LAYING"
 - "SITTING"
 - "STANDING"
 - "WALKING"
 - "WALKING_DOWNSTAIRS"
 - "WALKING_UPSTAIRS"
- The 3rd to 81 columns - numeric class - the average value of the mean and standard deviation of each measurement for each activity that each subject carried out. The meanings of names of the variables in the 3rd to 81 columns are basically as described in the original data set. To make the names more understandable, we removed "()" and "-" from the original variable names; replaced "Freq" with "Frequency"; replaced "std" with "StandardDeviation"; replaced "Acc" with "Acceleration"; replaced "mean" with "Mean"; and replaced "Mag" with "Magnitude". The first letter in each variable name, either "t" or "f", means that the corresponding measurement is either a time domain measurement or a frequency domain measurement.

There are 180 rows in the data set since we have 30 subjects each of which carried out 6 activities.
