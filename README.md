Getting-and-Cleaning-Data-Course-Project
========================================

Coursera Getting and Cleaning Data Course Project

File: run_analysis.R
Libraries: reshape2
Input Data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
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
