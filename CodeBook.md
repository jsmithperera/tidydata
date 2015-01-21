## Codebook for the Samsung project 


The raw data for the Samsung project was downloaded from the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

And full description of the data is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# The raw data 

The raw data file is downloaded into a subdirectory called UCI HAR Dataset within the directory data. It contains two subdirectores (test and train) and four files: 

1.- A README file describing the data.

2.- Activity_labels, which describe the six categories of activities performed by the subjects. They are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. Each activity was labeled with numbers from 1 through 6, respectively.

3.- A features_info file describing the 561 features variables and how they were generated from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ taken from the Samsung phones.

4.- A features file naming the 561 initial features varables according with the conventions set in the features_info file. 

5.- A subdirectory "test" containing 2.947 observations in three files and a subdirectory - Initial Signals- which was not used. The files are:

5.1.- subject_test with 2.947 observations spanning 9 subjects (2, 4, 9, 10, 12, 13, 18, 20 y 24)

5.2.- y_test with 2.947 spanning all six activities

5.3.- X-test, with the 2.947 observations and the 261 features.

Out of these file we created one data set merging the three files.

6.- A subdirectory "train" with 7.352 observations and equivalent files as in "test". Out of these file we created one data set merging the three files.

Finally, we marge both data sets into one.

# Data transformation 

We created one data set merging the test and train sets

1.- Changed variable names with ilegal naming conventions according to the R Style Guide. We follow the conventions given here:  https://googlestyleguide.googlecode.com/svn/trunk/Rguide.xml. The changes were as follows. Replace the "-" with ".";"(" with ".", and eliminate from the names  ",";"()" and ")". We also replaced those variables with "BodyBody" to "Body".

2.- Deleted 84 variables that were duplicated in the raw data.

3.- Selected out of the features varibles not eliminated only those the represented a mean or a standard deviation-type. They were identified by having the words "mean", "Mean" and "std" in their names. These resulted in the selection of 86 features names.

4.- Finally, we took the resulting data set and add one more tranformation: Per subject and per activity, we calculated the mean per feature. This resulted in a 180x88 tidy data set. 



