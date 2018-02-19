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
