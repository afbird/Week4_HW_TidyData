# Week4_HW_TidyData
Coursera Week 4_HomeWork - TidyData

This file describes the files, goals of the homework and the data cleansing steps taken to meet the goals

Submitted File 1: run_analysis.R - Script file containing code described below

Submitted File 2: train_test_mean_std_with_labels.csv - file containing tidy data with subject no, activity no, activity labels, and means and standrard deviations of the collected data

Submitted File 3: train_test_aggregated_means.csv - file containing aggregation results of means of collected data values summarized by subject number and activity number


Homework Goals:

GOAL 1: Merge the training and the test sets to create one data set.

GOAL 2: Extract only the measurements on the mean and standard deviation for each measurement.

GOAL 3: Use descriptive activity names to name the activities in the data set

GOAL 4: Appropriately label the data set with descriptive variable names.

GOAL 5: From the data set in goal 4, create a second, independent tidy data set with the 
        average of each variable for each activity and each subject.
        

Solution Steps Sequence followed in R Script and goals involved in each step

STEP 0 - PREPARE SCRIPT ENVIRONMENT

STEP 1 - READ TRAIN AND TEST DATA, MERGE INTO SINGLE DATA FRAME, ASSIGN COLUMN NAMES (GOALS 1 and 4)

STEP 2 - CREATE NEW DATA FRAME INCLUDING ONLY DESIRED COLUMNS (GOAL 2)

STEP 3 - PREPARE ACTIVITIES DATA FRAMES WITH LABELS OF PERFORMED ACTIVITY (GOALS 3 and 5)

STEP 4 - PREPARE SUBJECT NUMBERS DATA FRAME (GOAL 5)

STEP 5 - CREATE AND SAVE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS (GOALS 3 and 5)

STEP 6 - CREATE AND SAVE DATA FRAME OF AVERAGES OF EACH ATTRIBUTE BY SUBJECT AND ACTIVITY (GOAL 5)


he solution steps sequence followed in the R Script were as follows:

STEP 0 - PREPARE SCRIPT ENVIRONMENT

STEP 1 - READ TRAIN AND TEST DATA, MERGE INTO SINGLE DATA FRAME, ASSIGN COLUMN NAMES (GOALS 1 and 4)

STEP 2 - CREATE NEW DATA FRAME INCLUDING ONLY DESIRED COLUMNS (GOAL 2)

STEP 3 - PREPARE ACTIVITIES DATA FRAMES WITH LABELS OF PERFORMED ACTIVITY (GOALS 3 and 5)

STEP 4 - PREPARE SUBJECT NUMBERS DATA FRAME (GOAL 5)

STEP 5 - CREATE AND SAVE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS (GOALS 3 and 5)

STEP 6 - CREATE AND SAVE DATA FRAME OF AVERAGES OF EACH ATTRIBUTE BY SUBJECT AND ACTIVITY (GOAL 5)

STEP 0 - PREPARE SCRIPT ENVIRONMENT

STEP 0.1 load required libraries 0.2 set working directory to desired folder

STEP 1 - READ AND PREPARE DATA VALUES

STEP 1.1 - READ TRAIN AND TEST DATA AND BUILD DATA FRAME WITH BOTH TRAIN AND TEST DATA

1.1.1 use scan to read train data since values are separated by whitespace with no newlines

1.1.2 use scan to read test data since values are separated by whitespace with no newlines

1.1.3 append test data vector to train data vector

1.1.4 convert vector to data frame with row of 561 columns
STEP 1.2 - READ FEATURE NAMES (ATTRIBUTES) AND ASSIGN AS COLUMN NAMES TO DATA FRAME WITH TRAIN AND TEST DATA

1.2.1 load column names into data frame

1.2.2 assign the column names to the data columns
STEP 2 - CREATE NEW DATA FRAME INCLUDING ONLY DESIRED COLUMNS

STEP 2.1 - IDENTIFY DESIRED COLUMN NUMBERS FOR mean() and std() VALUES ONLY

2.1.1 extract column numbers with mean() values into vectors

2.1.2 extract column numbers with std() values into vectors

2.1.3 append mean() and std() column numbers vectors into single vector

2.1.4 sort column numbers vector to retain column order
STEP 2.2 - CREATE NEW DATA FRAME CONTAINING ONLY DESIRED COLUMN NUMBERS

2.2.1 create new data frame containing mean() and std() columns only from data
STEP 3 - PREPARE ACTIVITIES DATA FRAMES WITH LABELS OF PERFORMED ACTIVITY

STEP 3.1 - READ ACTIVITY LABELS DATA INTO DATA FRAME

3.1.1 load activity labels into data frame

3.1.2 rename columns to understandable titles for later use
STEP 3.2 - READ TRAIN ACTIVITIES INTO DATA FRAME AND MERGE WITH ACTIVITY LABELS

3.2.1 in one chain:

  3.2.1.1 load train activities into vector

  3.2.1.2 change vector to integer

  3.2.1.3 change vector to data frame

3.2.2 rename activity performed column for merge

3.2.3 merge train activities with activity labels
STEP 3.3 - READ TEST ACTIVITIES INTO DATA FRAME AND MERGE WITH ACTIVITY LABELS

3.3.1 in one chain:

  3.3.1.1 load test activities into vector

  3.3.1.2 change vector to integer

  3.3.1.3 change vector to data frame

3.3.2 rename activity performed column for merge

3.3.3 merge test activities with activity labels

3.3.4 create activities file without labels
STEP 3.4 - APPEND TRAIN AND TEST PERFORMED ACTIVITIES DATA FRAMES INTO SINGLE DATA FRAME

3.4.1 append test activities to train activities
STEP 4 - PREPARE SUBJECT NUMBERS DATA FRAME

STEP 4.1 - READ TRAIN SUBJECT NUMBERS DATA INTO DATA FRAME

4.1.1 load train subject numbers into data frame

4.1.2 rename columns to understandable titles for later use
STEP 4.2 - READ TEST SUBJECT NUMBERS DATA INTO DATA FRAME

4.2.1 load test subject numbers into data frame

4.2.2 rename columns to understandable titles for later use
STEP 4.3 - APPEND TRAIN AND TEST SUBJECTS INTO DATA FRAME

4.3.1 append test subject numbers to train subject numbers
STEP 5 - CREATE AND SAVE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS

STEP 5.1 - CREATE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS

5.1.1 merge activity labels with data

5.1.2 merge subject numbers with labeled data
STEP 5.2 - CREATE FINAL DATA FRAME WITH ACTIVITIES AND SUBJECT NUMBERS (NO LABELS)

5.2.1 merge activityies with data

5.2.2 merge subject numbers with data
STEP 5.3 - SAVE FINAL DATA FRAME WITH ACTIVITY LABELS AND SUBJECT NUMBERS TO FILE

5.3.1 save data frame to disk as a .csv file
STEP 6 - CREATE AND SAVE DATA FRAME OF AVERAGES OF EACH ATTRIBUTE BY SUBJECT AND ACTIVITY (GOAL 5)

STEP 6.1 - PREPARE LIST OF AGGREGATION VALUES, GENERATE AGGREGATE DATA FRAME AND SAVE TO DISK

6.1.1 prepare list of aggregation values

6.1.2 generate aggregation data frame

6.1.3 save aggregatetion data frame to disk as a .csv file
