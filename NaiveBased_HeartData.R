library(caret)
library(ggplot2)
library(e1071) # For Naive Bayes

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

# We are training and testing data using sample() func
set.seed(123)
trainIndex <- sample(1:nrow(data), 0.8 * nrow(data))
heartTrain <- data[trainIndex, ]
heartTest  <- data[-trainIndex, ]

# Training the Naive Bayes model
naive_bayes_model <- train(diagnosis ~ ., data = heartTrain, method = 'naive_bayes')

print(naive_bayes_model)

# Predictions
predictions <- predict(naive_bayes_model, heartTest)

# Confusion Matrix
confusion <- confusionMatrix(predictions, heartTest$diagnosis)
print(confusion)

# Accuracy Calculation
accuracy <- confusion$overall['Accuracy'] * 100
print(paste("Accuracy:", round(accuracy, 2), "%"))

# Visualizing: Density Plot for features by diagnosis class
ggplot(heartTrain, aes(x=cholesterol, fill=diagnosis)) +
  geom_density(alpha=0.5) +
  labs(title="Density Plot of Cholesterol by Diagnosis", x="Cholesterol Level", y="Density")
