# Heart Disease Data Prediction Using Machine Learning Algorithms in R

## Table of Contents
1. [Introduction](#introduction)
2. [Project Scope](#project-scope)
3. [Features of the Dataset](#features-of-the-dataset)
4. [ETL Process](#etl-process)
5. [Analysis and Results](#analysis-and-results)
6. [Machine Learning Models](#machine-learning-models)
7. [Visualization and Insights](#visualization-and-insights)
8. [Future Scope](#future-scope)
9. [How to Run the Code](#how-to-run-the-code)
10. [References](#references)

---

## Introduction
This project utilizes machine learning algorithms to predict the risk of heart disease using a publicly available dataset from Kaggle. The analysis aims to improve early diagnosis and treatment by identifying key risk factors and evaluating model performance.

The dataset includes 14 features such as age, cholesterol levels, and blood pressure, and consists of 297 records. Using R programming, this project implements various ML models, compares their performance, and visualizes the results.

---

## Project Scope
The main goals of this project are:
- **Develop Predictive Models:** Build and evaluate models for predicting heart disease based on patient health metrics.
- **Feature Importance:** Identify key risk factors like cholesterol and exercise-induced angina.
- **Model Comparison:** Assess the accuracy and performance of multiple ML models, including Random Forest, KNN, and Neural Networks.
- **Visual Insights:** Provide intuitive visualizations of the data and model outcomes.

---

## Features of the Dataset
The dataset includes 14 critical features:
- **Age:** Patient's age in years.
- **Cholesterol:** Serum cholesterol in mg/dL.
- **Blood Pressure:** Resting blood pressure in mm Hg.
- **Chest Pain Type:** Various types of chest pain experienced.
- **Maximum Heart Rate:** Achieved during stress tests.
- **Exercise Angina:** Angina induced by exercise.

The dataset was sourced from Kaggle and preprocessed for analysis.

---

## ETL Process
The ETL (Extract, Transform, Load) steps include:
1. **Extract:** Dataset downloaded from [Kaggle](https://www.kaggle.com/datasets/tanishqdublish/heart-disease).
2. **Transform:** Cleaning, missing value imputation, and standardization of numerical features like age and cholesterol.
3. **Load:** Data loaded into R for modeling and analysis.

---

## Analysis and Results
- **KNN Model:** Accuracy: 70%. Effective but sensitive to the choice of k.
- **Support Vector Machine (SVM):** Accuracy: 80%. Demonstrates strong class separation.
- **Naive Bayes:** Accuracy: 83.33%. Performs well with independent features.
- **Random Forest:** Accuracy: 76.67%. Robust but computationally intensive.
- **Neural Network:** Accuracy: 73.33%. Capable of capturing non-linear patterns.
- **Linear Regression:** Moderate R-squared values for feature relationships.
- **Decision Tree:** Easy to interpret but prone to overfitting.

---

## Machine Learning Models
This project implements:
1. **K-Nearest Neighbors (KNN):** Simple distance-based classification.
2. **Support Vector Machine (SVM):** Hyperplane-based binary classification.
3. **Naive Bayes:** Probabilistic classification using Bayes' theorem.
4. **Random Forest:** Ensemble learning with decision trees.
5. **Neural Networks:** Multi-layered models for non-linear data.
6. **Linear Regression:** Analyzing continuous variables like cholesterol levels.
7. **Decision Tree:** Intuitive tree-based modeling for feature splitting.

---

## Visualization and Insights
Key visualizations include:
- Confusion matrices and heatmaps for classification models.
- ROC curves for evaluating true positive and false positive rates.
- Feature importance plots to identify significant predictors.
- Scatter plots for regression analysis.

---

## Future Scope
Potential enhancements:
- Expand the dataset with more records for model generalization.
- Experiment with ensemble methods for improved accuracy.
- Apply deep learning models for handling complex relationships.

---

## How to Run the Code
### Prerequisites:
- R (version 4.0 or higher)
- Required libraries: `tidyverse`, `caret`, `randomForest`, `e1071`, `neuralnet`, etc.

### Steps:
1. Clone this repository:
   ```bash
   git clone https://github.com/username/repository.git
