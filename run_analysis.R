# Process the data files

# Load the features and convert to vector
features <- read.table("UCI\ HAR\ Dataset/features.txt",stringsAsFactors=FALSE)

featcols <- features[,2]

featcolsthatmatter <- subset(features,grepl("std",V2) | grepl("mean",V2))[,2]
# Load activity labels
actlabels <-  read.table("UCI\ HAR\ Dataset/activity_labels.txt",stringsAsFactors=FALSE)

colnames(actlabels) <- c("ACTIVITY_ID","ACTIVITY_NAME")

# Read in the test data
testdata <- read.table("UCI\ HAR\ Dataset/test/X_test.txt")

# Change the column names
colnames(testdata) <- featcols

# Only get the data we care about
testdata2 <- testdata[,featcolsthatmatter]

# Add Activty data
testactivity <- read.table("UCI\ HAR\ Dataset/test/y_test.txt")

testactvector <- testactivity[,1]

testdata2$ACTIVITY_ID <- testactvector

testdata3 <- merge(x=testdata2, y=actlabels, by = "ACTIVITY_ID", all=TRUE)


