# Verify directory
if(!file.exists("./data")){dir.create("./data")}
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/Dataset.zip")

# Unzip file Dataset.zip

## 1. Merges the training and the test sets to create one data set.

features <- read.csv("./data/UCI HAR Dataset/features.txt", sep = "", header=FALSE)

train <- read.csv("./data/UCI HAR Dataset/train/X_train.txt", sep = "", header=FALSE)
test  <- read.csv("./data/UCI HAR Dataset/test/X_test.txt", sep = "", header=FALSE)

names(train) <- features$V2
names(test) <- features$V2

train_labels  <- read.csv("./data/UCI HAR Dataset/train/y_train.txt", header=FALSE, col.names = "label")
test_labels  <- read.csv("./data/UCI HAR Dataset/test/y_test.txt", header=FALSE, col.names = "label")

train <- train %>% cbind(train_labels)
test  <- test %>% cbind(test_labels)

train_subject <- read.csv("./data/UCI HAR Dataset/train/subject_train.txt", header=FALSE, col.names = "subject")
test_subject  <- read.csv("./data/UCI HAR Dataset/test/subject_test.txt", header=FALSE, col.names = "subject")

train2 <- train %>% cbind(train_subject)
test2  <- test %>% cbind(test_subject)

merge_train_test = rbind(train2,test2)

activity_labels <- read.csv("./data/UCI HAR Dataset/activity_labels.txt", sep = "", header=FALSE, col.names = c("label","activity"))

activity <- activity_labels$activity[match(merge_train_test$label, activity_labels$label)]
merge_train_test <- merge_train_test %>% cbind(activity)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

col_mean <- grep("mean\\(\\)",names(merge_train_test),value = TRUE)
col_std <- grep("std\\(\\)",names(merge_train_test),value = TRUE)

measurement_mean_std <- merge_train_test[c(col_mean, col_std)]

## 3. Uses descriptive activity names to name the activities in the data set

# I did in part 1 with data frames "activity_labels" and "merge_train_test"

## 4. Appropriately labels the data set with descriptive variable names.

# I did in part 1 with data frames "features", "train" and "test"

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

second_data <- merge_train_test[c(col_mean, col_std, "activity", "subject")]

second_data_average <- second_data %>% group_by(activity,subject) %>% summarise_all(mean)
# second tidy data set
second_data_average

# write.table(second_data_average, file="./data/tidy_data_step5.txt", row.names=FALSE)
