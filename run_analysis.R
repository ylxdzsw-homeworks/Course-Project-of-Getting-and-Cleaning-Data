run_analysis <- function(){
  #read the data
  X_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  X_test  <- read.table("test/X_test.txt")
  y_test  <- read.table("test/y_test.txt")
  subjects_train <- read.table("train/subject_train.txt")
  subjects_test  <- read.table("test/subject_test.txt")
  activity_labels<- read.table("activity_labels.txt")[,2]
  features <- read.table("features.txt")[,2]
  
  #merge the data
  alldata <- cbind(rbind(X_train,X_test),rbind(y_train,y_test))
  alldata <- cbind(rbind(subjects_train,subjects_test))
  
}