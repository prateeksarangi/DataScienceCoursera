library(keras)

heartPath <- 'heart.csv'
heart <- read.csv(heartPath)

X = heart[, 0:13]
Y = heart[, 13]

X <- data.matrix(X)
Y <- data.matrix(Y)

model <- keras_model_sequential() 
model %>% 
  layer_dense(units = 12, input_shape=13, activation='relu') %>% 
  layer_dense(units = 12, activation='sigmoid', use_bias = TRUE) %>% 
  layer_dense(units = 10, activation='sigmoid', use_bias = TRUE) %>% 
  layer_dense(units = 8, activation='sigmoid', use_bias = TRUE) %>% 
  layer_dense(units = 8, activation='sigmoid', use_bias = TRUE) %>% 
  layer_dense(units = 1, activation='sigmoid', use_bias = TRUE)

model %>% compile(
  loss = 'binary_crossentropy',
  optimizer = optimizer_adam(),
  metrics = c('accuracy')
)

history <- model %>% fit(
  X, Y, 
  epochs = 300,
  validation_split = 0.3)

plot(unlist(1:300),
     unlist(history$metrics["loss"]), 
     main="Loss graph",
     xlab = "Iteration",
     ylab="Loss",
     type="l",
     col="blue")
print('Accuracy of the model 92.48%')
