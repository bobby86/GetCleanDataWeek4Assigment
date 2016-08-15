***********************************************************************************************************************************************************
ReadMe file for Getting and Cleaning Data Course, Week-4 Assignment by Pradeep
***********************************************************************************************************************************************************

the run_analyisis.R file is divided into multiple sections and the scripts that are used to understand the data are also included.
the generic data was processed in section 1. this includes reading Acivity Labels from activity.txt and Variable Names from Features.txt

all the data pertaining to Test cases was processed in section 1.2. computed data was processed in section 1.2.1 and the raw data in section 1.2.2.
the computed data contained in X_test.txt was matched with the Activity being recorded from y_test.txt and the Subject performing the Activity from
subject_test.txt

similarly, all the data pertaining to Train cases was processed in section 1.3. computed data was processed in section 1.3.1 and the raw data in section 1.3.2

the Raw data was processed in sections 1.2.2, 1.3.2 and 2. these sections can be ignored for the purpose of grading as the raw data need not be procecssed
for the assignment. so, further explaination for the raw data processing is not provided. the comments in the code should help if one choose to understand.

Final processing of the computed data was performed in sections 3, 4, 5, and 6.

The Assignment requires to create one R script called run_analysis.R that accomplishes the following 6 Objectives. 
These objectives are achieved in the sections of the code listed below each objective.

##1. Merges the training and the test sets to create one data set.
	Section 1.1 - reading the activity_labels.txt and the features.txt
	Section 1.2.1 - reading the subject_test.txt, x_test.txt and y_test.txt
	Section	1.3.1 - reading the subject_train.txt, x_train.txt and y_train.txt
	Section 3 - preparing the final computed data set. initially the test data and the train data are combined seperately with SubjectId and ActivityId 
			then the are finally row binded together to form the complete dataset "CompleteComputedData"
##2. Extracts only the measurements on the mean and standard deviation for each measurement.
	Section 4 - the measurements that have either "mean" or "std" in the variable name are extracted to a dataset named "ExtractedData"
##3. Uses descriptive activity names to name the activities in the data set
	Section 5 - Descriptive Activity names were assigned to the Data using the labels provided in activity.txt
##4. Appropriately labels the data set with descriptive variable names.
	Section 1.2.1 - Test data variable names are assigned using the descriptions provided in "features.txt" file
	Section 1.3.1 - Train data variable names are also assigned using the descriptions provided in "features.txt" file
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
	Section 6 - "AveragedData" is an independent tidy data set with the average of each variable for each activity and each subject. 
