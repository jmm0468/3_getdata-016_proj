Getting and Cleaning Data Course Project Code Book
================

# Format

The tidy.txt dataset is a CSV file with four columns.

# Columns

## Column 1: Subject

Identifies the subject who performed the activity. Its range is from 1 to 30. It is unmodifed from the raw data.

## Column 2: Activity

Activity labels for one of the following six factors:
 - WALKING            
 - WALKING_UPSTAIRS   
 - WALKING_DOWNSTAIRS 
 - SITTING            
 - STANDING           
 - LAYING
 
These are mapped from the raw file "activity_labels.txt", which contains an ID and activity label, and the testing data file y_test.txt and the training data file y_train.txt.

Activity labels are substituted in the output tidy dataset by matching activity IDs in the y_*.txt files.

## Column 3: Variable

Feature names from the raw file "features.txt". Only those feature names that contained either "mean" or "std" in their name have been retained, while the others have been discared. 

## Column 4: Mean Value

The mean value of all observations for a particular subject, activity, and variable.

# Sample

The following is a sample of the first few lines of the tidy data:

~~~~
"Subject","Activity","Variable","Mean Value"
1,"WALKING","tBodyAcc-mean()-X",0.277330758736842
1,"WALKING","tBodyAcc-mean()-Y",-0.0173838185273684
1,"WALKING","tBodyAcc-mean()-Z",-0.111148103547368
1,"WALKING","tBodyAcc-std()-X",-0.283740258842105
1,"WALKING","tBodyAcc-std()-Y",0.114461336747368
1,"WALKING","tBodyAcc-std()-Z",-0.260027902210526
1,"WALKING","tGravityAcc-mean()-X",0.935223201473684
1,"WALKING","tGravityAcc-mean()-Y",-0.282165021263158
~~~~
