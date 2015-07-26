# Getting-Cleaning-Data Code Book

The run_analysis.R is accrding to the instruction as mentioned in the Project:

1.Merges the training and the test sets to create one data set.
	Therefore, following that, I have:
	Merged subject(subejct_test, subject_train) onto merge_subject, 
	features (X-test and X_train) onto merge_features and 
	activity (y_test and y_train) onto merge_activity.

2. Extracts only the measurements on the mean and 
	standard deviation (std) for each measurement. 
	Here, I observed only merge_features have the mean & std
	and thus loading onto R the features column names 
	(omiting the non-mean, and non-std column) onto merge_features.

3. Uses descriptive activity names to name the activities in the data set
	Activity names is properly labeled in activity_labels.txt.
	I substituted them in merge_activity.
	
4. Appropriately labels the data set with descriptive variable names. 
	Nothing much. just renaming column in merge_suject to "Subject"
	and renaming column in merge_activity to "Activity"

5. From the data set in step 4, creates a second, independent tidy data set 
	with the average of each variable for each activity and each subject.
	the full tidy data set is assign to tidyData. The second tidy data (tidyData2)
	is introduced as a subset from tidyData with average for each activity and subject.