# Bank Turnover Dataset Analysis

This project analyzes the [Bank Turnover Dataset](https://www.kaggle.com/santoshd3/bank-customers), which is a dataset obtained from Kaggle. The goal of this project is to analyze the dataset, build machine learning models to predict customer turnover, and evaluate their performance.

## Dataset
The dataset used in this project can be found on Kaggle: Bank Turnover Dataset

The dataset contains the following columns:

- <code>RowNumber</code>: Row number
- <code>CustomerId</code>: Unique identifier for each customer
- <code>Surname</code>: Surname of the customer
- <code>CreditScore</code>: Credit score of the customer
- <code>Geography</code>: Country of the customer (France, Spain, or Germany)
- <code>Gender</code>: Gender of the customer (Male or Female)
- <code>Age</code>: Age of the customer
- <code>Tenure</code>: Number of years the customer has been with the bank
- <code>Balance</code>: Account balance of the customer
- <code>NumOfProducts</code>: Number of products the customer has with the bank
- <code>HasCrCard</code>: Whether the customer has a credit card (1 for Yes, 0 for No)
- <code>IsActiveMember</code>: Whether the customer is an active member (1 for Yes, 0 for No)
- <code>EstimatedSalary</code>: Estimated salary of the customer
- <code>Exited</code>: Whether the customer has exited (churned) the bank (1 for Yes, 0 for No)

## Dependencies
The following Python libraries were used in this project:

- Pandas (v1.2.4): for data analysis and manipulation.
- NumPy (v1.22.2): for numerical computing and array operations.
- Matplotlib (v3.5.1): for data visualization and plotting.
- Seaborn (v0.11.2): for additional data visualization options.
- Scikit-learn (v1.0.2): for machine learning models, evaluation metrics, and data preprocessing.
- itertools (built-in): for combinations of hyperparameter tuning.
- tqdm (v4.62.3): for progress bars and visualization of iteration progress.

## Results
The project includes machine learning models, such as Decision Tree Classifier, Random Forest Classifier, Dummy Classifier, and Logistic Regression, trained on the Bank Turnover Dataset. The performance of these models was evaluated using various metrics, including accuracy, confusion matrix, recall, precision, F1-score, ROC AUC score, and precision-recall curve.

## License
This project is licensed under the MIT License. Feel free to use, modify, and share this project as per the terms of the MIT License.

## Credits
- Kaggle for providing the Bank Turnover Dataset.
 -[Santosh Kumar D](https://www.kaggle.com/santoshd3) for creating and sharing the dataset on Kaggle.
 
If you have any questions or feedback, please feel free to contact me. Happy coding!
