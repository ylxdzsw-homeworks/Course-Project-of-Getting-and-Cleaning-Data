To use the script, you need to download the data and switch to the directory where the data was stored. Then you can use <code>source("run_analysis.R")
run_analysis()</code> to make a tidy data.
In the script I attached the features and activities names to the data and subsetted only the mean and standard deviation of each measurements. Then I figured the mean of variables for each activity and each subject.
The tidy data was saved in txt format and maybe you can use read.table() to read it into R.