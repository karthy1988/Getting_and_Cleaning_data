Course Project : Human Activity Recognition Using Smartphones Dataset
=====================================================================

Introduction
------------
This repository contains the following files :

1. README ( the one you are readng now )
2. Codebook - This describes the features of original dataset and how the transformation were performed as per the course project requirement.
3. run_analysis.R - This is the original R script to process the data as per requirement and produce a tidy data.
4. tidy_data.txt - This file contains the tidy data produced as a output from run_analysis.R script.

Raw data
--------

The 561 features from Human Activity Recognition Using Smartphones Dataset are unlabeled and can be found in the X_test.txt. 
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

Similar explaination goes for the training set as well.

Script and the tidy dataset
---------------------------
The script called run_analysis.R which will merge the test and training sets together.
Prerequisites for this script:

1. the UCI HAR Dataset must be extracted and..
2. the following files should be in the working directory of the user
* X_test.txt
* y_test.txt
* subject_test.txt
* X_train.txt
* y_train.txt
* subject_train.txt
* features.txt

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a space-delimited file called tidy_data.txt, which can also be found in this repository.

Code Book
---------
The CodeBook.md file explains the transformations performed and the resulting variables used to produce the end result.