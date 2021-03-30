---
title: "run_analysis.R CodeBook "
author: "Sammy Park"
date: "30-03-21"
output: "AverageData.txt

---

## Project Description and collection of the raw data
The experiments were performed with 30 volunteers within the ages of 19 to 48. Each person performed six activities (Walking, Walking_upstairs, Walking_downstairs, 
sitting, standing, laying) whilst wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

##Cleaning the data and creating the tidy datafile
Please read the [README.md] file. 

##Description of the variables 
* features <- features.txt : 561 rows, 2 columns 
  *The features selected for this database come from the accelerometer and gyroscope.
* activities <- activity_labels.txt : 6 rows, 2 columns 
  * List of activities performed when the corresponding measurements were taken and its codes (labels). The 6 activities are.
  1.WALKING
  2.WALKING_UPSTAIRS 
  3.WALKING_DOWNSTAIRS
  4.SITTING
  5.STANDING
  6.LAYING
* subject_test <- test/subject_test.txt : 2947 rows, 1 column 
  * contains test data of 9/30 volunteer test subjects being observed
* x_test <- test/X_test.txt : 2947 rows, 561 columns 
  * contains recorded features test data
* y_test <- test/y_test.txt : 2947 rows, 1 columns 
  * contains test data of activities’code labels
* subject_train <- test/subject_train.txt : 7352 rows, 1 column 
  * contains train data of 21/30 volunteer subjects being observed
* x_train <- test/X_train.txt : 7352 rows, 561 columns 
  * contains recorded features train data
* y_train <- test/y_train.txt : 7352 rows, 1 columns 
  * contains train data of activities’code labels

