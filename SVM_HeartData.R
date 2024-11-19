library(caret)
library(ggplot2)
library(e1071) # For SVM

# We are loading the data
data <- read.csv("C:/Users/hp/OneDrive/Desktop/CA 3 Project of INT234/heart_data.csv")

# Converting necessary columns to factors
data$diagnosis <- as.factor(data$diagnosis)
data$chest_pain <- as.factor(data$chest_pain)
data$thalassemia <- as.factor(data$thalassemia)
data$exercise_angina <- as.factor(data$exercise_angina)

# Summary and structure of data
summary(data)
str(data)

# We aRe training and testing using sample() function
set.seed(123)
trainIndex <- sample(1:nrow(data), 0.8 * nrow(data))
heartTrain <- data[trainIndex, ]
heartTest  <- data[-trainIndex, ]

# Training the SVM model
svm_model <- train(diagnosis ~ ., data = heartTrain, method = 'svmRadial')

print(svm_model)

# Predictions
predictions <- predict(svm_model, heartTest)

# Confusion Matrix
confusion <- confusionMatrix(predictions, heartTest$diagnosis)
print(confusion)

# Accuracy calculation
accuracy <- confusion$overall['Accuracy'] * 100
print(paste("Accuracy:", round(accuracy, 2), "%"))

# Visualization of ROC Curve
library(pROC) # we use this for ROC curve to check it hold true for all thresholds
roc_curve <- roc(as.numeric(heartTest$diagnosis), as.numeric(predictions))
plot(roc_curve, main="ROC Curve for SVM", col="blue")

