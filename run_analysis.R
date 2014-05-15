##Be sure to set your wd first
##setwd("C:/Users/agessert/Dropbox/Coursera/Getting and Cleaning Data")

##Be sure to download the file and unzip it without creating a new folder
##There should be a folder in your working directory titled "UCI HAR Dataset"
##with all unzipped files inside
##Sample script if you need to download and unzip
##fileURL<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
##download.file(fileURL, destfile = "proj.zip")
##unzip("proj.zip")

label<-read.table("UCI HAR Dataset/features.txt", sep="")
label<-label[[2]]

test<-read.table("UCI HAR Dataset/test/X_test.txt", sep="")
train<-read.table("UCI HAR Dataset/train/X_train.txt", sep="")
stest<-read.table("UCI HAR Dataset/test/subject_test.txt", sep="", col.names="subject")
strain<-read.table("UCI HAR Dataset/train/subject_train.txt", sep="", col.names="subject")
atest<-read.table("UCI HAR Dataset/test/y_test.txt", sep="", col.names="activity")
atrain<-read.table("UCI HAR Dataset/train/y_train.txt", sep="", col.names="activity")

colnames(test)<-label
colnames(train)<-label
test<-cbind(test,subject=stest, activity=atest, source="test")
train<-cbind(train,subject=strain, activity=atrain, source="train")
mydata<-rbind(test,train)
nmydata<-cbind(mydata[grepl("mean", colnames(mydata))],mydata[grepl("std", colnames(mydata))],mydata[,c("subject","activity","source")])

nmydata[,"activity"]<-factor(nmydata[,"activity"],labels=c("Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying"))

tidymydata<-aggregate(nmydata[,1:79],nmydata[80:81],FUN="mean")

colnames(tidymydata)<-gsub("\\(","",colnames(tidymydata))
colnames(tidymydata)<-gsub("\\)","",colnames(tidymydata))
colnames(tidymydata)<-gsub("\\-","",colnames(tidymydata))
colnames(tidymydata)<-tolower(colnames(tidymydata))

write.table(tidymydata, "tidymydata.txt", sep="\t")

