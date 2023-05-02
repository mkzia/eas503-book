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


# Implementing NumPy


## Create an identify matrix 
```Python
np.eye(3)
```

## Creating an empty array
```python
np.empty((2,3))
```

## Creating Random Numbers
- Ref: https://docs.scipy.org/doc/numpy-1.14.0/reference/routines.random.html

```python
# Uniform distribution 
np.random.rand(3)
np.random.rand(3,3)
# Normal distribution
np.random.randn(3)
np.random.randn(3,3)
# Random integers
# np.random.randint(start, end(not_included), size)
np.random.randint(1,101)
np.random.randint(1,101,5)  
```

## Reshaping arrays

```python

vector = np.arange(1,10)
print(vector.reshape(3,3))

vector = np.arange(1,13)
print(vector.reshape(3,4))
```

## Basic array operations
```python
vector = np.random.randint(1,50,25)
# Min
vector.min()
# Max
vector.max()
# get location of min value
index = vector.argmin()
# get location of max value
index = vector.argmax()
# get shape
vector.shape

my_matrix = vector.reshape(5, 5)
my_matrix.shape
```

## Indexing a 1-D array -- vector
```python
vector = np.array(range(10))
# vector[index]
# vector [start:end]
# vector [:end]
# vector [start:]
# vector [start, end, step]

vector[3]
vector[3:8]
vector[:5]
vector[5:]
vector[3:9:2]
vector[-1]
```

## Setting multiple values at once -- Broadcasting
- There are two main features of NumPy arrays
  - Broadcasting -- set multiple values at once
  - Vectorization -- no need for explicit looping -- example, vector multiplication or squaring


```python
vector[3:6] = 12
```

## BE CAREFUL
- If you store a slice of an array in a new variable, changes in the new variable will be reflected in the original array. 

```python
vector = np.array(range(10))
my_slice = vector[3:7]
my_slice[:] = 20
print(vector)
```

- Copy the array if you need a copy
```python
vector = np.array(range(10))
my_slice_copy = vector[3:7].copy()
print(vector)
```

## Indexing a 2-D array -- Matrix
- Remember -- Python is zero-indexed
```python
matrix = np.array(range(1,10)).reshape((3,3))
matrix[0,0]
matrix[0][0] 
matrix[2,2]  
matrix[2][2] 


matrix[:,2] # Grab the third column
matrix[1,:] # Grab the second row
matrix[:2] # grab the first two rows, all columns
matrix[:2,:] # grab the first two rows, all columns
matrix[:,1:] # grab all the rows, but columns starting from 1
```

## Conditional selection

```python
vector = np.arange(10)
gt2 = vector > 2 # create condition
lt8 = vector < 8 # create condition

selected_gt2 = vector[gt2] # apply condition to select
selected_lt8 = vector[lt8] # apply condition to select

vector[vector>2]
vector[vector<8]

cond = (vector>2) & (vector<7)
vector[cond]

cond = (vector>=2) & (vector<=7)
vector[cond]
```

## Array operations -- Basic

```python
vector = np.arange(10)

vector + vector
vector - vector
vector * vector
vector / vector # problem!!! return `nan` 
vector + 10
vector - 10
vector * 10
vector / 10
```

## Array operations -- Advanced
- Ref: https://docs.scipy.org/doc/numpy/reference/ufuncs.html#math-operations
- https://stackoverflow.com/questions/25773245/ambiguity-in-pandas-dataframe-numpy-array-axis-definition/43413031
```python
vector = np.arange(10)
np.max(vector)
np.min(vector)
np.sqrt(vector)
np.log(vector)

sum(vector<5)
import math
vector = np.arange(1,11) * math.pi 
np.sin(vector)
vector = np.arange(0,math.pi+math.pi/4,math.pi/4)
np.sin(vector)

matrix = np.random.rand(5,5)
np.floor(matrix*1000)/1000
np.round(matrix*1000)/1000
np.ceil(matrix*1000)/1000

matrix = np.arange(1,10).reshape(3,3)
matrix.sum(axis=1) 
matrix.sum(axis=0) 
matrix.cumsum() 
matrix.cumprod() 

matrix.min(axis=1) 
matrix.min(axis=0) 

matrix.max(axis=1) 
matrix.max(axis=0) 

matrix = np.array([1,2,3]*3).reshape(3,3)
np.unique(matrix.reshape(3,3))
```
