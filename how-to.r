#############################################
#         Basic dataset fun and             #
#            Initialization                 #
#############################################

# Read in and print off the columns of the dataset
dataset <- read.csv("mlk-georgia-cam-1-2019-3.csv")
colnames(dataset)

# To refer to a column in a dataset, use the '$' selector:
head(dataset$hit_counts)

# Prune the locations column because it isn't statistically useful.
# Print off the columns again to show the change
dataset = dataset[, !(names(dataset) %in% c("locations"))]
colnames(dataset)
# Plot the whole dataset just for fun
plot(dataset)
# Create a subset of the dataset containing only the label and timestamp columns
barplotSubset <- subset(dataset, select = c("label", "timestamp"))
# Create a barplot of the subset
barplot(table(barplotSubset))

#############################################
#    Now, let's have look into some stats   #
#  Let's find the mean, median and mode of  #
#    The hit_counts column of the dataset   #
#############################################

mean(dataset$hit_counts)
median(dataset$hit_counts)

#############################################
# Unfortunately R doens't offer a built-in  #
#  "mode" function - so instead we'll make  #
#   our own using a function declaration:   #
#############################################

ourMode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

ourMode(dataset$hit_counts)
