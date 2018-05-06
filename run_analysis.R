install.packages("reshape2")
library("reshape2")
library(plyr)

# Step 1 - Merge the training and test sets to create one data set
###############################################################################

x_train_data <- read.table("train/X_train.txt")
y_train_data <- read.table("train/y_train.txt")
subject_train_data <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test_data <- read.table("test/subject_test.txt")

# create 'x' & y data set & subject data 
x_data <- rbind(x_train_data, x_test)
y_data <- rbind(y_train_data, y_test)
subject_data <- rbind(subject_train_data, subject_test_data)

# Step 2 - Extract only measurements of the mean and standard deviation for each measurement
###############################################################################

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns & names
x_data <- x_data[, mean_and_std_features]
names(x_data) <- features[mean_and_std_features, 2]

# Step 3 - Use descriptive activity names for activities
###############################################################################

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# Step 4 - label the data set with descriptive variable names
###############################################################################

# correct column name
names(subject_data) <- "subjects"

# bind all the data in a single data set
all_data <- cbind(x_data, y_data, subject_data)

# Step 5 - Create a second, independent tidy data set with the average of each variable
###############################################################################

tidy_data<- as.data.frame(lapply(all_data[,1:66],FUN = mean, rm.na = T))
write.table(tidy_data, file = "tidy_data.txt")

## Create second tidy_data - per suggestions
tidy_data2<- as.data.frame(lapply(all_data[,1:66], FUN = array, rm.na = T))
?lapply
write.table(tidy_data2, file = "tidy_data2.txt")

tidy_data <- run.data
tidy_data <- run.data %>%
  group_by(subject_data, activities) %>%
  summarise_each(funs(mean))

# Write run.data to file
write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)

# Make Codebook
getwd()
remove.packages("reader")
install.packages("reader")
install.packages("NCmisc")
library(knitr)
library(reader)
library(dplyr)

knit("makeCodebook.Rmd", output = "codebook.md",quiet = TRUE)
markdownToHTML("codebook.md", "codebook.html")

