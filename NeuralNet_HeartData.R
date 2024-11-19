library(neuralnet) # We need this for neural network model
library(caret)  #It is for data partitioning and model evaluation

# Here we load the data
data <- read.csv("C:/Users/hp/OneDrive/Desktop/CA 3 Project of INT234/heart_data.csv")

# Converting necessary columns to factors and numeric types 
data$diagnosis_numeric <- as.numeric(as.factor(data$diagnosis)) - 1 

# Here we are training and testing data
set.seed(123)
trainIndex <- sample(1:nrow(data), 0.8 * nrow(data))
heartTrain <- data[trainIndex, ]
heartTest  <- data[-trainIndex, ]

# Training Neural Network model
nn_model <- neuralnet(diagnosis_numeric ~ age + cholesterol 
                      + rest_bp + st_depression 
                      + max_hr + exercise_angina 
                      + gender + thalassemia + st_slope + num_vessels,
                      data = heartTrain,
                      hidden = c(5),
                      linear.output = FALSE)

#We are visualizing the model
plot(nn_model)     

# Predictions on test set
predictions_probabilities_nn <- predict(nn_model, heartTest[, -ncol(heartTest)])
predictions_classes_nn <- ifelse(predictions_probabilities_nn > 0.5, 1, 0)

# Confusion Matrix
confusion_matrix_nn_table <- table(Predicted = predictions_classes_nn, Actual = heartTest$diagnosis_numeric)
print(confusion_matrix_nn_table)

# Accuracy of the model
accuracy_nn_model <- sum(diag(confusion_matrix_nn_table)) / sum(confusion_matrix_nn_table) * 100
cat("Neural Network Accuracy: ", round(accuracy_nn_model, 2))

