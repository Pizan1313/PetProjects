#  Forecasting taxi orders

The company has collected historical data on taxi orders at airports. We need to predict the number of taxi orders for the next hour to attract more drivers during the peak period. Build a model for such a prediction.

The value of the *RMSE* metric on the test set should not exceed 48.

We need:

1. Load the data and resample it one hour at a time.
2. Analyze the data.
3. Train different models with different hyperparameters. Make a test sample of 10% of the original data.
4. Check the data on the test sample and conclude.


The data is in the `taxi.csv` file. The number of orders is in the `num_orders` column.
