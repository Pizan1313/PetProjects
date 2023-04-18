# Bank Turnover Dataset Analysis

This project analyzes the [Bank Turnover Dataset](https://www.kaggle.com/santoshd3/bank-customers), which is a dataset obtained from Kaggle. The goal of this project is to analyze the dataset, build machine learning models to predict customer turnover, and evaluate their performance.

## Dataset
The dataset used in this project can be found on Kaggle: Bank Turnover Dataset

The dataset contains the following columns:

- RowNumber: Row number
- CustomerId: Unique identifier for each customer
- Surname: Surname of the customer
- CreditScore: Credit score of the customer
- Geography: Country of the customer (France, Spain, or Germany)
- Gender: Gender of the customer (Male or Female)
- Age: Age of the customer
- Tenure: Number of years the customer has been with the bank
- Balance: Account balance of the customer
- NumOfProducts: Number of products the customer has with the bank
- HasCrCard: Whether the customer has a credit card (1 for Yes, 0 for No)
- IsActiveMember: Whether the customer is an active member (1 for Yes, 0 for No)
- EstimatedSalary: Estimated salary of the customer
- Exited: Whether the customer has exited (churned) the bank (1 for Yes, 0 for No)

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
This project is licensed under the MIT License - see the LICENSE file for details. Feel free to use, modify, and share this project as per the terms of the MIT License.

## Credits
Kaggle for providing the Bank Turnover Dataset.
Santosh Kumar D for creating and sharing the dataset on Kaggle.
If you have any questions or feedback, please feel free to contact me. Happy coding!
