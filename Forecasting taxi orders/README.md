#  Forecasting taxi orders

This is my data science project on "Forecasting Taxi Orders" where I built a model to predict the number of taxi orders for the next hour based on historical data. The data consists of the number of taxi orders at airports from March to August, and the task is to predict the number of orders for the next hour to attract more drivers during peak periods. The goal is to achieve an RMSE metric on the test set of less than 48.

## Methodology

The project involves the following steps:

1. Loading the data and resampling it one hour at a time.
2. Analyzing the data to identify trends and seasonality.
3. Training different models with different hyperparameters and creating a test sample of 10% of the original data.
4. Checking the data on the test sample and concluding.

## Results

- The best regressor for this task was the XGBRegressor, which achieved an RMSE of 44.71 on the test set. 
- Additionally, we used the SARIMAX model which achieved a lower RMSE of 39.34.

## Analysis

The analysis revealed that the time series data is stationary according to the Dickey-Fuller criterion, despite having a noticeable upward trend in the average value from month to month. The series exhibits monthly, weekly, and daily seasonality patterns. Therefore, we included the month, day, and week as additional features while building the models.

## Libraries Used

The libraries used in this project include Pandas, NumPy, Matplotlib, StatsModels, Scikit-Learn, XGBoost, Catboost, Lightgbm and SARIMAX.






