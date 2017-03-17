# Script for making the dataset workable and uniting
# test and train data


library(stringr)
library(dplyr)
# this line is individual, here it's my path to the files
path <- "C:/anst/R/UCI HAR Dataset/"

run_analysis <- function (path) {
        setwd(path)
        # read all the nessesary files
        activity_labels <- read.table("activity_labels.txt")
        features <- read.table("features.txt")
        subject_test <- read.table("test/subject_test.txt")
        x_test <- read.table("test/X_test.txt")
        y_test <- readLines("test/y_test.txt")
        subject_train <- read.table("train/subject_train.txt")
        x_train <- read.table("train/X_train.txt")
        y_train <- readLines("train/y_train.txt")
        
        # merge datasets
        x_merged <- rbind(x_test, x_train)
        y_merged <- c(y_test, y_train)
        subject_merged <- rbind(subject_test, subject_train)
        
        # change numeric labels to descriptive ones and
        get_activities <- function (index) {
                activity_name <- activity_labels[grep(index, 
                                         activity_labels[,1]),2]
                nice_name <- tolower(activity_name)
        }
        
        # change indeces in y data to activity names
        y_labels <- sapply(y_merged, get_activities)
        
        # add names to the columns
        names(x_merged) <- features[,2]

        # select mean and std data columns 
        std_mean_col <- grep("std|mean",features[,2])
        x_select <- x_merged[,std_mean_col]
        
        # append activity names and subject numbers to the data
        x_select <- cbind(subject_merged, y_labels, x_select)
        names(x_select)[1:2] <- c("subject", "activity")
        
        x_grouped <- group_by(x_select, activity, subject)
        summarize()
        
        averages = x_select %>% group_by(activity,subject) %>% summarize_all(funs(mean))
}




# extract columns with mean and standard deviation values
std_mean_col <- grep("std|mean",features[,2])
x_select <- x_merged[,std_mean_col]
features_select <- as.character(features[std_mean_col,2])
# 

# add participant and activity info to the data
x_test_all <- cbind(subject_test, y_test, x_test)
names(x_test_all)[1:2] <- c("subjectNumber", "activityLabel")
x_train_all <- cbind(subject_train, y_train, x_train)
names(x_train_all)[1:2] <- c("subjectNumber", "activityLabel")


