run_analysis <- function(){
  #read the data
  X_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")[,1]
  X_test  <- read.table("test/X_test.txt")
  y_test  <- read.table("test/y_test.txt")[,1]
  subjects_train <- read.table("train/subject_train.txt")[,1]
  subjects_test  <- read.table("test/subject_test.txt")[,1]
  activity_labels<- read.table("activity_labels.txt")[,2]
  features <- read.table("features.txt")[,2]
  
  #merge the data
  alldata <- cbind(rbind(X_train,X_test),c(y_train,y_test))
  alldata <- cbind(c(subjects_train,subjects_test),alldata)
  
  #name the data
  colnames(alldata) <- c("subjects",as.character(features),"activity")
  alldata$activity <- factor(alldata$activity,labels=activity_labels)
  
  #subset the data
  indexes <- sort(c(grep("mean",features),grep("std",features)))
  partdata <- alldata[,c(1,indexes+1,ncol(alldata))]
  
  #aggregate
  tidydata <- aggregate(. ~ subjects + activity,data=partdata,FUN=mean)
  
  #save the data
  write.table(tidydata,file="tidydata.txt",row.name=FALSE)
}