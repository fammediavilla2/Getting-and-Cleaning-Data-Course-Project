# Getting and Cleaning Data Course Project
# Francis A. Mendez
# June 20, 2014

# Website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Libraries
library(reshape2)



# Read data

(WD <- getwd()) # Everything on desktop
setwd(paste(WD,"/UCI HAR Dataset/train", sep=""))

# Reads the training set
dat.train<-read.table(file="X_train.txt",
                      sep="")

# Reads the response set
dat.train.y<-read.table(file="y_train.txt",
                      sep="")

# Reads the subjects set
dat.train.sub<-read.table(file="subject_train.txt",
                        sep="")

setwd(paste(WD,"/UCI HAR Dataset/test", sep=""))

# Reads the testing set
dat.test<-read.table(file="X_test.txt",
                      sep="")

# Reads the response set
dat.test.y<-read.table(file="y_test.txt",
                        sep="")

# Reads the subjects set
dat.test.sub<-read.table(file="subject_test.txt",
                          sep="")

setwd(paste(WD,"/UCI HAR Dataset/", sep=""))

# Reads the features set
dat.names<-read.table(file="features.txt",
                         sep="")

# Delete V1 from the features set; V1 is an enumeration
dat.names<-subset(dat.names,V2==V2,select=-V1)

setwd(WD)

# Merges the training and the test sets to create one data set.
# 'train/X_train.txt': Training set.
# 'test/X_test.txt': Test set.
# 'y_training.txt': Training activities
# 'y_test.txt': Testing activities
# 'subject_training.txt': Training subjects
# 'subject_test.txt': Test subjects

dat <- rbind(dat.train,dat.test)
dat.y<-rbind(dat.train.y,dat.test.y)
dat.sub<-rbind(dat.train.sub,dat.test.sub)

# Select only mean measurements and standard deviations
# steps of size 40
# Choose 6
# until 201 where you choose 2
# now add 13
# at 266 choose 6
# 345 choose 6
# 424 choose 6
# 503 choose 2
# 516 choose 2
# 529 choose 2
# 542 c 2

# Choose variable with measurements for means and standard deviations
selection<-c("V1", "V2", "V3", "V4", "V5", "V6",
  "V41", "V42", "V43", "V44", "V45", "V46",
  "V81", "V82", "V83", "V84", "V85", "V86",
  "V121", "V122", "V123", "V124", "V125", "V126",
  "V161", "V162", "V163", "V164", "V165", "V166",
  "V201","V202",
  "V214", "V215",
  "V227","V228",
  "V240","V241",
  "V253","V254",
  "V266", "V267", "V268", "V269", "V270", "V271",
  "V345", "V346", "V347", "V348", "V349", "V350",
  "V424", "V425", "V426", "V427", "V428", "V429",
  "V503", "V504",
  "V516", "V517",
  "V529", "V530",
  "V542", "V543")


# Dataset with measurements for means and sd
dat2<-subset(dat,V1==V1,select=selection)

#recode dat.y; Activities
dat.y[dat.y$V1==1,]<-"WALKING"
dat.y[dat.y$V1==2,]<-"WALKING_UPSTAIRS"
dat.y[dat.y$V1==3,]<-"WALKING_DOWNSTAIRS"
dat.y[dat.y$V1==4,]<-"SITTING"
dat.y[dat.y$V1==5,]<-"STANDING"
dat.y[dat.y$V1==6,]<-"LAYING"

# Merge files with measurements (mean & sd) and activity
dat3<-cbind(dat.y,dat2)

# Merge files with measurements, activity and subjects
dat4<- cbind(dat.sub,dat3)

# Choose variable names for variables with measurements 
# for means and standard deviations
# Choose the corresponding variable index values for the variable names
dat.names.temp<-dat.names[c(1:6,
            41:46,
            81:86,
            121:126,
            161:166,
            201:202,
            214:215,
            227:228,
            240:241,
            253:254,
            266:271,
            345:350,
            424:429,
            503:504,
            516:517,
            529:530,
            542:543),]

# Create an intermediate file to be reshaped
# Incorporate subjects and activity to the main file
dat.names.final <- c("Subject", "Activity", as.vector(dat.names.temp))

# Assign the variable names to the intermediate file
names(dat4)<-dat.names.final

# Create the tidy data file
# Melt the intermediate file; designating "Subject" & "Activity"
# as indicator (categorical) variables for summarization.
# Designate every other variable as measurements, to be summarized as means.
datMelt<-melt(dat4, id=c("Subject", "Activity"), measure.vars=as.vector(dat.names.temp))

# Summarize each measurement variable (mean) by Subject and Activity
tidyData<-dcast(datMelt, Subject+Activity~variable, mean)

# Write a tab-delimited tidy data file to disk.
write.table(tidyData,
            file="output.txt",
            row.names=F,
            sep="\t")