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

# Introduction to NumPy 
## Description
- Ref: https://docs.scipy.org/doc/numpy/user/whatisnumpy.html
- Ref: https://s3.amazonaws.com/assets.datacamp.com/blog_assets/Numpy_Python_Cheat_Sheet.pdf
- NumPy provides a multidimensional array object. 
- Each object comes with an assortment of routines for fast operations on arrays, including mathematical, logical, shape manipulation, sorting, selecting, I/O, discrete Fourier transforms, basic linear algebra, basic statistical operations, random simulation and much more.
- Basically, you can use NumPy to create ndarray (N-dimensional array) and easily manipulate the array. It is super fast because it is written in C. 
## How is it different from Python arrays?
- Python lists can be modified -- you can add and remove elements. NumPy arrays have a fixed size at creation. 
- Python lists can contain different data types. NumPy arrays can only have one data type. If you put in mixed types, they become a string. 
- NumPy arrays come prepackaged with advanced mathematical operations. The operations are super fast even on large numbers of data and they use less memory.
## Why use NumPy
- Most data analysis programs use NumPy to manipulate data. They might take in data as standard Python lists, but they convert it to a NumPy array and manipulate the data using NumPy routines and output the transformed data as a NumPy array. 
- NumPy data array is the main data type used in most scientific and mathematical Python-based packages.
## Simple example

```python
# Square a list using Python
squared_values = []
for number in range(10):
    squared_values.append(number*number)

print(squared_values)

# Square a list using NumPy
import numpy as np

vector = np.array(range(10))
scalar = 5
print(vector * scalar)
print(vector * vector)

```


## Numpy Basics
- NumPy arrays can be a 1-D array, called a vector, or a 2-D array, called a matrix 

### NumPy casting -- covert Python list to a NumPy array
```Python
my_list = [1, 2, 3]
print(my_list)

import numpy as np

my_vector = np.array(my_list)
print(my_vector)

my_matrix = np.array([my_list, my_list])
np.hstack([my_list, my_list])

my_nested_list = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
my_matrix = np.array(my_nested_list)
print(my_matrix)

my_list1 = [[1,2], [3,4]]
my_list2 = [[5,6], [7,8]]  
np.hstack([my_list1, my_list2])   
np.vstack([my_list1, my_list2])

```

### NumPy creating arrays

```Python
my_list = range(10)

## Create array using arange
np.arange(10)
np.arange(0, 10)
np.arange(0, 10, 2)

## Create array of zeros
np.zeros(3)
np.zeros((3,3))

## Create array of ones
np.ones(3)
np.ones((3,3))
np.ones(3)*4

## Create evenly spaced vector
### Example use case: when you have Y values for a plot but need to generate X values
### *** Includes both start an end 
# np.arange(start, end(not included), step size)
# np.linspace(start, end(included), number_of_points)
np.linspace(0, 10, 5)
np.linspace(1900, 2000, 11)
```
