###Getting and Cleaning Data Week 4 Final Assignment

##Set Working Directory
setwd("~/Documents/Precision Cancer Medicine/R/Coursera_R")

##Install appropriate packages
install.packages("dplyr")
install.packages("data.table")

##Load packages
library(dplyr)
library(data.table)

##Download Data
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile = "./data/runfile.zip", method = "curl")
data <- unzip("./data/runfile.zip")

##Read all data frames
#Read activity labels
activities <- read.table("./activity_labels.txt", col.names = c("code", "activity"))

#Read data description
features <- read.table("./features.txt", col.names = c("n","functions"))

#Read test data
subject_test <- read.table("-/test/subject_test.txt", col.names = "subject")
x_test <- read.table("./test/X_test.txt", col.names = features$functions)
y_test <- read.table("./test/y_test.txt", col.names = "code")

#Read train data
subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
x_train <- read.table("./train/X_train.txt", col.names = features$functions)
y_train <- read.table("./train/y_train.txt", col.names = "code")

##1. Merge the training and the test sets to create one data set.
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)
subject_all <- rbind(subject_train, subject_test)
merge_data <- cbind(subject_all, y_all, x_all)

##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
ex_data <- Mmerge_data %>% select(subject, code, contains("mean"), contains("std"))

##3. Uses descriptive activity names to name the activities in the data set
ex_data$code <- activities[ex_data$code, 2]

##4. Appropriately labels the data set with descriptive variable names.
names(ex_data)[2] = "activity"
names(ex_data) <-gsub("Acc", "Accelerometer", names(ex_data))
names(ex_data) <-gsub("Gyro", "Gyroscope", names(ex_data))
names(ex_data) <-gsub("BodyBody", "Body", names(ex_data))
names(ex_data) <-gsub("Mag", "Magnitude", names(ex_data))
names(ex_data) <-gsub("^t", "Time", names(ex_data))
names(ex_data) <-gsub("^f", "Frequency", names(ex_data))
names(ex_data) <- gsub("Freq", "Frequency", names(ex_data))
names(ex_data) <- gsub("mean", "Mean", names(ex_data))
names(ex_data) <- gsub("std", "StandardDeviation", names(ex_data))


##5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
SecondData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_each(funs(mean))

#Save new dataset 
write.table(SecondData, file = "SecondData.txt", row.name=FALSE, col.names = TRUE)


####Create a second, independent tidy data set with the average of each variable for each activity and each subject
SecondDataSet<-aggregate(. ~Subject + Activity, DataSet, mean)
SecondDataSet<-SecondDataSet[order(SecondDataSet$Subject,SecondDataSet$Activity),]







