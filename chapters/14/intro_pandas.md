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


# Pandas
- Built-on top of NumPy -- meaning the underlying data structure used is ndarray
- Pandas provides series which are like NumPy arrays but with associated index labels -- meaning are like column  labels or row labels. Element data type can be different
- Pandas also provides dataframes which are like Excel sheets or database tables


## Basic examples

```python
import numpy as np
import pandas as pd

header = ['chrom', 'pos', 'filter']
data = [4, 12345, 38.4]

vector = np.array(data)
data_dict = {'chrom': 4, 'pos': 12345, 'filter': 38.4}

s1 = pd.Series(data=data) # Notice the data type is float
s2 = pd.Series(data=data, index=header)

# can also do 
s1 = pd.Series(data)
s2 = pd.Series(data, header)

# can hold different data types

data = [1, '2s', 34] 
pd.Series(data)

# can use a dictionary to initialize a panda series
pd.Series(data_dict)

## Using index labels to fetch element
header = ['chrom', 'pos', 'filter']
data = [4, 12345, 38.4]
series = pd.Series(data=data, index=header)
series['chrom']
series['filter']

series = pd.Series(data)
series[0]


## Basic operations
header1 = ['chrom', 'pos', 'filter']
data1 = [4, 12345, 38.4]
header2 = ['chrom', 'pos', 'filter', 'qual']
data2 = [3, 4899, 234, 89.9]

s1 = pd.Series(data1, header1)
s2 = pd.Series(data2, header2)
s1+s2 

header1 = ['chrom', 'pos', 'filter']
data1 = [4, 12345, 38.4]
header2 = ['chrom', 'pos', 'filter', 'qual']
data2 = ['3', 4899, 234, 89.9]

s1 = pd.Series(data1, header1)
s2 = pd.Series(data2, header2)
s1+s2       # Throws error can't add int and str(data2[0])

data1 = [4, 12345, 38.4]
data2 = [3, 4899, 234, 89.9]

s1 = pd.Series(data1)
s2 = pd.Series(data2)


## IMPORTANT - with index labels -- operations are based on label
header1 = ['pos', 'filter', 'chrom']
data1 = [12345, 38.4, 4]
header2 = ['chrom', 'pos', 'filter', 'qual']
data2 = [3, 4899, 234, 89.9]

s1 = pd.Series(data1, header1)
s2 = pd.Series(data2, header2)
s1+s2 


data1 = [12345, 38.4, 4]
data2 = [3, 4899, 234, 89.9]

s1 = pd.Series(data1)
s2 = pd.Series(data2)
```

## Dataframes -- 
- Dataframe is composed of series
- Ref: https://pandas.pydata.org/docs/reference/api/pandas.io.formats.style.Styler.html#pandas.io.formats.style.Styler

```python
import numpy as np
import pandas as pd

header = ['exam1', 'exam2', 'exam3']
data = np.random.randint(65, 101, 12).reshape(4,3)
students = ['student1', 'student2', 'student3', 'student4']

df = pd.DataFrame(data=data, columns=header)

df = pd.DataFrame(data=data, index=students, columns=header)
df['exam1']
df.exam1 # not a good way to do this


df['average'] = (df['exam1'] + df['exam2'] + df['exam3'])/3 
df.drop('average') # does not work because default for drop is to work on row labels
df.drop('average', axis=1) # works on column labels 

## STILL NOT DROPPED from df
df
df.drop('average', axis=1, inplace=True)

## drop a student
df.drop('student3')

header = ['exam1', 'exam2', 'exam3']
data = np.random.randint(65, 101, 12).reshape(4,3)
students = ['student1', 'student2', 'student3', 'student3']
df = pd.DataFrame(data=data, index=students, columns=header)

df.drop('student3')
df.drop('student3', inplace=True)
## Row is referred to as axis=0
## Column is referred to as axis=1
## (R,C) == (axis=0, axis=1) df.shape
```

### Select Dataframe rows
```python
header = ['exam1', 'exam2', 'exam3']
data = np.random.randint(65, 101, 12).reshape(4,3)
students = ['student1', 'student2', 'student3', 'student4']
df = pd.DataFrame(data=data, index=students, columns=header)

df.loc['student1']
df.iloc[0] ## remember that column names do not count as rows
```
