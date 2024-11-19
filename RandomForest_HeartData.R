library(randomForest)
library(caret)
library(ggplot2)

# We are loading data
data <- read.csv("C:/Users/hp/OneDrive/Desktop/CA 3 Project of INT234/heart_data.csv")

# Converting necessary columns to factors
data$diagnosis <- as.factor(data$diagnosis)
data$chest_pain <- as.factor(data$chest_pain)
data$thalassemia <- as.factor(data$thalassemia)
data$exercise_angina <- as.factor(data$exercise_angina)

# Summary and structure of data
summary(data)
str(data)

# We are training and testing data using sample()
set.seed(123)
trainIndex <- sample(1:nrow(data), 0.8 * nrow(data))
heartTrain <- data[trainIndex, ]
heartTest  <- data[-trainIndex, ]

# Training Random Forest model
rf_model <- randomForest(diagnosis ~ ., data = heartTrain, importance = TRUE)

# Printing model to see the details of it
print(rf_model)

# Predictions using Random Forest
rf_pred <- predict(rf_model, heartTest)

# Confusion Matrix
confusion <- confusionMatrix(rf_pred, heartTest$diagnosis)
print(confusion)

# Accuracy calculation in percentage
rf_accuracy <- confusion$overall['Accuracy'] * 100  # Calculate accuracy of Random Forest predictions 
cat("Random Forest Accuracy: ", round(rf_accuracy, 2), "%\n")  # Print Random Forest accuracy as a percentage 

#Random Forest Variable Importance Visualization 
importance_rf <- importance(rf_model)    # Get variable importance from Random Forest model 
varImpPlot(rf_model, main="Variable Importance from Random Forest Model")    # Plot variable importance

