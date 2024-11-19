library(caret)
library(ggplot2)

# Here we load the data
data <- read.csv("C:/Users/hp/OneDrive/Desktop/CA 3 Project of INT234/heart_data.csv")

# Converting necessary columns to factors and numeric types
data$diagnosis_numeric <- as.numeric(as.factor(data$diagnosis)) - 1

# Summary and structure of data
summary(data)
str(data)

# We are training and testing data using sample()
set.seed(123)
trainIndex <- sample(1:nrow(data), 0.8 * nrow(data))
heartTrain <- data[trainIndex, ]
heartTest  <- data[-trainIndex, ]

# Training Linear Regression model predicting cholesterol based on various features 
lm_model <- lm(cholesterol ~ age + rest_bp + st_depression + max_hr + exercise_angina + gender + thalassemia + st_slope + num_vessels,
               data = heartTrain)    

# Making predictions on cholesterol levels using the trained linear regression model 
lm_pred <- predict(lm_model, newdata = heartTest)   

#Visualization - Predicted vs Actual Plot 
ggplot(data.frame(Actual=heartTest$cholesterol, Predicted=lm_pred), aes(x=Actual, y=Predicted)) +
  geom_point() +
  geom_smooth(method='lm', color='blue') +
  labs(title="Linear Regression: Predicted vs Actual Cholesterol Levels",   
       x="Actual Cholesterol Levels",   
       y="Predicted Cholesterol Levels") +   
  theme_minimal()

# Accuracy Calculation (R-squared value)
r_squared <- summary(lm_model)$r.squared * 100 # R-squared as a percentage
cat("Linear Regression R-squared: ", round(r_squared, 2), "%\n")

