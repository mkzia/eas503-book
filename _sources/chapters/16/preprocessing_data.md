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


# Preprocessing data

## Standardization, or mean removal and variance scaling

Standardization of datasets is a common requirement for many machine learning estimators implemented in scikit-learn; they might behave badly if the individual features do not more or less look like standard normally distributed data: Gaussian with zero mean and unit variance.

In practice we often ignore the shape of the distribution and just transform the data to center it by removing the mean value of each feature, then scale it by dividing non-constant features by their standard deviation.

```{code-cell} ipython3
from IPython.display import display
from sklearn import preprocessing
import numpy as np
X_train = np.array([[ 1., -1.,  2.],
                    [ 2.,  0.,  0.],
                    [ 0.,  1., -1.]])

df = pd.DataFrame(X_train)
display(df)

X_scaled = preprocessing.scale(df)

X_scaled      

#rows are different patients/subjects/flowers
# columns are various features of the patients/subjects/flowers
```

```{code-cell} ipython3
df.describe()
```


```{code-cell} ipython3
idata = iris_dataset.data
id_scaled = preprocessing.scale(idata)
idata.mean(axis=0)
id_scaled.mean(axis=0)
id_scaled.var(axis=0)
```

```{code-cell} ipython3
X_train.mean(axis=0)
X_scaled.mean(axis=0)
```

```{code-cell} ipython3
X_scaled.std(axis=0)
X_scaled.mean(axis=1)
X_scaled.std(axis=1)
```
## Can save scaling and apply to testing data

- Never ever apply any preprocessing or any other step on all your data and then train. This will lead to Data Leakage!

```{code-cell} ipython3
scaler = preprocessing.StandardScaler().fit(X_train)
scaler                         
scaler.transform(X_train)  
```

:::{note}
Be careful about data leakage 
https://www.atoti.io/articles/what-is-data-leakage-and-how-to-mitigate-it/
:::

```{code-cell} ipython3
X_test = [[-1., 1., 0.]]
scaler.transform(X_test)  
```

## Scaling features to a range


```{code-cell} ipython3
X_train = np.array([[ 1., -1.,  2.],
                    [ 2.,  0.,  0.],
                    [ 0.,  1., -1.]])

min_max_scaler = preprocessing.MinMaxScaler()
X_train_minmax = min_max_scaler.fit_transform(X_train)
X_train_minmax
```

```{code-cell} ipython3
X_test = np.array([[-3., -1.,  4.]])
X_test_minmax = min_max_scaler.transform(X_test)
X_test_minmax
```

## Pre-processing data - Non-linear transformation
- This is a very silly example, but just demonstrating usage. 

```{code-cell} ipython3
import pandas as pd
%matplotlib inline
df = pd.read_csv('international-airline-passengers.csv')
display(df)
```

```{code-cell} ipython3
df['passengers'].hist(bins=20)
```

```{code-cell} ipython3
import numpy as np
df['passengers'] = np.log(df['passengers'])
df['passengers'].hist(bins=20)
```

## Normalization

```{code-cell} ipython3
from sklearn import preprocessing
X = [[ 1., -1.,  2.],
     [ 2.,  0.,  0.],
     [ 0.,  1., -1.]]
X_normalized = preprocessing.normalize(X, norm='l1')

X_normalized   
# http://www.chioka.in/differences-between-the-l1-norm-and-the-l2-norm-least-absolute-deviations-and-least-squares/
```

### Can save the normalization for future use

```{code-cell} ipython3
normalizer = preprocessing.Normalizer().fit(X)  # fit does nothing
normalizer.transform(X)    
```

```{code-cell} ipython3
normalizer.transform([[2.,  1., 0.]]) 
```

## Preprocessing data - Encoding

```{code-cell} ipython3
from sklearn import preprocessing
enc = preprocessing.OrdinalEncoder()
X = [['male', 'from US', 'uses Safari'], 
     ['female', 'from Europe', 'uses Firefox']]
enc.fit(X)  
```


```{code-cell} ipython3
enc.transform([['female', 'from US', 'uses Safari']])
```

```{code-cell} ipython3
enc.transform([['male', 'from Europe', 'uses Safari']])
```

```{code-cell} ipython3
enc.transform([['female', 'from Europe', 'uses Firefox']])
```

### One Hot Encoder

```{code-cell} ipython3
genders = ['female', 'male']
locations = ['from Africa', 'from Asia', 'from Europe', 'from US']
browsers = ['uses Chrome', 'uses Firefox', 'uses IE', 'uses Safari']
enc = preprocessing.OneHotEncoder(categories=[genders, locations, browsers])
X = [['male', 'from US', 'uses Safari'], ['female', 'from Europe', 'uses Firefox']]
enc.fit(X) 
enc.categories_
```

```{code-cell} ipython3
enc.transform([['male', 'from US', 'uses Safari']])
```

```{code-cell} ipython3
tmp = enc.transform([['female', 'from Asia', 'uses Chrome'],
                    ['male', 'from Europe', 'uses Safari']]).toarray()
tmp
```


## Discretization

Discretization (otherwise known as quantization or binning) provides a way to partition continuous features into discrete values. Certain datasets with continuous features may benefit from discretization, because discretization can transform the dataset of continuous attributes to one with only nominal attributes.

One-hot encoded discretized features can make a model more expressive, while maintaining interpretability. For instance, pre-processing with a discretizer can introduce nonlinearity to linear models.

```{code-cell} ipython3
X = np.array([[ -3., 5., 15 ],
              [  0., 6., 14 ],
              [  6., 3., 11 ]])
est = preprocessing.KBinsDiscretizer(n_bins=[3, 2, 4], encode='ordinal').fit(X)
est.transform(X)
```

## Univariate feature imputation
- Impute missing values 


```{code-cell} ipython3
import numpy as np
from sklearn.impute import SimpleImputer
imp = SimpleImputer(missing_values=np.nan, strategy='mean')
orig_data = [[1, 2],
         [np.nan, 3], 
         [7, 6]]
imp.fit(orig_data)  
imp.transform(orig_data)
```

```{code-cell} ipython3
X = [[np.nan, 2], 
     [6, np.nan], 
     [7, 6]]
print(imp.transform(X))  
```

```{code-cell} ipython3
import pandas as pd
df = pd.DataFrame([["a", "x"],
                   [np.nan, "w"],
                   ["a", np.nan],
                   ["b", "y"]], dtype="category")

imp = SimpleImputer(strategy="most_frequent")
print(imp.fit_transform(df)) 
```

```{code-cell} ipython3
import pandas as pd
df = pd.DataFrame([["a", "x"],
                   [np.nan, "y"],
                   ["c", np.nan],
                   ["b", "y"]], dtype="category")

imp = SimpleImputer(strategy="most_frequent")
print(imp.fit_transform(df)) 
```

## Review Book Examples
https://en.wikipedia.org/wiki/Correlation#/media/File:Correlation_examples2.svg

https://scikit-learn.org/stable/auto_examples/miscellaneous/plot_pipeline_display.html

https://colab.research.google.com/github/ageron/handson-ml3/blob/main/02_end_to_end_machine_learning_project.ipynb
##