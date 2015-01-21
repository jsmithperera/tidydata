run_analysis <- function () {

#       0.- Download the data:
#       -Create directory data if neccesary. Download and unzip data for the project if neccesary. 
#       -Data will be saved on subdirectory UCI HAR Dataset.
        
        if (!file.exists("data")) {
                dir.create("data")
        }
        
        if (!file.exists("./data/Dataset.zip")) {
                fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                download.file(fileUrl,dest="./data/Dataset.zip", mode = "wb")
                dateDownloaded <- date()
        }
        
        if (!file.exists("./data/UCI HAR Dataset")) {
                unzip("./data/Dataset.zip", exdir = "./data")
        }

#       1.- Merges the training and the test sets:
#       -Create one file each for the subdirectories test and train within UCI HAR Dataset.
#       -Each file contains the subjects, the activities performed by the subjects and 
#       the corresponding features variables.
#       -Merge both file into one dataset under the name dataSamsung which contains 
#       10.299 observations and 563  variables.

        sub_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header= FALSE)
        act_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header= FALSE)
        features_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt", header= FALSE)
        dataTest <- cbind(sub_test,act_test,features_test)
        
        sub_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header= FALSE)
        act_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header= FALSE)
        features_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt", header= FALSE)
        dataTrain <- cbind(sub_train,act_train,features_train)
        
        dataSamsung <- rbind(dataTest,dataTrain)
        
#       -Read file containing the features' names and lable each column starting with
#       subject, then activity and then features'names.
#       -Rewrite these names according to the Google's R Style Guide
#       (see https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)
#       It means, replace the "-" with "."; "," with nothing;
#       "()" with nothing, and "(" with "." and the ")" with nothing,

        names_fea <- read.table("./data/UCI HAR Dataset/features.txt", header= FALSE)
        names(dataSamsung) <- c("subject", "activity", as.character(names_fea$V2))
        
        names(dataSamsung) <- gsub("-", ".", names(dataSamsung))
        names(dataSamsung) <- gsub(",", ".", names(dataSamsung))
        names(dataSamsung) <- gsub("\\()", "", names(dataSamsung))
        names(dataSamsung) <- gsub("\\(", ".", names(dataSamsung))
        names(dataSamsung) <- gsub("\\)", "", names(dataSamsung))
     
#       -Correct error in the variable names

        names(dataSamsung) <- gsub("BodyBody", "Body", names(dataSamsung))

#       -Eliminate duplicate column names. There are 84 duplicated names.

        dataSamsung <- dataSamsung[,-which(duplicated(names(dataSamsung)))]

#       2.- Select variable names that contain the word "mean", "std" or  "Mean"and create a new dataset. 

        index <- grep("std|mean|Mean", names(dataSamsung), value=FALSE)
        dataSamsung <- dataSamsung[,c(1,2,index)]

#       3.- Replace the activity number by its descriptive value.

        names_act <- read.table("./data/UCI HAR Dataset/activity_labels.txt", header= FALSE)
        dataSamsung$activity <- names_act$V2[dataSamsung$activity]

#       4.- Rewrite variable names with descriptive names:
#       -Replace "t" with "time" at the begining of the name variable if any; also 
#       replace ".t" by ".time" in the six variables related to the angle domain.
#       -Replace "f" with freq"(uency) at the begining of the name variable if any, and
#       -Replace "Acc" with "Accelerometer".
        
        names(dataSamsung) <- gsub("^t", "time", names(dataSamsung))
        names(dataSamsung) <- gsub("\\.t", ".time", names(dataSamsung))        
        names(dataSamsung) <- gsub("^f", "freq", names(dataSamsung))
        names(dataSamsung) <- gsub("Acc", "Accelerometer", names(dataSamsung))

#       5.- Create a tidy dataset that, for each subject and each activity, calculates the average of each 
#       feature variable:
#        -Uses the "dplyr" library. 
#       -Result is written in file called tdata.txt,in the directory data.

        library(dplyr)
        dataSamsung <- tbl_df(dataSamsung)
        by_subject <- group_by(dataSamsung,subject, activity)
        datafinal <- summarise_each(by_subject,"mean", -(1:2))
        write.table(datafinal,"./data/tdata.txt", row.names=FALSE)

}