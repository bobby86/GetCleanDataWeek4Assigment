# Coursera: Getting and Cleaning Data Course Final Project.
# creating a Tidy DataSet

# Section: 1
# Understanding the multiple text files.

# Section: 1.1
# Understanding Common text files in the "UCI HAR Dataset" folder

ActivityLabels <- read.table("./activity_labels.txt", header = FALSE)
View(ActivityLabels)    # contains 6 types os activities measured

Features <- read.table("./features.txt", header = FALSE)
View(Features)  # contains variable names for 561 types of computed data

# Section: 1.2.1
# Understanding text files in the "test" folder
SubTest <- read.table("./test/subject_test.txt", header = FALSE, sep = " ")
library(dplyr)  # loading the "dplyr" package to use the distinct() function
distinct(SubTest)   # Identify the distinct vaules in the variable
summary(SubTest)    # contains 9 different subject Ids whose Measurements are used as test Data
names(SubTest) <- "SubjectId"   # naming the variable as "SubjectId"

XTest <- read.table("./test/X_test.txt", header = FALSE)
str(XTest)
summary(XTest)  # contains 561 computed variables for the test data.
names(XTest) <- Features[,2]     # naming the computed variables using the names data from Features

YTest <- read.table("./test/y_test.txt", header = FALSE)
str(YTest)
summary(YTest)  # contains 6 different Activity Ids that were measured in test Data
names(YTest) <- "ActivityId"    # naming the variable as "ActivityId"

# Section: 1.2.2
# Understanding text files that contain raw data in the "test/Inertial Signals" folder
# the first three letters of the variables are abbreviated from the file names that are 
# being read into the variable which intern have been named after the measurement
# each observation contains 128 sampling intervals for the measurement
# str() function is used to understand the data read in to the varaible

baxTest <- read.table("./test/Inertial Signals/body_acc_x_test.txt", header = FALSE)
str(baxTest)

bayTest <- read.table("./test/Inertial Signals/body_acc_y_test.txt", header = FALSE)
str(bayTest)

bazTest <- read.table("./test/Inertial Signals/body_acc_z_test.txt", header = FALSE)
str(bazTest)

bgxTest <- read.table("./test/Inertial Signals/body_gyro_x_test.txt", header = FALSE)
str(bgxTest)

bgyTest <- read.table("./test/Inertial Signals/body_gyro_y_test.txt", header = FALSE)
str(bgyTest)

bgzTest <- read.table("./test/Inertial Signals/body_gyro_z_test.txt", header = FALSE)
str(bgzTest)

taxTest <- read.table("./test/Inertial Signals/total_acc_x_test.txt", header = FALSE)
str(taxTest)

tayTest <- read.table("./test/Inertial Signals/total_acc_y_test.txt", header = FALSE)
str(tayTest)

tazTest <- read.table("./test/Inertial Signals/total_acc_z_test.txt", header = FALSE)
str(tazTest)

# Section: 1.3.1
# Understanding text files in the "train" folder
SubTrain <- read.table("./train/subject_train.txt", header = FALSE, sep = " ")
distinct(SubTrain)   # Identify the distinct vaules in the variable
summary(SubTrain)    # contains 9 different subject Ids whose Measurements are used as Train Data
names(SubTrain) <- "SubjectId"   # naming the variable as "SubjectId"

XTrain <- read.table("./train/X_train.txt", header = FALSE)
str(XTrain)
summary(XTrain)  # contains 561 computed variables for the Train data.
names(XTrain) <- Features[,2]     # naming the computed variables using the names data from Features

YTrain <- read.table("./train/y_train.txt", header = FALSE)
#str(YTrain)
summary(YTrain)  # contains 6 different Activity Ids that were measured in Train Data
names(YTrain) <- "ActivityId"    # naming the variable as "ActivityId"

# Section: 1.3.2
# Understanding text files that contain raw data in the "train/Inertial Signals" folder
# the first three letters of the variables are abbreviated from the file names that are 
# being read into the variable which intern have been named after the measurement
# each observation contains 128 sampling intervals for the measurement
# str() function is used to understand the data read in to the varaible

baxTrain <- read.table("./train/Inertial Signals/body_acc_x_train.txt", header = FALSE)
str(baxTrain)

bayTrain <- read.table("./train/Inertial Signals/body_acc_y_train.txt", header = FALSE)
str(bayTrain)

bazTrain <- read.table("./train/Inertial Signals/body_acc_z_train.txt", header = FALSE)
str(bazTrain)

bgxTrain <- read.table("./train/Inertial Signals/body_gyro_x_train.txt", header = FALSE)
str(bgxTrain)

bgyTrain <- read.table("./train/Inertial Signals/body_gyro_y_train.txt", header = FALSE)
str(bgyTrain)

bgzTrain <- read.table("./train/Inertial Signals/body_gyro_z_train.txt", header = FALSE)
str(bgzTrain)

taxTrain <- read.table("./train/Inertial Signals/total_acc_x_train.txt", header = FALSE)
str(taxTrain)

tayTrain <- read.table("./train/Inertial Signals/total_acc_y_train.txt", header = FALSE)
str(tayTrain)

tazTrain <- read.table("./train/Inertial Signals/total_acc_z_train.txt", header = FALSE)
str(tazTrain)

# Section 2:
# Creating a Raw dataset containing all the measurements.

# creating a vector SampleNames to name the sample intervals. 
SampleNames <- paste(rep("Sample",128), as.character(c(1:128)), sep = "")

# same variable names are assigned to all the Test datasets.
names(baxTest) <- SampleNames
names(bayTest) <- SampleNames
names(bazTest) <- SampleNames
names(bgxTest) <- SampleNames
names(bgyTest) <- SampleNames
names(bgzTest) <- SampleNames
names(taxTest) <- SampleNames
names(tayTest) <- SampleNames
names(tazTest) <- SampleNames

# assigning subjectId, ActivityId and MeasurementId to a given measurement dataset
# measuremnt ids 1 to 9 are assigned to each of the 9 inertial signals(measurements)
baxTest <- cbind(SubTest, YTest, "MeasurementID"=rep(1, nrow(YTest)), baxTest)
bayTest <- cbind(SubTest, YTest, "MeasurementID"=rep(2, nrow(YTest)), bayTest)
bazTest <- cbind(SubTest, YTest, "MeasurementID"=rep(3, nrow(YTest)), bazTest)
bgxTest <- cbind(SubTest, YTest, "MeasurementID"=rep(4, nrow(YTest)), bgxTest)
bgyTest <- cbind(SubTest, YTest, "MeasurementID"=rep(5, nrow(YTest)), bgyTest)
bgzTest <- cbind(SubTest, YTest, "MeasurementID"=rep(6, nrow(YTest)), bgzTest)
taxTest <- cbind(SubTest, YTest, "MeasurementID"=rep(7, nrow(YTest)), taxTest)
tayTest <- cbind(SubTest, YTest, "MeasurementID"=rep(8, nrow(YTest)), tayTest)
tazTest <- cbind(SubTest, YTest, "MeasurementID"=rep(9, nrow(YTest)), tazTest)

# Creating a Dataset containg all the Raw Test Data.
RawTestData <- rbind(baxTest, bayTest, bazTest, bgxTest, bgyTest, bgzTest, taxTest, tayTest, tazTest)

# same variable names are assigned to all the Train datasets.
names(baxTrain) <- SampleNames
names(bayTrain) <- SampleNames
names(bazTrain) <- SampleNames
names(bgxTrain) <- SampleNames
names(bgyTrain) <- SampleNames
names(bgzTrain) <- SampleNames
names(taxTrain) <- SampleNames
names(tayTrain) <- SampleNames
names(tazTrain) <- SampleNames

# assigning subjectId, ActivityId and MeasurementId to a given measurement dataset
# measuremnt ids 1 to 9 are assigned to each of the 9 inertial signals(measurements)
baxTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(1, nrow(YTrain)), baxTrain)
bayTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(2, nrow(YTrain)), bayTrain)
bazTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(3, nrow(YTrain)), bazTrain)
bgxTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(4, nrow(YTrain)), bgxTrain)
bgyTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(5, nrow(YTrain)), bgyTrain)
bgzTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(6, nrow(YTrain)), bgzTrain)
taxTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(7, nrow(YTrain)), taxTrain)
tayTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(8, nrow(YTrain)), tayTrain)
tazTrain <- cbind(SubTrain, YTrain, "MeasurementID"=rep(9, nrow(YTrain)), tazTrain)

# Creating a Dataset containg all the Raw Train Data.
RawTrainData <- rbind(baxTrain, bayTrain, bazTrain, bgxTrain, bgyTrain, bgzTrain, taxTrain, tayTrain, tazTrain)

# Creating the complete Raw Dataset by row binding Test and Train Data
CompleteRawData <- rbind(RawTestData, RawTrainData)

# Writing the Raw Data to a File
write.table(CompleteRawData, "./UCI_HARUS_RawData.txt")

# Section 3:
# Creating a Computed dataset containing all the computed variables

# assigning subjectId, ActivityId to a given obseravtion of the computed Test dataset
ComputedTestData <- cbind(SubTest, YTest, XTest)

# assigning subjectId, ActivityId to a given obseravtion of the computed Train dataset
ComputedTrainData <- cbind(SubTrain, YTrain, XTrain)

# Creating the complete Computed Dataset by row binding Test and Train Data
CompleteComputedData <- rbind(ComputedTestData, ComputedTrainData)

# Writing the computed Data to a File
write.table(CompleteComputedData, "./UCI_HARUS_CompleteComputedData.txt")

# Section 4:
# subsetting all the columns that have "mean" in the variable name along with the Subject and Activity Ids
ComputedDataWithMean <- CompleteComputedData[ , c(1, 2, grep("mean", names(CompleteComputedData), ignore.case = TRUE))]

# subsetting all the columns that have "std" (Standard Deviation) in the variable name along with the 
# Subject and Activity Ids
ComputedDataWithStd <- CompleteComputedData[ , c(1, 2, grep("std", names(CompleteComputedData), ignore.case = TRUE))]

# subsetting all the columns that have either "mean" or "std" (Standard Deviation) in the variable name 
# along with the Subject and Activity Ids
ExtractedData <- CompleteComputedData[ , c(1, 2
                                           , grep("mean", names(CompleteComputedData), ignore.case = TRUE)
                                           , grep("std", names(CompleteComputedData), ignore.case = TRUE)
                                           )]
# Checking the Dimensions of the ExtractedData
dim(ExtractedData)
class(ExtractedData)

#Writing the Data to a .txt file
write.table(ExtractedData, "./UCI_HARUS_TidyDataWithMeansAndStds.txt")

# Section 5:
# Assigning the Descriptive Activity names to the ExtractedData using the labels provided in activity.txt
ExtractedData$ActivityId <- factor(ExtractedData$ActivityId, 1:6, labels = ActivityLabels[,2])

# Changing the variable name From "ActivityId" to "ActivityName" as the numbers in the factors were 
# assigned labels
names(ExtractedData)[2] <- "ActivityName"

#Checking the Variable Names.
names(ExtractedData)[1:10]
head(ExtractedData)

# Section 6:
# Calculating the Average of each variable for the Extracted Data.
library(dplyr)
AveragedData <- ExtractedData %>% group_by(SubjectId, ActivityName) %>% summarise_each(funs(sum))

#Checking Averaged Data
head(AveragedData)

#Writing the Data to a .txt file
write.table(AveragedData, "./UCI_HARUS_TidyDataWithAveragedVariables.txt")
