# Protection of clients' personal data

This Github repository contains the code and documentation for the "Protection of personal data" data science project. The aim of the project is to protect the data of an insurance company's customers by developing a data transformation method that makes recovering personal information difficult.

## Task
The task is to protect the data so that the quality of the machine learning models does not deteriorate during the transformation. There is no need to select the best model.

## Data
The data consists of information on 5,000 customers of the insurance company. The data includes:

- Gender (Boolean value)
- Age (from 18 to 65 years old)
- Salary (from 5300 to 79000 conventional units)
- Number of family members (from 0 to 6)
- Number of insurance payments (from 0 to 5)
- There are no gaps in the data, and all values are within normal limits.

## Libraries Used
The following libraries were used in this project:

- Pandas
- Numpy
- Matplotlib
- Seaborn
- Scikit-learn
- Methodology

To protect the data, we developed an algorithm based on matrix multiplication by an invertible matrix. Before developing the algorithm, we investigated the effect of matrix multiplication on the quality of linear regression models.

## Investigating Matrix Multiplication
We investigated the following assumption: features are multiplied by an invertible matrix, will the quality of linear regression change?

## Conversion Algorithm
The conversion algorithm we developed is as follows:

1. Take the Feature Matrix X from the source file
2. Create a random invertible Matrix P. It must be a square non-singular matrix, with a height equal to the width of the matrix X.
3. Check Matrix P for invertibility. Find the determinant of this matrix (determinant)
4. Transform Feature Matrix: Multiply X and P to get Z Matrix
5. Train the model on the Feature Matrix and the Transformed Feature Matrix
6. Check that the R2 metrics on the Feature Matrix(X) and Transformed Matrix(Z) are equal

## Linear Regression Model
We created a linear regression model from scratch using the following code:

```python
class LR:
    def fit(self, train_features, train_target):
        X = np.concatenate((np.ones((train_features.shape[0], 1)), train_features), axis=1)
        y = train_target
        w =w = np.linalg.inv(X.T @ X) @ X.T @ y
        self.w = w[1:]
        self.w0 = w[0]

    def predict(self, test_features):
        return test_features.dot(self.w) + self.w0
```

## Results and Analysis
We tested the conversion algorithm by checking the coefficient of determination. We also found minor inaccuracies in the data on clients' salaries and corrected them. After correcting the inaccuracies, the data was brought to the required types, and the original file's size was reduced by about five times.

## Conclusion
We successfully developed a method to protect the personal data of the insurance company's clients. By multiplying the initial data by a random, invertible matrix, we created a data transformation method that makes recovering personal information difficult. The protection of personal data was tested using a linear regression model, and the prediction quality and coefficient of determination remained unchanged.

## Project Progress
The project progressed through the following stages:

- Loading and exploring data
- Investigating matrix multiplication by an invertible matrix
- Developing the conversion algorithm
- Verifying the algorithm's data transformation and checking the coefficient of determination.
