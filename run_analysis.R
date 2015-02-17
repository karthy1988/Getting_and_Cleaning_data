# Assuming X_Test.txt file is placed in the working directory
X_Data_Test <- read.table("X_test.txt")
Y_Data_Test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

# Assuming X_Test.txt file is placed in the working directory
X_Data_Train <- read.table("X_train.txt")
Y_Data_Train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

#Combining both training and testing datasets into one sigle variable
Complete_Data_X <- rbind(X_Data_Train,X_Data_Test)
Complete_Data_Y <- rbind(Y_Data_Train,Y_Data_Test)
Complete_subject <- rbind(subject_train,subject_test)

# Assuming features.txt file is placed in the working directory
feature_List <- read.table("features.txt")
mean_measurement_Index <- feature_List[grep("mean[(][)]",feature_List$V2),]
std_measurement_Index <- feature_List[grep("std[(][)]",feature_List$V2),]


#Extract only mean and std measurement
mean_and_std_data <- cbind(Complete_Data_X[,mean_measurement_Index[,1]],
                           Complete_Data_X[,std_measurement_Index[,1]],
                           Complete_Data_Y,
                           Complete_subject)

#Name the columns of the dataset

NcolMean <- length(mean_measurement_Index[,2])
NcolStd <- length(std_measurement_Index[,2])
Ncol <- NcolMean + NcolStd
allNames <- c(as.character(mean_measurement_Index[,2]),
              as.character(std_measurement_Index[,2]))

colnames(mean_and_std_data) <- allNames


#descriptive activity names
activity_Label <- read.table("activity_labels.txt")
colnames(mean_and_std_data)[length(mean_and_std_data)-1] <- "Activity"
colnames(mean_and_std_data)[length(mean_and_std_data)] <- "Subject"

#Assign the descriptive activity name to each record in mean_and_std_data based on activity id

data_with_descriptive_activity_name <- 
  merge(mean_and_std_data,activity_Label,by.x ="Activity",by.y = "V1")

# Name the column of activity name
colnames(data_with_descriptive_activity_name)[length(data_with_descriptive_activity_name)] <- 
  "Descriptive_Activity_Name"

#average of each variable for each activity and each subject
len <- length(data_with_descriptive_activity_name)
tidy_data <- data_with_descriptive_activity_name[2:len] %>%
  group_by( Descriptive_Activity_Name,Subject ) %>%
    summarise_each(funs(mean))

#write into text file
write.table(tidy_data,"tidy_data.txt",row.name =FALSE )