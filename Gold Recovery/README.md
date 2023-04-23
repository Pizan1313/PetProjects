# Recovery of gold from ore

Gold is one of the most valuable metals and is widely used in various industries. Therefore, it is essential to develop efficient methods for its extraction from ores. In this project, we have prepared a machine learning model to predict the recovery factor for gold from gold ore, which will help optimize production to launch an enterprise with profitable characteristics.

## Methodology:
To build our model, we first prepared the data by filling in the gaps with adjacent values and ensuring that the calculated recovery efficiency values match the actual values for the training set. We then conducted exploratory data analysis using the pandas profiling library and analyzed the data to understand the stages and types of parameters involved in the gold ore refining process.

Next, we introduced a new quality metric, sMAPE (Symmetric Mean Absolute Percentage Error), to determine the best learning model for our data. We divided our training set into features and target features, scaled the features, and trained several regression models, including Linear Regression, Lasso, Ridge, and XGBRegressor, using cross-validation and GridSearchCV to optimize the hyperparameters.

## Results:
Our analysis and graphs show that the data correspond to the theoretical justification for the purification process of the gold ore mixture. The purer the concentrate becomes, the closer the content of substances in it approaches the average value, and the spread of values becomes smaller. Based on the sMAPE metric, Lasso Regression was the best model with an RMSE of 7.81 on the test set.

## Analysis:
Our model shows promising results and can be used to predict the recovery factor for gold from gold ore, helping optimize production and launch profitable enterprises. The use of the sMAPE metric allowed us to select the best learning model for our data, and our analysis shows that the data corresponds to the theoretical justification for the purification process of the gold ore mixture.

## Libraries Used:
We used several Python libraries to prepare, analyze, and train our model, including pandas, numpy, pandas_profiling, scikit-learn, matplotlib, and seaborn. The pandas_profiling library allowed us to conduct exploratory data analysis quickly, and scikit-learn provided various regression models and tools for hyperparameter optimization.
