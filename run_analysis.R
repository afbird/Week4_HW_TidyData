## script: run_analysis.R

## GOAL 1: Merges the training and the test sets to create one data set.
## GOAL 2: Extracts only the measurements on the mean and standard deviation for each measurement.
## GOAL 3: Uses descriptive activity names to name the activities in the data set
## GOAL 4: Appropriately labels the data set with descriptive variable names.
## GOAL 5: From the data set in goal 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## SOLUTION SEQUENCE FOLLOWED IN THIS SCRIPT AND GOALS INVOLVED IN EACH STEP

## STEP 0 - PREPARE SCRIPT ENVIRONMENT
## STEP 1 - READ TRAIN AND TEST DATA, MERGE INTO SINGLE DATA FRAME, ASSIGN COLUMN NAMES (GOALS 1 and 4)
## STEP 2 - CREATE NEW DATA FRAME INCLUDING ONLY DESIRED COLUMNS (GOAL 2)
## STEP 3 - PREPARE ACTIVITIES DATA FRAMES WITH LABELS OF PERFORMED ACTIVITY (GOALS 3 and 5)
## STEP 4 - PREPARE SUBJECT NUMBERS DATA FRAME (GOAL 5)
## STEP 5 - CREATE AND SAVE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS (GOALS 3 and 5)
## STEP 6 - CREATE AND SAVE DATA FRAME OF AVERAGES OF EACH ATTRIBUTE BY SUBJECT AND ACTIVITY (GOAL 5)

## STEP 0 - PREPARE SCRIPT ENVIRONMENT

## load required libraries
## set working directory to desired folder

library(dplyr)
setwd("C:/users/afbir/Documents/data/UCI HAR Dataset")

## read train and test data using read.table and append test data to train data

df_train_data <- read.table("./train/X_train.txt")
df_test_data <- read.table("./test/X_test.txt")
df_train_test_data <- bind_rows(df_train_data, df_test_data)

## load feature names into data frame and assign to data attributes 

df_features <- read.table("features.txt")
names(df_train_test_data) <- df_features[,2]

## extract column numbers with mean and std values into vectors
## append and sort mean and std column numbers vectors into single vector 

v_mean_names <- grep("mean", df_features[,2], fixed=TRUE, value=FALSE)
v_std_names <- grep("std", df_features[,2], fixed=TRUE, value=FALSE)
v_mean_std_names <- append(v_mean_names, v_std_names, length(v_mean_names)) %>% sort()

## create new data frame containing mean() and std() columns only from data

df_mean_std_data <- df_train_test_data[1:nrow(df_train_test_data),v_mean_std_names]

## load activity labels into data frame and rename columns to understandable titles for later use

df_activity_labels <- read.table("activity_labels.txt")
names(df_activity_labels) <- c("activity_id", "activity_label")

## read train and test activities into data frames and append test activities to train activities

df_ytrain_activity <- read.table("./train/Y_train.txt")
df_ytest_activity <- read.table("./test/Y_test.txt")
df_ytrain_test_activity <- bind_rows(df_ytrain_activity, df_ytest_activity)
names(df_ytrain_test_activity) <- c("activity_id")

## merge train and test activities with corresponding labels

df_ytrain_test_activity_labeled <- inner_join(df_ytrain_test_activity, df_activity_labels, by = c("activity_id" = "activity_id"))

## load train and test subject numbers into data frame and rename columns for later use

df_subject_train <- read.table("./train/subject_train.txt")
df_subject_test <- read.table("./test/subject_test.txt")
df_subject_train_test <- bind_rows(df_subject_train, df_subject_test)
names(df_subject_train_test) <- c("subject_no")

## merge activity labels and subject numbers with data and save file to disk

df_mean_std_data_labeled <- bind_cols(df_ytrain_test_activity_labeled, df_mean_std_data)
df_mean_std_data_labeled <- bind_cols(df_subject_train_test, df_mean_std_data_labeled)

write.table(df_mean_std_data_labeled, "train_test_mean_std_with_labels.txt", row.names = FALSE)

## generate aggregation with averages by subject_no and activity_id and save to disk

list_aggregate_factors <- bind_cols(as.list(df_subject_train_test), as.list(df_ytrain_test_activity_labeled))
df_aggregated_mean_std_data_labeled <- aggregate(df_mean_std_data_labeled[,4:82], list_aggregate_factors, mean)

write.table(df_aggregated_mean_std_data_labeled, "train_test_mean_std_aggregated.txt", row.names = FALSE)
