training <- read.csv("pml-training.csv")
na_info <- colSums(is.na(training))
na_var <- names((na_info[na_info > 0]))
trainingData <- training[, setdiff(x = names(training), y = na_var)]

dim(trainingData)

validation <- read.csv("pml-testing.csv")
na_info <- colSums(is.na(validation))
na_var <- names((na_info[na_info > 0]))
validationData <- validation[, setdiff(x = names(validation), y = na_var)]

dim(validationData)


#For training set
classe <- trainingData$classe
trainRemove <- grepl("^X|timestamp|window", names(trainingData))
trainingData <- trainingData[, !trainRemove]
trainCleaned <- trainingData[, sapply(trainingData, is.numeric)]
trainCleaned$classe <- classe

#For validation set
validationRemove <- grepl("^X|timestamp|window", names(validationData))
validationData <- validationData[, !validationRemove]
validationCleaned <- validationData[, sapply(validationData, is.numeric)]

smp_size <- floor(0.70 * nrow(trainCleaned))
inTrain <- sample(seq_len(nrow(trainCleaned)), size = smp_size)
trainData <- trainCleaned[inTrain, ]
testData <- trainCleaned[-inTrain, ]

library(randomForest)
model <- randomForest(trainData$classe ~ ., data = trainData, ntree = 500, mtry = 6, importance = TRUE)
print(model)

predValid <- predict(model, testData, type = "class")
ValAcc <- mean(predValid == testData$classe)*100
sprintf("Validation Accuracy of the model is:- %f", ValAcc)
table(predValid,testData$classe)

result <- predict(model, validationCleaned[, -length(names(validationCleaned))])
print(result)