#Summary of program run_analysis.R
##Prep
* Be sure to download the sample data file and unzip it without creating a new folder
* Make sure your working directory is set to that folder
* There should be a folder in your working directory titled "UCI HAR Dataset" with unzipped files in a folder structure inside it
* If you need to download and unzip the file, you can use the below script:

fileURL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "proj.zip")
unzip("proj.zip")

##Primary steps within code
* Read in the field labels from the features.txt file and remove the first column
* Read in the X_test, X_train, subject_test, subject_train, y_test, and y_train files
* Set the column names of the subject_ files to "subject"
* Set the column names of the y_ files to "activity"
* Assign the field names contained within the features.txt file to the test and train files
* Bind together the primary test and then train files with their associated activity and subject files
* Add a new field to the end of the dataset to show the file source (train or test)
* Bind together the train and test datasets
* Limit the dataset to only columns that contain the word "mean" or "std" as well as the subject/activity/source columns
* Create the tidy dataset by taking the mean of the numeric columns grouped by the subject and activity
* Clean up the field names by making them lowercase and removing special characters
* Output a tab delimited file