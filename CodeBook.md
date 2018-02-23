Coursera Week 4 Data Preparation and Summarization Project

This project consists of downloading raw data gathered by researchers and cleaning and reorganizing it in a way that it can be used for analysis

RAW DATA DESCRIPTION:

x_train.txt - Collected data used for machine learning traning purposes

x_test.txt - Collected data used to test the machine learning model developed with the training data

y_train.txt - training data regarding activity performed for each observation

y_test.txt - test data regarding activity performed for each observation

activity_labels.txt - descriptive names of activities performed by subjects

features.txt - names of each of the attributes of data collected

subject_train.txt - training data regrading subject number for each observation made

subject_test.txt - test data regrading subject number for each observation made



HIGH-LEVEL DESCRIPTION OF CLEANING OF THE RAW DATA:

Data cleansing consisted of loading data into R in the appropriate formats and linking the raw data qith the factors that identified the source of the information. In cleansing, training and test files for data, activities and subjects were merged. The names of the attributes collected were applied to each variable and the names of the activities performed were also applied to each observation record. The desired attributes, consisting of means and standard deviations, were extracted and saved to a physical file after all steps had been taken. After the initial data file was prepared, a summary file of average values by attributes for each subject and activity was prepared and saved.


STEPS FOLLOWED IN CREATION OF THE TIDY DATA SET AND THE SUMMARY DATA SET

The solution steps sequence followed in the R Script were as follows:

 1. Load required libraries and set working directory to desired folder

 2. Read train and test data using read.table and append test data to train data

 3. Load feature names into data frame and assign to data attributes 

 4. Extract column numbers with mean and std values into vectors

 5. Append and sort mean and std column numbers vectors into single vector 

 6. Create new data frame containing mean() and std() columns only from data

 7. Load activity labels into data frame and rename columns to understandable titles for later use

 8. Read train and test activities into data frames and append test activities to train activities

 9. Merge train and test activities with corresponding labels

10. Load train and test subject numbers into data frame and rename columns for later use

11. Merge activity labels and subject numbers with data and save file to disk

12. Generate aggregation with averages by subject_no and activity_id and save file to disk



DIMENSIONS AND SUMMARY OF THE DATA IN THE RAW DATA AND OUTPUT DATA SETS: 

Dimensions and summary of the data in the raw data set:

  Raw data set consisted of 10299 observations with 561 attributes each

Summary of the data - Variables present in the raw dataset - obtained from reference [1] below

  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

  - Triaxial Angular velocity from the gyroscope. 

  - A 561-feature vector with time and frequency domain variables. 

  - Its activity label. 

  - An identifier of the subject who carried out the experiment.


Dimensions and summary of the data in the output data set:

  Output data sets consisted of 10299 observations with 82 attributes each 
 
Summary of the data - Variables present in the output datasets:

  Attributes included the subject no, activity id and activity label for the 79 attributes of the original file 
  that represented mean or standard deviation values.


SOURCES USED:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
