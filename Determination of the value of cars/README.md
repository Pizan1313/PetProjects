# Determination of the Value of Cars
This project focuses on developing a model to determine the market value of cars for a used car dealership's app. Historical data, including technical specifications, equipment, and prices of vehicles, are available for analysis. The goal is to build an accurate and efficient prediction model while considering prediction quality, prediction speed, and study time.

## Dataset
The dataset used in this project contains historical data on cars, including the following columns:

- <code>DateCrawled</code>: the date when the data was crawled
- <code>Price</code>: the price of the car
- <code>VehicleType</code>: the type of vehicle (e.g., sedan, hatchback, etc.)
- <code>RegistrationYear</code>: the year of registration of the car
- <code>Gearbox</code>: the type of gearbox (e.g., manual, automatic, etc.)
- <code>Power</code>: the power of the car in horsepower
- <code>Model</code>: the car model name
- <code>Kilometer</code>: the mileage of the car in kilometers
- <code>RegistrationMonth</code>: the month of registration of the car
- <code>FuelType</code>: the type of fuel used by the car (e.g., petrol, diesel, etc.)
- <code>Brand</code>: the brand of the car
- <code>NotRepaired</code>: indicates if the car has not been repaired (Yes/No)
- <code>DateCreated</code>: the date when the listing was created
- <code>NumberOfPictures</code>: the number of pictures in the listing
- <code>PostalCode</code>: the postal code for the location of the vehicle
- <code>LastSeen</code>: the date when the listing was last seen
The dataset is assumed to be available for analysis.

The following columns were removed from the original dataset as they were deemed not relevant to the assessment of the car's value:

- DateCrawled: the date when the data was crawled
- DateCreated: the date when the listing was created
- NumberOfPictures: the number of pictures in the listing
- PostalCode: the postal code for the location of the vehicle
- LastSeen: the date when the listing was last seen

It was decided to remove the PostalCode column as it was considered too precise and replaced with a more general location, such as city or region, to avoid overfitting and consider the user's location in predicting the car's value.

## Libraries Used
The following Python libraries were utilized in this project:

- Pandas: for data analysis and manipulation.
- NumPy: for numerical computing and array operations.
- Matplotlib: for data visualization and plotting.
- Seaborn: for additional data visualization options.
- Scikit-learn: for machine learning models, evaluation metrics, and data preprocessing.
- LightGBM: for gradient boosting machine learning model.
- XGBoost: for gradient boosting machine learning model.
- CatBoost: for gradient boosting machine learning model.

## Model Selection and Evaluation
To select the best model for predicting the market value of cars, various regression algorithms were considered, including Linear Regression, Bayesian Ridge, LassoLars, Decision Tree Regressor, and Gradient Boosting Regressor. The LGBMRegressor was found to be the best model in terms of prediction accuracy, with an average prediction error of 1500 euros for the 0-20000 euros range.

Categorical features in the data were encoded using ordinal encoding for better model performance. The Year of registration and power of the car were identified as the most significant features affecting the quality of predictions, with Distance traveled, Brand, and Model of the car also having a significant impact.

It was concluded that gradient boosting models are recommended for best results, linear regressions for fast learning, and models with up to 100 decision trees in hyperparameters for fast prediction.

## Conclusion
In conclusion, this project aims to develop a model for determining the market value of cars using historical data. Data preprocessing techniques were applied to handle missing values and unnecessary columns were removed to optimize model performance. The LGBMRegressor was identified as the best model for prediction accuracy, and key features affecting the quality of predictions were identified. Further model fine-tuning and evaluation may be necessary to achieve the desired level of prediction accuracy for the specific requirements of the project.

Credits
If you have any questions or feedback, please feel free to contact me. Happy coding!
