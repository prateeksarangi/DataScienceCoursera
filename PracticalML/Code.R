training <- read.csv("pml-training.csv")
testing <- read.csv("pml-testing.csv")

#Cleaning the training data.
na_info <- colSums(is.na(training))
length(names(na_info[na_info > 0]))
length(names(na_info[na_info > 19000]))

na_var <- names((na_info[na_info > 0]))
cat(paste("Type of na_var = ", class(na_var)))
trainingData <- training[, setdiff(x = names(training), y = na_var)]
cat(paste("\n NA Count = ", sum(is.na(trainingData))))
cat(paste("\n records = ", nrow(trainingData)))
cat(paste("\n variables =", ncol(trainingData)))

summary(trainingData)

library(h2o)
h2o.init(ip = 'localhost', port = 1080, max_mem_size = '1g')
trainingData.hex <- as.h2o(x = trainingData, destination_frame = "trainingData.hex")
head(trainingData.hex)

#Cleaning the testing data.
na_info <- colSums(is.na(testing))
length(names(na_info[na_info > 0]))
length(names(na_info[na_info > 19000]))

na_var <- names((na_info[na_info > 0]))
cat(paste("Type of na_var = ", class(na_var)))
testingData <- testing[, setdiff(x = names(testing), y = na_var)]
cat(paste("\n NA Count = ", sum(is.na(testingData))))
cat(paste("\n records = ", nrow(testingData)))
cat(paste("\n variables =", ncol(testingData)))

summary(testingData)

library(h2o)
h2o.init(ip = 'localhost', port = 1080, max_mem_size = '1g')
testingData.hex <- as.h2o(x = testingData, destination_frame = "testingData.hex")
head(testingData.hex)