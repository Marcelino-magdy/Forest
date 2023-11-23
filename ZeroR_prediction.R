
################ ZERO R Classifier ################################

train.data <- read.csv("train_data.csv")

# extracting the majority class 

majority <- as.numeric(names(sort(table(train.data$Survived), decreasing = FALSE ))[2])
cat("===> The Zero R classifier prediction is: ",majority)

# adding prediction to table
zero_r_predictions <- rep(majority, nrow(train.data))
# updating the zero r column 
train.data$ZeroR <- zero_r_predictions

# calculating the accuracy
zero_r_accuracy <- mean(zero_r_predictions == train.data$Survived)

# Print the accuracy
cat("Accuracy of Zero-R Classifier:", zero_r_accuracy, "\n")



write.csv(train.data, "train_data.csv", row.names = FALSE)



