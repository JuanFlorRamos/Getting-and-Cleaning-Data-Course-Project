# Code Book
Data Frames:
- 'features': List of all features.

- 'train': data frame training set with descriptive variable names.
- 'test': data frame test set with descriptive variable names.

- 'train_labels': data frame training labels.
- 'test_labels': data frame test labels.

- 'train': combine by columns, data frames 'train' with 'train_labels'
- 'test': combine by columns, data frames 'test' with 'test_labels'

- 'train_subject': data frame of subjects who performed the activity for each window sample for the train data.
- 'test_subject': data frame of subjects who performed the activity for each window sample for the test data.

- 'train2': combine by columns, data frames 'train' with 'train_subjects'
- 'test2': combine by columns, data frames 'test' with 'test_subjects'

- 'merge_train_test': combine by rows, data frames 'train2' with 'test2'

- 'activity_labels': data frame of the class labels with their activity name.
- 'activity': factor of the match merge_train_test$label and activity_labels$label
- 'merge_train_test': add 'activity' column to 'merge_train_test'

- 'col_mean': search 'mean' for matches within each variable names.
- 'col_std': search 'std' for matches within each variable names.

- 'measurement_mean_std': select only the measurements on the mean and standard deviation for each measurement.

- 'second_data': select mean, standard deviation, 'activity' and 'subject' columns of data frame 'merge_train_test'

- 'second_data_average': group by activity and subject columns, then create then average of each variable for each activity and each subject.
