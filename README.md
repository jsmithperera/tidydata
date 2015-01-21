## Wearable computing: Creating a tidy data set for the Samsung project 

Wearable computing - that is, colleting data from user's mobiles and apps - is of the most exiting areas of development in data science. In this project, we take a look at one such data from Samsung to create a tidy data set,  a first step in a data analysis.

This project generated four elements:

1.- A tidy data set created from the raw data.

2.- An R script, under the name run_analysis.R, that produces the tidy data set.

3.- This file, README.md, that explains how the elements work together, and

4.- A CodeBook.md which describes the variables, initial and final, and the transformations carried out from teh raw data.

# The data

The raw data for the project was downloaded from the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

And full description of the data, according to the instructions, is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The R script 

The R script performed the following steps:

1.- Merges the training and the test sets.

2.- Select variable names that contain the word "mean", "std" or "Mean"and create a new dataset.

3.- Replace the activity number by its descriptive value..

4.- Rewrite variable names with descriptive names

5.- Create a tidy dataset that, for each subject and each activity, calculates the average of each
feature variable.



