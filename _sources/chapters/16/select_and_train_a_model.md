---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---
# Select and Train a Model

## Splitting data into Train and Test

```{code-cell} ipython3
import numpy as np
from sklearn.model_selection import train_test_split
X, y = np.arange(10).reshape((5, 2)), [0, 1, 0, 0, 1]
X
list(y)
# X -- feature
# y -- label
```

```{code-cell} ipython3
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

X_train

y_train

X_test

y_test
```

```{code-cell} ipython3
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.40, random_state=43)

X_train

y_train

X_test

y_test
```

```{code-cell} ipython3
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.33, random_state=42)

X_train

y_train

X_test

y_test
```

```{code-cell} ipython3
import random
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.33, random_state=random.randint(1, 10000))

X_train

y_train

X_test

y_test
```

```{code-cell} ipython3
import random
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.33, random_state=random.randint(1, 10000))

X_train

y_train

X_test

y_test
```

```{code-cell} ipython3
import pandas as pd
from sklearn import datasets, linear_model
from sklearn.model_selection import train_test_split
from matplotlib import pyplot as plt

diabetes = datasets.load_diabetes()
diabetes.data.shape

feature_names = diabetes.feature_names
feature_names
```

```{code-cell} ipython3
df = pd.DataFrame(diabetes.data, columns=feature_names)
y = diabetes.target
df
y
df.shape
```

```{code-cell} ipython3
import random
X_train, X_test, y_train, y_test = train_test_split(df, y, test_size=0.2, random_state=random.randint(1, 10000))

X_train

y_train

X_test

y_test
```

```{code-cell} ipython3
X_train.shape

len(y_train)

X_test.shape

len(y_test)
```

## Linear Regression Example

- To predict a numerical value

```{code-cell} ipython3
import numpy as np
from sklearn.linear_model import LinearRegression
X = np.array([[1, 1], [1, 2], [2, 2], [2, 3]])
# y = 1 * x_0 + 2 * x_1 + 3
y = np.dot(X, np.array([1, 2])) + 3
reg = LinearRegression().fit(X, y)
reg.score(X, y)

reg.coef_

reg.intercept_ 

# y = mx + b

reg.predict(np.array([[3, 5]]))
```

```{code-cell} ipython3
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn import metrics
from sklearn.metrics import r2_score

dataset=pd.read_csv('Salary_Data.csv')
dataset.head()
dataset.shape
dataset
```

### Selecting the data

```{code-cell} ipython3
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values
X
y
```

### Split the data

```{code-cell} ipython3
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test=train_test_split(X, y, test_size=0.20)
```

### Train and Test

```{code-cell} ipython3
from sklearn.linear_model import LinearRegression
regressor=LinearRegression()
regressor.fit(X_train,y_train)
y_pred=regressor.predict(X_test)
y_pred
y_test
metrics.mean_squared_error(y_test, y_pred, squared=False)
```

```{code-cell} ipython3
r2_score(y_test, y_pred)
regressor.coef_
regressor.intercept_
```

```{code-cell} ipython3
plt.scatter(X_train,y_train,color='red')
plt.plot(X_train,regressor.predict(X_train),color='blue')
plt.title('Salary VS Experience (Training Data)')
plt.xlabel('Years of experiene')
plt.ylabel('Salary')
plt.show()
```

```{code-cell} ipython3
plt.scatter(X_test,y_test,color='red')
plt.plot(X_test,regressor.predict(X_test),color='blue')
plt.title('Salary VS Experience (Test Data)');
plt.xlabel('Years of experiene');
plt.ylabel('Salary');
plt.show()
```

### Apply DecisionTreeRegressor

- Decision Trees are good for finding complex nonlinear relationships

```{code-cell} ipython3
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values
from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test=train_test_split(X, y, test_size=0.20)

from sklearn.tree import DecisionTreeRegressor
regressor=DecisionTreeRegressor()
regressor.fit(X_train,y_train)
y_pred=regressor.predict(X_test)
y_pred
y_test
metrics.mean_squared_error(y_test, y_pred, squared=False)
```

### Cross-Validation

```{code-cell} ipython3
from sklearn.pipeline import make_pipeline
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values
preprocessing = make_pipeline(StandardScaler())
reg_pipeline = make_pipeline(preprocessing, LinearRegression())
reg_pipeline.fit(X, y)
y_pred=reg_pipeline.predict(X)
metrics.mean_squared_error(y, pred, squared=False)
from sklearn.model_selection import cross_val_score
reg_rmses = cross_val_score(reg_pipeline, X, y, scoring="neg_root_mean_squared_error", cv=10)
```

```{code-cell} ipython3
from sklearn.pipeline import make_pipeline
X = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values
preprocessing = make_pipeline(StandardScaler())
tree_pipeline = make_pipeline(preprocessing, DecisionTreeRegressor())
tree_rmses = cross_val_score(tree_pipeline, X, y, scoring="neg_root_mean_squared_error", cv=10)
pd.Series(tree_rmses).describe()
```

## Classification Example

```{code-cell} ipython3
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn import metrics
from sklearn.naive_bayes import GaussianNB
# Load the data
from sklearn.datasets import load_iris
iris = load_iris()

from matplotlib import pyplot as plt

# The indices of the features that we are plotting
x_index = 0
y_index = 1

# this formatter will label the colorbar with the correct target names
formatter = plt.FuncFormatter(lambda i, *args: iris.target_names[int(i)])

plt.figure(figsize=(5, 4))
plt.scatter(iris.data[:, x_index], iris.data[:, y_index], c=iris.target)
plt.colorbar(ticks=[0, 1, 2], format=formatter)
plt.xlabel(iris.feature_names[x_index])
plt.ylabel(iris.feature_names[y_index])

plt.tight_layout()
plt.show()
```

```{code-cell} ipython3
X = iris.data
Y = iris.target
X_train, X_test, y_train, y_test=train_test_split(X, Y, test_size=0.2, random_state=0)
```

```{code-cell} ipython3
gnb = GaussianNB()
gnb.fit(X_train, y_train)
y_pred = gnb.predict(X_test)
100*metrics.accuracy_score(y_test, y_pred)
```
