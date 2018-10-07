library(dplyr)
library(matrixStats)

#Download required files 
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl,destfile = 'file.zip',method="libcurl",mode = 'wb')
unzip('file.zip')
#list.files()

filelist <- dir(getwd(), recursive=TRUE, full.names=TRUE, pattern=".txt")
#filelist <- filelist[!grepl('(README.txt|features_info.txt)',filelist)]

#1. Merges the training and the test sets to create one data set.
x_train <- read.table(filelist[grepl('/X_train.txt',filelist)],header = F)
x_test <- read.table(filelist[grepl('/X_test.txt',filelist)],header = F)
merged <- bind_rows(x_train,x_test)
feature <- read.table(filelist[grepl('/features.txt',filelist)],header = F)
feature$features <- paste0(feature$V1,'_',feature$V2)
names(merged) <- as.character(feature[,'features'])

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
merged_full <- 
  merged %>% 
  select(contains('mean()'),contains('std()'))

#3. Uses descriptive activity names to name the activities in the data set
y_train <- read.table(filelist[grepl('/y_train.txt',filelist)],header = F)
y_test <- read.table(filelist[grepl('/y_test.txt',filelist)],header = F)
activity_label <- read.table(filelist[grepl('/activity_labels.txt',filelist)],header = F)
names(activity_label) <- c('id','activity')
merged_label <- bind_rows(y_train,y_test) 
names(merged_label) <- 'id'
merged_label <- inner_join(merged_label,activity_label,by =c('id' = 'id'))

merged_df <- 
  bind_cols(merged_label,merged_full)

#4. Appropriately labels the data set with descriptive variable names.
subject_train <- read.table(filelist[grepl('/subject_train.txt',filelist)],header = F)
subject_test <- read.table(filelist[grepl('/subject_test.txt',filelist)],header = F)
merged_subject <- bind_rows(subject_train,subject_test) 
names(merged_subject) <- 'subject'

merged_all <- bind_cols(merged_subject,merged_df)

result <-
merged_all %>%
select(-id)

names(result) <- gsub('[^A-Za-z-]','',names(result))

gsub('[^A-Za-z-]','',names(result))


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_df <- result %>% group_by(subject,activity) %>% summarise_all(funs(mean))
write.table(as.data.frame(tidy_df),file = 'tidy.txt',row.names = FALSE)
