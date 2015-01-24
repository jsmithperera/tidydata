# CodeBook for the Samsung project 

The raw data for the Samsung project was downloaded from the following url:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

And full description of the data is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Inside the raw data 

The raw data file was downloaded into a subdirectory called UCI HAR Dataset within the directory data. It contains two subdirectores (test and train) and four files: 

1.- A README file describing the data.

2.- Activity_labels, which describes the six categories of activities performed by the 30 subjects. These activities are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. Each activity was labeled with numbers from 1 through 6, respectively.

3.- A features_info file describing the 561 features variables and how they were generated from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ taken from the Samsung phones.These variables are unitless and range from -1 to +1.

4.- A features file naming the 561 features variables according with the conventions set in the features_info file. 

5.- A subdirectory "test" containing three files and a subdirectory (Initial Signals) which was not used. Each of the three files contains 2.947 observations.  

5.1.- subject_test, identifying a subject per observation. In this case, the subjects came from a list of nine subjects (2, 4, 9, 10, 12, 13, 18, 20 y 24) corresponding to 30% of the subjects.

5.2.- y_test, identifying per observation one of the six activities performed. 

5.3.- X-test, identifying per observation the associated 561 features.

These files were merged into one data set.

6.- A subdirectory "train", which contains 7.352 observations and equivalent files as in "test". The three files were marged into one data set.

Finally, We created one data set merging the test and train sets.

## Data transformation 

1.- Changed features names with ilegal naming conventions according to the R Style Guide (see https://googlestyleguide.googlecode.com/svn/trunk/Rguide.xml). 

The changes were as follows: Replace the "-" with ".";"(" with ".", and eliminate from the names ",";"()" and ")". We also replaced those variables containing the word "Body" twice with one "Body".

2.- Deleted 84 variables that were duplicated in the raw data.

3.- Selected out of the remaining varibles those measuring the mean or standard deviation. They were identified by searching for the words "mean", "Mean" and "std" in their names. These resulted in 86 features names.

4.- Finally, we took the resulting tidy data set and added one more tranformation: Per subject and per activity, we calculated per feature the mean of the observations. This resulted in a 180x88 tidy data set. 

## Tidy data set

The tidy data set was saved in the directory "data" under the name "tdata.txt". You can read it by using the following instruction: read.table("./data/tdata.txt", header = TRUE)

It contains 88 column variables including the subject, the activity performed and the 86 resulting features. These variables are:

subject: Unit: integer; values: 1,2,..., 30.

activity: units: character; values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.

and 86 grouped mean per feature. These variables do not have units and their values range from -1 to +1. They are:

"timeBodyAccelerometer.mean.X"                    
"timeBodyAccelerometer.mean.Y"                   
"timeBodyAccelerometer.mean.Z"                    
"timeBodyAccelerometer.std.X"                    
"timeBodyAccelerometer.std.Y"                     
"timeBodyAccelerometer.std.Z"                    
"timeGravityAccelerometer.mean.X"                 
"timeGravityAccelerometer.mean.Y"                
"timeGravityAccelerometer.mean.Z"                 
"timeGravityAccelerometer.std.X"                 
"timeGravityAccelerometer.std.Y"                  
"timeGravityAccelerometer.std.Z"                 
"timeBodyAccelerometerJerk.mean.X"                
"timeBodyAccelerometerJerk.mean.Y"               
"timeBodyAccelerometerJerk.mean.Z"                
"timeBodyAccelerometerJerk.std.X"                
"timeBodyAccelerometerJerk.std.Y"                 
"timeBodyAccelerometerJerk.std.Z"                
"timeBodyGyro.mean.X"                             
"timeBodyGyro.mean.Y"                            
"timeBodyGyro.mean.Z"                             
"timeBodyGyro.std.X"                             
"timeBodyGyro.std.Y"                              
"timeBodyGyro.std.Z"                             
"timeBodyGyroJerk.mean.X"                         
"timeBodyGyroJerk.mean.Y"                        
"timeBodyGyroJerk.mean.Z"                         
"timeBodyGyroJerk.std.X"                         
"timeBodyGyroJerk.std.Y"                          
"timeBodyGyroJerk.std.Z"                         
"timeBodyAccelerometerMag.mean"                   
"timeBodyAccelerometerMag.std"                   
"timeGravityAccelerometerMag.mean"                
"timeGravityAccelerometerMag.std"                
"timeBodyAccelerometerJerkMag.mean"               
"timeBodyAccelerometerJerkMag.std"               
"timeBodyGyroMag.mean"                            
"timeBodyGyroMag.std"                            
"timeBodyGyroJerkMag.mean"                        
"timeBodyGyroJerkMag.std"                        
"freqBodyAccelerometer.mean.X"                    
"freqBodyAccelerometer.mean.Y"                   
"freqBodyAccelerometer.mean.Z"                    
"freqBodyAccelerometer.std.X"                    
"freqBodyAccelerometer.std.Y"                     
"freqBodyAccelerometer.std.Z"                    
"freqBodyAccelerometer.meanFreq.X"                
"freqBodyAccelerometer.meanFreq.Y"               
"freqBodyAccelerometer.meanFreq.Z"                
"freqBodyAccelerometerJerk.mean.X"               
"freqBodyAccelerometerJerk.mean.Y"                
"freqBodyAccelerometerJerk.mean.Z"               
"freqBodyAccelerometerJerk.std.X"                 
"freqBodyAccelerometerJerk.std.Y"                
"freqBodyAccelerometerJerk.std.Z"                 
"freqBodyAccelerometerJerk.meanFreq.X"           
"freqBodyAccelerometerJerk.meanFreq.Y"            
"freqBodyAccelerometerJerk.meanFreq.Z"           
"freqBodyGyro.mean.X"                             
"freqBodyGyro.mean.Y"                            
"freqBodyGyro.mean.Z"                             
"freqBodyGyro.std.X"                             
"freqBodyGyro.std.Y"                              
"freqBodyGyro.std.Z"                             
"freqBodyGyro.meanFreq.X"                         
"freqBodyGyro.meanFreq.Y"                        
"freqBodyGyro.meanFreq.Z"                         
"freqBodyAccelerometerMag.mean"                  
"freqBodyAccelerometerMag.std"                    
"freqBodyAccelerometerMag.meanFreq"              
"freqBodyAccelerometerJerkMag.mean"               
"freqBodyAccelerometerJerkMag.std"               
"freqBodyAccelerometerJerkMag.meanFreq"           
"freqBodyGyroMag.mean"                           
"freqBodyGyroMag.std"                             
"freqBodyGyroMag.meanFreq"                       
"freqBodyGyroJerkMag.mean"                        
"freqBodyGyroJerkMag.std"                        
"freqBodyGyroJerkMag.meanFreq"                    
"angle.timeBodyAccelerometerMean.gravity"        
"angle.timeBodyAccelerometerJerkMean.gravityMean"
"angle.timeBodyGyroMean.gravityMean"             
"angle.timeBodyGyroJerkMean.gravityMean"          
"angle.X.gravityMean"                            
"angle.Y.gravityMean"                             
"angle.Z.gravityMean"

