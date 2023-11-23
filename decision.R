

# applying classification using one R and Zero R
train_and_test <- read.csv("train_and_test2.csv")
# Reproducibility using seed for splitting
set.seed(1234)
 
# splitting training and test data 70:30 from train_and_test
spl <- sample(2, nrow(train_and_test), replace = TRUE, prob = c(0.70, 0.30))

# train and test data
train.data <- train_and_test[spl==1,]
test.data <- train_and_test[spl==2,]

# saving files 
write.csv(train.data, "train_data.csv", row.names = FALSE)
write.csv(test.data, "test_data.csv", row.names = FALSE)



############# plotting the predictions ###################
