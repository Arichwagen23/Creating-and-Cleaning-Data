######Code Book
Coursera: Getting and Cleaning Data, Course Project.

######Input Data
The run_analysis.R script downloads processes the zipped UCI HAR dataset file.

######Output Data
The tidy_data.txt file contains a data set with 180 rows and 81 columns with the following variables but excludes specific rows/columns to avoid the NAs:

subject - id of the voluntering person.
activity - a physical performance done by the volunteer (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
79 columns of mean values of accelerometer and gyroscope measurements (further details can be found in original UCI HAR dataset).
Data Transformations
The run_analysis.R script does the following:

#######Downloads the UCI HAR zip file
Unzips the UCI HAR dataset
Binds three columns of train and test data set to a data frame.
Merges the train and test data frame into a single one all.data.
Extracts the measurements on the mean and standard deviation for each measurement.
Replaces the data frames activity IDs with descriptive activity names.
Labels the data set with appropriate, descriptive variable names.
Creates a second, independent tidy data set with and summarizes the average of each variable for each activity and each subject.
Writes the tidy data set to file tidy_data.txt.
