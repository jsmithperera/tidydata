# Wearable computing: Creating a tidy data set for the Samsung project 

Wearable computing - colleting data from user's mobiles and apps - is of the most exiting areas of development in data science. In this project, we take a look at one such data from Samsung in order to create a tidy data set, a first step in data analysis.

This project comprises three elements:

1.- A tidy data set created from the raw data.

2.- An R script, under the name run_analysis.R, that produces the tidy data set.

3.- A CodeBook.md which describes the variables, initial and final, and the transformations carried out from the raw data.

## The raw data

The raw data for the project was downloaded from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

And full description of the data, according to the instructions, is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## The R script 

The R script performed the following steps:

0.- Download the raw data.

1.- Merges the training and the test sets into one file.

2.- Selects variable names that contain the word "mean", "std" or "Mean"and creates a new dataset.

3.- Replaces the activity number by its descriptive value.

4.- Rewrites variable names with descriptive names.

5.- Creates a tidy dataset that, for each subject and each activity, calculates the average of each feature variable.

## What is a tidy data set?

A tidy data set is caracterized as follows, according to professor Jeff Leek from Johns Hopkins Bloomberg School of Public Health:

1.- Each variable should be in one column

2.- Each observation should be in a different row

3.- "One table for each "kind" of variable. And if you have multiple tables, they should include a column in the table that allows them to be linked".
