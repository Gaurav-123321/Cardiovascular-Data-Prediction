library(caret)
library(ggplot2)
library(class) # For KNN
library(reshape2) # For heatmap visualization

# We are loading the data
data <- read.csv("C:/Users/hp/OneDrive/Desktop/CA 3 Project of INT234/heart_data.csv")
str(data)
nrow(data)
# Converting necessary columns to factors
data$diagnosis <- as.factor(data$diagnosis)
data$chest_pain <- as.factor(data$chest_pain)
data$thalassemia <- as.factor(data$thalassemia)
data$exercise_angina <- as.factor(data$exercise_angina)

# Summary and structure of data
summary(data)
str(data)

# We are training and testing using the sample()
set.seed(123)
trainIndex <- sample(1:nrow(data), 0.8 * nrow(data))
heartTrain <- data[trainIndex, ]
heartTest  <- data[-trainIndex, ]

# Training the KNN model
knn_model <- knn(train = heartTrain[, -ncol(heartTrain)], 
                 test = heartTest[, -ncol(heartTest)], 
                 cl = heartTrain$diagnosis, k = 5)

print(knn_model)

# Confusion Matrix
confusion <- confusionMatrix(as.factor(knn_model), heartTest$diagnosis)
print(confusion)

# Accuracy Calculation
accuracy <- confusion$overall['Accuracy'] * 100
print(paste("Accuracy:", round(accuracy, 2), "%"))

# Visualizing in form of Heatmap of confusion matrix
confusion_matrix_table <- as.data.frame(confusion$table)
ggplot(confusion_matrix_table, aes(x = Reference, y = Prediction)) +
  geom_tile(aes(fill = Freq), color = "white") +
  scale_fill_gradient(low = "white", high = "blue") +
  geom_text(aes(label = Freq), vjust = 1) +
  labs(title = "KNN Confusion Matrix Heatmap", x = "Actual", y = "Predicted")

