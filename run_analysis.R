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

## STEP 1 - READ AND PREPARE DATA VALUES

## STEP 1.1 - READ TRAIN AND TEST DATA AND BUILD DATA FRAME WITH BOTH TRAIN AND TEST DATA

## use scan to read train data since values are separated by whitespace with no newlines
## use scan to read test data since values are separated by whitespace with no newlines
## append test data vector to train data vector
## convert vector to data frame with row of 561 columns

vx_train <- scan("./train/X_train.txt")
vx_test <- scan("./test/X_test.txt")
vx_traintest <- append(vx_train, vx_test, length(vx_train))
df_traintest <- as.data.frame(matrix(vx_traintest, ncol = 561, byrow = TRUE))

## STEP 1.2 - READ FEATURE NAMES (ATTRIBUTES) AND ASSIGN AS COLUMN NAMES TO DATA FRAME WITH TRAIN AND TEST DATA 

## load column names into data frame 
## assign the column names to the data columns
df_features <- read.delim("features.txt", sep = " ", header = FALSE)
names(df_traintest) <- df_features[,2]

## STEP 2 - CREATE NEW DATA FRAME INCLUDING ONLY DESIRED COLUMNS

## STEP 2.1 - IDENTIFY DESIRED COLUMN NUMBERS FOR mean() and std() VALUES ONLY

## extract column numbers with mean() values into vectors
## extract column numbers with std() values into vectors
## append mean() and std() column numbers vectors into single vector 
## sort column numbers vector to retain column order
v_mean <- grep("mean()", vfeatures[,2], fixed=TRUE, value=FALSE)
v_std <- grep("std()", vfeatures[,2], fixed=TRUE, value=FALSE)
v_meanstd <- append(vmean, vstd, length(vmean))
v_meanstd_sorted <- sort(v_meanstd)

## STEP 2.2 - CREATE NEW DATA FRAME CONTAINING ONLY DESIRED COLUMN NUMBERS

## create new data frame containing mean() and std() columns only from data
df_meanstd <- df_traintest[1:nrow(df_traintest),v_meanstd_sorted]

## STEP 3 - PREPARE ACTIVITIES DATA FRAMES WITH LABELS OF PERFORMED ACTIVITY 

## STEP 3.1 - READ ACTIVITY LABELS DATA INTO DATA FRAME

## load activity labels into data frame
## rename columns to understandable titles for later use
df_activity_labels <- read.delim("activity_labels.txt", sep = " ", header = FALSE)
names(df_activity_labels) <- c("activity_id", "activity_label")

## STEP 3.2 - READ TRAIN ACTIVITIES INTO DATA FRAME AND MERGE WITH ACTIVITY LABELS

## in one chain:
##    load train activities into vector 
##    change vector to integer 
##    change vector to data frame
## rename activity performed column for merge
## merge train activities with activity labels

df_ytrain <- readLines("./train/Y_train.txt") %>% as.integer() %>% as.data.frame()
names(df_ytrain) <- c("activity_done")
df_ytrain_labels <- inner_join(df_ytrain, df_activity_labels, by = c("activity_done" = "activity_id"))

## STEP 3.3 - READ TEST ACTIVITIES INTO DATA FRAME AND MERGE WITH ACTIVITY LABELS

## in one chain:
##    load test activities into vector 
##    change vector to integer 
##    change vector to data frame
## rename activity performed column for merge
## merge test activities with activity labels

df_ytest <- readLines("./test/Y_test.txt") %>% as.integer() %>% as.data.frame()
names(df_ytest) <- c("activity_done")
df_ytest_labels <- inner_join(df_ytest, df_activity_labels, by = c("activity_done" = "activity_id"))

## create activities file without labels
df_ytraintest <- bind_rows(df_ytrain, df_ytest)

## STEP 3.4 - APPEND TRAIN AND TEST PERFORMED ACTIVITIES DATA FRAMES INTO SINGLE DATA FRAME

## append test activities to train activities 

list_traintest_labels <- bind_rows(as.list(df_ytrain_labels), as.list(df_ytest_labels))

## STEP 4 - PREPARE SUBJECT NUMBERS DATA FRAME

## STEP 4.1 - READ TRAIN SUBJECT NUMBERS DATA INTO DATA FRAME

## load train subject numbers into data frame
## rename columns to understandable titles for later use
df_subject_train <- read.delim("./train/subject_train.txt", header = FALSE)
names(df_subject_train) <- c("subject_no")

## STEP 4.2 - READ TEST SUBJECT NUMBERS DATA INTO DATA FRAME

## load test subject numbers into data frame
## rename columns to understandable titles for later use
df_subject_test <- read.delim("./test/subject_test.txt", header = FALSE)
names(df_subject_test) <- c("subject_no")

## STEP 4.3 - APPEND TRAIN AND TEST SUBJECTS INTO DATA FRAME

## append test subject numbers to train subject numbers 
df_subject_traintest <- bind_rows(df_subject_train, df_subject_test)

## STEP 5 - CREATE AND SAVE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS

## STEP 5.1 - CREATE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS

## merge activity labels with data
## merge subject numbers with labeled data

list_meanstd_labels <- bind_cols(list_traintest_labels, as.list(df_meanstd))
list_meanstd_labels <- bind_cols(as.list(df_subject_traintest), list_meanstd_labels)

## STEP 5.2 - CREATE FINAL DATA FRAME WITH ACTIVITIES AND SUBJECT NUMBERS (NO LABELS)

## merge activity labels with data
## merge subject numbers with labeled data

df_meanstd_nolabels <- bind_cols(df_ytraintest, df_meanstd)
df_meanstd_nolabels <- bind_cols(df_subject_traintest, df_meanstd_nolabels)

## STEP 5.2 - SAVE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS TO FILE

## save data frame to disk as a .csv file
write.csv(list_meanstd_labels, "train_test_mean_std_with_labels.csv")

## STEP 6 - CREATE AND SAVE DATA FRAME OF AVERAGES OF EACH ATTRIBUTE BY SUBJECT AND ACTIVITY (GOAL 5)

## STEP 6.1 - PREPARE LIST OF AGGREGATION VALUES, GENERATE AGGREGATE DATA FRAME AND SAVE TO DISK

## prepare list of aggregation values
## generate aggregation data frame
list_aggregate_factors <- bind_cols(as.list(df_subject_traintest), as.list(df_ytraintest))
df_aggregate_means <- aggregate(df_meanstd_nolabels, list_aggregate_factors, mean)

## save aggregatetion data frame to disk as a .csv file
write.csv(df_aggregate_means, "train_test_aggregated_means.csv")


