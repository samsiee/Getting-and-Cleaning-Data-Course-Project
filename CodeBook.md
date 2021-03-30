---
title: "run_analysis.R CodeBook "
author: "Sammy Park"
date: "30-03-21"
output: "AverageData.txt

---

## Project Description and collection of the raw data
The experiments were performed with 30 volunteers within the ages of 19 to 48. Each person performed six activities (Walking, Walking_upstairs, Walking_downstairs, 
sitting, standing, laying) whilst wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Cleaning the data and creating the tidy datafile
Please read the [README.md] file. 

## Description of the variables 
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
  * contains test data of volunteers being observed
* subject_train <- test/subject_train.txt : 7352 rows, 1 column 
  * contains train data of volunteers  being observed
* subject_all <- rbind(subject_train, subject_test) : 10299 rows, 1 column
  * contains merged data of subject_train and subject_test
* x_test <- test/X_test.txt : 2947 rows, 561 columns 
  * contains recorded features test data
* y_test <- test/y_test.txt : 2947 rows, 1 columns 
  * contains test data of activities code labels
* x_train <- test/X_train.txt : 7352 rows, 561 columns 
  * contains recorded features train data
* y_train <- test/y_train.txt : 7352 rows, 1 columns 
  * contains train data of activities code labels
* x_all <- rbind(x_train, x_test) : 10299 rows, 561 columns
  * contains merged rows of x_train and x_test
* y_all <- rbind(y_train, y_test) : 10299 rows, 1 column
  * contains merged rows of y_train and y_test
* merge_data <- cbind(subject_all, y_all, x_all) : 10299 rows, 563 columns
  * contains merged columns of subject_all, y_all and x_all
* ex_data <- merge_data %>% select(subject, code, contains("mean"), contains("std")) : 10299 rows, 88 columns
  * dataset of only the mean and standard deviation for each measurement in merge_data
* avg_data <- ex_data %>% group_by(subject, activity) %>% summarise_all(funs(mean)) : 180 rows, 88 columns
  * dataset of the average of each activity and subject frpm ex_data
