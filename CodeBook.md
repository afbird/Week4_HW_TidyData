Coursera Week 4 Data Preparation and Summarization Project

This project consists of downloading raw data gathered by researchers and cleaning and reorganizing it in a way that it can be used for analysis

##Study design and data processing

###Collection of the raw data Description of how the data was collected.

x_train.txt - Collected data used for machine learning traning purposes

x_test.txt - Collected data used to test the machine learning model developed with the training data

y_train.txt - training data regarding activity performed for each observation

y_test.txt - test data regarding activity performed for each observation

activity_labels.txt - descriptive names of activities performed by subjects

features.txt - names of each of the attributes of data collected

subject_train.txt - training data regrading subject number for each observation made

subject_test.txt - test data regrading subject number for each observation made



###Notes on the original (raw) data Some additional notes (if avaialble, otherwise you can leave this section out).

##Creating the tidy datafile

###Guide to create the tidy data file Description on how to create the tidy data file (1. download the data, ...)/

###Cleaning of the data Short, high-level description of what the cleaning script does. link to the readme document that describes the code in greater detail

Data cleansing consisted of loading data into R in the appropriate formats and linking the raw data qith the factors that identified the source of the information. In cleansing, training and test files for data, activities and subjects were merged. The names of the attributes collected had to be applied to each variable and the names of the activities performed were also applied to each observation record. The desired attributes, consisting of means and standard deviations, were extracted and saved to a physical file after all steps had been taken. After the initial data file was prepared, a summary file of average values by attributes for each subject and activity was prepared and saved.

The solution steps sequence followed in the R Script were as follows:

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

##Description of the variables in the tiny_data.txt file General description of the file including:

Dimensions of the dataset

  Data set consisted of 10299 observations with 561 attributes each

Summary of the data - Variables present in the dataset - obtained from reference [1] below

  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

  - Triaxial Angular velocity from the gyroscope. 

  - A 561-feature vector with time and frequency domain variables. 

  - Its activity label. 

  - An identifier of the subject who carried out the experiment.

##Sources Sources you used if any, otherise leave out.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

