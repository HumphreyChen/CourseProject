## Requirement 1: Merges the training and the test sets to create one data set.
# read X-train.txt
training_data_features <- read.table("X_train.txt")
# read y-train.txt
training_data_label <- read.table("y_train.txt")
# read subject-train.txt
training_data_subject <- read.table("subject_train.txt")
# read X-test.txt
testing_data_features <- read.table("X_test.txt")
# read y-test.txt
testing_data_label <- read.table("y_test.txt")
# read subject-test.txt
testing_data_subject <- read.table("subject_test.txt")
# merge training and testing data by row binding function
feature_data <- rbind(training_data_features, testing_data_features)
label_data <- rbind(training_data_label, testing_data_label)
subject_data <- rbind(training_data_subject, testing_data_subject)


## Requirement 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# read the names of feature vectors
feature_name <- read.table("features.txt")
# acquire the indices of those mean- and std-related measurements
target_f_idx <- grep("(mean|std)\\(\\)",feature_name[, 2])
# rewrite the feature data set by the mean- and std-related measurements
feature_data <- feature_data[, target_f_idx]
# set the names of columns
colnames(feature_data) <- gsub("-", "", feature_name[target_f_idx, 2])
colnames(feature_data) <- gsub("\\(\\)", "_", colnames(feature_data))

## Requirement 3: Uses descriptive activity names to name the activities in the data set
# read the names of activities
activity_name <- read.table("activity_labels.txt")
# replace the scalar values with the corresponding activiy names
label_data[,1] <- activity_name[label_data[, 1], 2]
# assign the column name for the label_data
colnames(label_data) <- "activity"


## Requirement 4: Appropriately labels the data set with descriptive variable names. 
# set the column name for the subject data
colnames(subject_data) <- "subject"
# merge all the information into one data set (as the Requirement #1) by column binding function
MergedData <- cbind(label_data, subject_data, feature_data)


## Requirement 5: From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
library(dplyr)
# data summarize by groups
ndata <- ddply(MergedData, c("activity", "subject"), numcolwise(mean))
# modify the column names to be matched to "average" variables
colnames(ndata)[3:ncol(ndata)] <- paste("average", colnames(ndata)[3:ncol(ndata)])
# ouput the summarized tidy data set as a txt file
write.table(ndata, "average_features_in_groups.txt", row.name = FALSE)
# just for facilitating visually checking
write.csv(ndata, file = "average_features_in_groups.csv")
