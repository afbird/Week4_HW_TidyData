# Week4_HW_TidyData
Coursera Week 4_HomeWork - TidyData

This file describes the files, goals of the homework and the data cleansing steps taken to meet the goals

Files included in repository:

README.md - this file

CodeBook.md - Codebook file

run_analysis.R - Script file containing R code that generates tidy data and summarized data files described below

train_test_mean_std_with_labels.txt - text file containing tidy data with subject no, activity no, activity labels, and means of the 79 mean and standard deviation attributes selected from the full data collected. This is the file resulting from achieving goals 1 to 4 below. 

train_test_mean_std_aggregated.txt - text file containing aggregation results of means of collected data values summarized by subject number and activity number. This is the file resulting from achieving goal 5 below.

Data cleaning goals for this homework were the following:

GOAL 1: Merge the training and the test sets to create one data set.
GOAL 2: Extract only the measurements on the mean and standard deviation for each measurement.
GOAL 3: Use descriptive activity names to name the activities in the data set
GOAL 4: Appropriately label the data set with descriptive variable names.
GOAL 5: From the data set in goal 4, create a second, independent tidy data set with the 
        average of each variable for each activity and each subject.
