# Toxic Comment Classification Project
This is a machine learning project that aims to build a model for predicting the toxicity of comments. The goal is to quickly respond to toxic comments from users and intercept them in a timely manner. The project uses a dataset of over 150,000 English-language annotated comments, which are categorized into normal comments and toxic comments.

## Project Overview
- Business Objective: To quickly respond to toxic comments from users and promptly intercept these comments/users.
- Evaluation Metric: F1 score.

## Libraries/Dependencies
The following Python libraries were used in this project:

- Pandas: for data analysis and manipulation.
- NumPy: for numerical computing and array operations.
- Matplotlib: for data visualization and plotting.
- Seaborn: for additional data visualization options.
- Scikit-learn: for machine learning models, evaluation metrics, and data preprocessing.
- NLTK: for natural language processing tasks, such as stopword removal.
- NLTK's WordNetLemmatizer: for lemmatization of English text data.

## Data Analysis and Preparation
- The data consists of a dataset of over 150,000 English-language annotated comments.
- Comments are categorized into 2 classes: 0 - Normal comment, 1 - Toxic comment.
- The data does not contain missing values or outliers.
- Class distribution: 0 - 90%, 1 - 10%.
- Lemmatization of texts was performed.
- The data was divided into training, validation, and test sets (60/20/20).
- All texts were converted into vectors with specific weights and converted to Unicode type.

## Handling Class Imbalance
To address the class imbalance, three strategies were applied:

- No class imbalance handling.
- Balanced classes handling.
- Downsampling to the majority class.

As a result of cross-validation on the training set, the best strategy for handling class imbalance was found to be the model with balanced classes. However, validation on the validation set showed that the model with downsampled majority class performs better. The roc curve plot in the project files shows that the model with balanced classes performs better on the validation set.

## Model Training and Evaluation
- GridSearchCV was used to tune hyperparameters for the Logistic Regression model on the test set.
- During validation, the model with tuned hyperparameters showed an F1 score of 0.7625.
- In the final testing stage, the Logistic Regression model achieved an F1 score of 0.7625.
- A SGDClassifier model, which is a linear classifier with stochastic gradient descent, was also trained.
- In the final testing stage, the SGDClassifier model achieved an F1 score of 0.7579.

## Project Files
The project files include:

- Data analysis and preparation code.
- Model training and evaluation code.
- Roc curve plot showing the performance of different models.
- Model evaluation metrics.
- GridSearchCV results.
- Final trained models.

## Conclusion
This project successfully built a machine learning model for predicting the toxicity of comments. The best performing model achieved an F1 score of 0.7625 on the test set with Logistic Regression, and 0.7579 with SGDClassifier. The project files include all the necessary code and results for reproducing the model and evaluating its performance.
