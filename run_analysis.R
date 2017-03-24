# Script for uniting test and train data, adding the names of 
# variables and activities, selecting only mean and standard 
# deviation data and averaging each variable for each subject and 
# activity type


library(stringr)
library(dplyr)
# you can uncomment this line and add the directory where you
# unpacked the UCI HAR data if you want to run the analysis from
# this script:
# path <- ""

run_analysis <- function (path) {
        
        # read all the nessesary files
        setwd(path)
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
        
        # remove dataframes, which won't be used further
        rm(x_test, x_train, subject_test, subject_train, 
                                                y_test, y_train)

        # a function, which changes numeric labels to descriptive
        # ones and gets rid of ALL_CAPS
        get_activities <- function (index) {
                activity_name <- activity_labels[grep(index, 
                                         activity_labels[,1]),2]
                nice_name <- tolower(activity_name)
        }
        
        # change indeces in y data to activity names
        y_merged <- sapply(y_merged, get_activities)
        
        # add names to the columns
        names(x_merged) <- features[,2]

        # select mean and std data columns 
        std_mean_col <- grep("std|mean",features[,2])
        x_select <- x_merged[,std_mean_col]
        
        # append activity names and subject numbers to the data
        x_select <- cbind(subject_merged, y_merged, x_select)
        names(x_select)[1:2] <- c("subject", "activity")
        
        # create a dataframe with the means of each variable for
        # each activity and subject
        x_means = x_select %>% 
                group_by(activity,subject) %>% 
                summarise_all(mean)
        
        # save the resulting data to txt file
        write.table(x_means, "activity_subject_means.txt", sep="\t")
}

# This line actually runs the function above using the path 
# provided. Uncomment it if you want to run the analysis from
# this script:
# run_analysis(path)
