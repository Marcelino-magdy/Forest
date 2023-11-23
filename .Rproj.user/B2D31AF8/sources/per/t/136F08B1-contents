
############## ONE R Classifier #########################

train.data <- read.csv("train_data.csv")

#Categorizing the numerical large values into groups
age_breaks <- seq(0, 100, by = 5)
fare_breaks <- seq(0, 1000, by = 50)

# Create age ranges
train.data$Age_Range <- cut(train.data$Age, breaks = age_breaks, labels = FALSE)
train.data$Fare_Range <- cut(train.data$Fare, breaks = fare_breaks, labels = FALSE)


best_predictor <- NULL
min_error <- Inf
#cat(min_error)

# main one R loop
for ( predictor in colnames(train.data)) {
  # Skipping 
  if (!is.numeric(train.data[[predictor]]) || predictor == "Survived" || predictor == "ZeroR" || predictor == "Fare" || predictor == "Passengerid"|| predictor == "Age") {
    next
  }
  
  # select classes in predictor
  unique_classes <- unique(train.data[[predictor]])
  
  min_pre_error <- 0
  # Iterate over classes
  for (class_value in unique_classes) {
    # calc. each class error and sum
    class_freq <- sort(table(train.data[train.data[[predictor]] == class_value,'Survived']), decreasing = TRUE)
    
    error <- sum(class_freq[-1])
    cat("predictor class: ",predictor,class_value , "error: ",error, "\n")
    min_pre_error <- min_pre_error + error
    cat("predictor ",predictor," total for class ",class_value," = ",min_pre_error, "\n")
    
  }
  #cat(min_pre_error)
  
  # Updating predictor
  #cat(min_pre_error < min_error)
  if (min_pre_error < min_error) {
    best_predictor <- predictor
    min_error <- min_pre_error
  }
  
}


# Print the best pridector
cat("Best Predictor for One-R Classifier:", best_predictor, "\n")
cat("Min. Total Error:", min_error, "\n")




write.csv(train.data, "train_data.csv", row.names = FALSE)


# plot for draft 
library(ggplot2)
library(tidyr)
predictions_long <- gather(predictions_df, Classifier, Predictions, -Actual)

# bar plot

ggplot(train.data, aes(x = Fare_Range, fill = factor(Survived))) +
  geom_bar(position = "dodge", color = "black") +
  labs(title = "Survival Counts by Fare Range",
       x = "Fare Range",
       y = "Count",
       fill = "Survived") +
  scale_x_continuous(breaks = seq(0, length(fare_breaks) -1 , by = 1), labels = fare_breaks) +
  theme_minimal()

