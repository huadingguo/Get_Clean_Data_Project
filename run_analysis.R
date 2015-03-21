## clear work space
## rm(list=ls())
## source library
library (dplyr)

###################### STEP 0 ############################
###################### READ DATA FILES ###################
## set the current work directory to 
## the directory that contains the Samsung data
setwd("C:/Users/Dingguo/Dropbox/Coursera/3GettingandCleaningData/WorkSpace/UCI HAR Dataset")
# setwd("C:/Dropbox/Coursera/3GettingandCleaningData/WorkSpace/UCI HAR Dataset")
## save the path of the original directory
originalworkdir <- getwd()
## read the following files
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
## get into the test data directory
setwd("./test")
## read the following data files
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
## get back to the original directory
setwd(originalworkdir)
## get into the train data directory
setwd("./train")
## read the following data files
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
## get back to the original directory
setwd(originalworkdir)

###################### STEP 1 ############################
##### MERGE THE TRAINING AND TEST SETS INTO ONE SET ###### 
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

###################### STEP 2 ############################
########## EXTRACT MEAN AND STANDARD DEVIATION ###########
features[,2]<-as.character(features$V2)
features_mean_std<-features[grepl("mean()",features$V2)|grepl("std()",features$V2),]
x<-x[,features_mean_std[,1]]

###################### STEP 3 ############################
########### ASSIGN DESCRIPTIVE ACTIVITY NAMES ############
y<-as.factor(y[[1]])
y<-sapply(y,function(x){x<- activity_labels[[2]][as.integer(as.character(x))]})
y<-data.frame(y)

###################### STEP 4 ############################
###########  ASSIGN DESCRIPTIVE VARIABLE NAMES ###########
## make subject column name meaningful
colnames(subject)<-"subjectid"
## make x column name meaningful
features_mean_std[,2]<-sub("\\()","", features_mean_std[,2])
features_mean_std[,2]<-gsub("-","", features_mean_std[,2])
features_mean_std[,2]<-sub("Freq","Frequency", features_mean_std[,2])
features_mean_std[,2]<-sub("std","StandardDeviation", features_mean_std[,2])
features_mean_std[,2]<-sub("Acc","Acceleration", features_mean_std[,2])
features_mean_std[,2]<-sub("mean","Mean", features_mean_std[,2])
features_mean_std[,2]<-sub("Mag","Magnitude", features_mean_std[,2])
colnames(x)<-features_mean_std[,2]
## make y column name meaningful
colnames(y)<-"activity"

###################### STEP 5 ############################
############  CREATE ANOTHER DATA SET ####################
## Combine different variables into one data frame
ComprehensiveDataSet <-cbind(subject,y,x)
## sort the data set according to the ascending order of subject id and activity
## AND group the data set by subjectid and activity
## AND calculate the average of each variable for each activity and each subject.
ComprehensiveDataSet <- arrange(ComprehensiveDataSet,subjectid,activity) %>%
    group_by(subjectid,activity) %>%
    summarise_each(funs(mean))

############ SAVE THE DATA SET INTO TEXT FILE ############
write.table(ComprehensiveDataSet,"ComprehensiveDataSet.txt",row.names = FALSE)
## remove unnecessary variables
rm(x_test,x_train,y_test,y_train,
   subject_test,subject_train,
   activity_labels,features,features_mean_std,
   x,y,subject)
