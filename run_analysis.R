library(reshape2)
library(dplyr)

# Merges the training and the test sets to create one data set. 
# Only measurements with "mean" or "std" in the name are saved. 
# The original measurement names are retained for consistency and clarity.
# Activity numbers are replaced with the activity factor names for clarity.
# A final "tidy" dataset is output that contains the average of each variable 
# for a given subject and activity, sorted by subject and activity.

zipFile <- "getdata-projectfiles-UCI HAR Dataset.zip"
dirName <- "UCI HAR Dataset"

# If the directory does not exist, then check for the zip file and unzip it
# Otherwise, complain
if (file.exists(zipFile) && !file.exists(dirName)){
  print(sprintf("Unzipping %s", zipFile))
  unzip(zipFile)
} else if (!file.exists(zipFile) && !file.exists(dirName)){
  stop("Could not find zip file or directory for untidy data")
}

# Remember the current working directory, so it can be restored later
wd <- getwd()
setwd(dirName)

# Read activities and features
print("Getting activities")
activityLabels <- read.table(file = "activity_labels.txt", header = FALSE, col.names = c("ID", "Activity"))
print("Getting features")
features <- read.table("features.txt", header = FALSE, sep = " ")[,2]

# Read all training data, merge them into the same table, apply sensible column names,
# replace activity numbers with factors, and trim to only the variables we care about
print("Getting training readings")
xTrain <- read.table("train/X_train.txt", header = FALSE, sep = "")
names(xTrain) <- features
print("Getting training activities")
yTrain <- read.table("train/y_train.txt", header = FALSE, sep = "")
print("Getting training subjects")
subTrain <- read.table("train/subject_train.txt", header = FALSE, sep = "")
print("Merging training data")
train <- cbind(subTrain, yTrain, xTrain)
names(train)[1:2] <- c("Subject", "Activity")
train$Activity <- factor(train$Activity, labels = activityLabels$Activity)
print("Trimming training variables to means and standard deviations")
trainTrimmed <- train[,c(1,2,grep("mean|std",colnames(train)))]

# Read all test data, merge them into the same table, apply sensible column names,
# replace activity numbers with factors, and trim to only the variables we care about
print("Getting test readings")
xTest <- read.table("test/X_test.txt", header = FALSE, sep = "")
names(xTest) <- features
print("Getting test activities")
yTest <- read.table("test/y_test.txt", header = FALSE, sep = "")
print("Getting test subjects")
subTest <- read.table("test/subject_test.txt", header = FALSE, sep = "")
print("Merging test data")
test <- cbind(subTest, yTest, xTest)
names(test)[1:2] <- c("Subject", "Activity")
test$Activity <- factor(test$Activity, labels = activityLabels$Activity)
print("Trimming test variables to means and standard deviations")
testTrimmed <- test[,c(1,2,grep("mean|std",colnames(test)))]

# Combine test and training data together
print("Merging training and test data")
testAndTrainTrimmed <- rbind(trainTrimmed,testTrimmed)

# Reshape the data to allow easier summarization. 
print("Creating tidy dataset...")
melted <- melt(testAndTrainTrimmed, id.vars = c(1,2))
grouped <- group_by(tbl_df(melted), Subject, Activity, variable)
summarized <- summarize(grouped, mean(value))
names(summarized)[3:4] <- c("Variable", "Mean Value")
print("Writing tidy dataset to tidy.csv")
setwd(wd)
write.table(summarized, file = "tidy.csv", row.names = FALSE, sep = ",")

print("Done")