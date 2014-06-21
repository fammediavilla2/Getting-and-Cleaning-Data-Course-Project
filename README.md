Getting-and-Cleaning-Data-Course-Project
========================================

Coursera Getting and Cleaning Data Course Project

File: run_analysis.R
Libraries: reshape2
Input Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
output: output.txt, tab-delimited file


When executed the code performs the following tasks:
1. Reads data
	a. reads a training set: X_train.txt only features (space delimited)
	b. reads a training response set: y_train.txt (space delimited)
	c. reads a training subject set: subject_train.txt only subjects (space delimited)
	d. reads a testing set: X_test.txt only features (space delimited)
	e. reads a testing response set: y_test.txt (space delimited)
	f. reads a testing subject set: subject_test.txt only subjects (space delimited)
	g. reads a features set: features.txt only feature names (space delimited)
2. Merges the training and the test sets to create one data set.
	a. 'train/X_train.txt': Training set.
	b. 'test/X_test.txt': Test set.
	c. 'y_training.txt': Training activities
	d. 'y_test.txt': Testing activities
	e. 'subject_training.txt': Training subjects
	f. 'subject_test.txt': Test subjects
3. Select only mean measurements and standard deviations from the feature values file.
	Location in the file:
	Take steps of size 40 and choose 6 variables until var201 where you choose 2
	now add 13, at 266 choose 6; 345 choose 6; 424 choose 6; 503 choose 2;
	516 choose 2; 529 choose 2; 542 c 2.
4. Choose variable with measurements for means and standard deviations
5. Create dataset dat2 with measurements for means and sd
6. Recode dat.y; Activities: “WALKING”; “WALKING_UPSTAIRS”; "WALKING_DOWNSTAIRS”;
"SITTING”; "STANDING”; “LAYING"
7. Merge files with measurements (mean & sd) and activity. dat3
8. Merge files with measurements, activity and subjects. dat4
9. Choose variable names for variables with measurements for means and standard deviations.  Choose the corresponding variable index values for the variable names. dat.names.temp

10. Create an intermediate file to be reshaped.
11. Incorporate subjects and activity to the main file.
12. Assign the variable names to the intermediate file
13. Create the tidy data file:
	Melt the intermediate file; designating "Subject" & "Activity"
	as indicator (categorical) variables for summarization.
	Designate every other variable as measurements, to be summarized as means. 
	Summarize each measurement variable (mean) by Subject and Activity
14. Write a tab-delimited tidy data file to disk. output.txt


CODEBOOK:

dat.train: training set. Multivariate, Time-Series, Number of Attributes: 561; Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. Triaxial Angular velocity from the gyroscope. 

dat.train.y: the response set: scale: 1-6

dat.train.sub: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

dat.test: testing set.  Multivariate, Time-Series, Number of Attributes: 561; Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. Triaxial Angular velocity from the gyroscope. 

dat.test.y: response set scale: 1-6

dat.test.sub: the subjects set: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

dat.names: name of features: 1:“WALKING”; 2, “WALKING_UPSTAIRS”; 3, "WALKING_DOWNSTAIRS”; 4, "SITTING”; 5”, STANDING”; 6, “LAYING"


selection  # Choose variable with measurements for means and standard deviations: (“V1", "V2", "V3", "V4", "V5", "V6", "V41", "V42", "V43", "V44", "V45", "V46",  "V81", "V82", "V83", "V84", "V85", "V86", "V121", "V122", "V123", "V124", "V125", "V126", "V161", "V162", "V163", "V164", "V165", "V166",  "V201","V202",  "V214", "V215",  "V227","V228",
  "V240","V241",  "V253","V254",  "V266", "V267", "V268", "V269", "V270", "V271",
  "V345", "V346", "V347", "V348", "V349", "V350",  "V424", "V425", "V426", "V427", "V428", "V429",  "V503", "V504",  "V516", "V517",  "V529", "V530",  "V542", "V543")

dat2:Dataset with measurements for means and sd

dat3: Merged file with measurements (mean & sd) and activity

dat4: Merged file with measurements, activity and subjects

tidyData: Tidy data file Summarize each measurement variable (mean) by Subject and Activity


