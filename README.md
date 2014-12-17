Getting and Cleaning Data Course Project
================

# run_analysis.R

run_analysis.R does the following:
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names. 

From the data set created above, run_analysis.R then:
 - creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
# Preconditions

In the same working directory of run_analysis.R, the script expects at least one of the following to be present:
 - "getdata-projectfiles-UCI HAR Dataset.zip" - file supplied by the instructor
 - "UCI HAR Dataset" - the contents of the zip file above, a folder with the test and training data
 
The script also expects the following packages to be installed:
 - dplyr
 - reshape2
 
# Running the script

The script will display messages such as the following as it progresses:

~~~~
  > source("run_analysis.R")
  [1] "Getting activities"
  [1] "Getting features"
  [1] "Getting training readings"
  [1] "Getting training activities"
  [1] "Getting training subjects"
  [1] "Merging training data"
  [1] "Trimming training variables to means and standard deviations"
  [1] "Getting test readings"
  [1] "Getting test activities"
  [1] "Getting test subjects"
  [1] "Merging test data"
  [1] "Trimming test variables to means and standard deviations"
  [1] "Merging training and test data"
  [1] "Creating tidy dataset..."
  [1] "Writing tidy dataset to tidy.txt"
  [1] "Done"
~~~~

# Postconditions

The script will complete and produce a file "tidy.txt" in the same working directory as run_analysis.R

The structure of tidy.txt is of a 4-column CSV file where the columns are:
 - Subject ID from the test or training datasets
 - Activity textual description 
 - Variable that is being measured
 - Mean value of all measurements for the given subject, activity, and variable
 
Please see CodeBook.md for further details