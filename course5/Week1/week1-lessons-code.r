# Loading sample data
library(kernlab)
data(spam)
str(spam[, 1:5])

# Perform subsampling
set.seed(3435)
trainIndicator <- rbinom(4601, size = 1, pron = 0.5)
table(trainIndicator)
trainSpam <- spam[trainIndicator == 1, ]
testSpam <- spam[trainIndicator == 0, ]

# Exploratori analysis
names(trainSpam)