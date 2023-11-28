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




# Loading Data

## Ipython Setting

```{code-cell} ipython3
:tags: ["output_scroll"]
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = "all"
x = 1
y = 2
x
y
```

## Loading Sample Dataset
- Iris data 
```{code-cell} ipython3
:tags: ["output_scroll"]
from sklearn.datasets import load_iris
iris_dataset = load_iris()
iris_dataset
print(iris_dataset.DESCR)
```

### Access the actual data
- `.data` contains the actual data, or sepal and petal measurements

```{code-cell} ipython3
:tags: ["output_scroll"]
iris_dataset.data
```

### Access the data target or label
- `.target` contains the associated labels
- labels are encoded
```{code-cell} ipython3
:tags: ["output_scroll"]
iris_dataset.target
```

### Access mapping of data labels
- `.target_names` gives you the labels associated with 1, 2, 3

```{code-cell} ipython3
:tags: ["output_scroll"]
iris_dataset.target_names
```
:::{note}
What is the difference between `.target` and `.target_names`?
:::

## Loading Another Sample Dataset
- Iris data 
```{code-cell} ipython3
:tags: ["output_scroll"]
from sklearn.datasets import load_diabetes 
diabetes =  load_diabetes()
print(diabetes.DESCR)
print(diabetes.data.shape)
```



### Loading the Data into Pandas
```{code-cell} ipython3
import pandas as pd
from sklearn.datasets import load_diabetes 
diabetes =  load_diabetes()
pd.DataFrame(diabetes.data, columns=diabetes.feature_names)
```

:::{note}
What is a feature? A feature is an attribute/measurement/value/characteristic of that data that can be used as an input to a model.
:::

## Loading data from the web
```{code-cell} ipython3
import sklearn
from sklearn.datasets import fetch_california_housing
houses = fetch_california_housing()
print(houses.DESCR)
```

### Getting Basic Information

```{code-cell} ipython3
houses.data.shape
houses.feature_names
pd.DataFrame(houses.data, columns=houses.feature_names)
```

## Generate dataset

```{code-cell} ipython3
from sklearn.datasets import make_regression
x,y = make_regression(n_samples=100, n_features=5, n_targets=1, noise=0.005)
pd.DataFrame(y)
pd.DataFrame(x)
```

### Plotting the data

```{code-cell} ipython3
import seaborn as sns
sns.set(color_codes=True)
sns.regplot(x=x, y=y);
```

## Load data from openml.org

```{code-cell} ipython3
from sklearn.datasets import fetch_openml
mice = fetch_openml(name='miceprotein')
print(mice.target)
```
## Review Book Example
- Up to prepare data for machine learning algorithms 
https://colab.research.google.com/github/ageron/handson-ml3/blob/main/02_end_to_end_machine_learning_project.ipynb


