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


# Lists and Tuples
- So far we have covered the following data types: `int`, `float`, `str`, `None` and `bool`. Now we will cover `list`, and `tuple` which are a sequence data types. 
- Data types in Python can be classified as `mutable` and `immutable`. 
    - Immutable data types are: `int`, `float`, `bool`, and `tuple`
    - Mutable data types are: `list`, `dict`, and `set`
    - NOTE: In other programming language, data types such as ints and floats are passed to a function using `pass-by-value` and
    data types such as arrays are `pass-by-reference`. This means that changes made to ints and floats inside a function do not change the value outside of the function because they were passed a copy (independent copy). As for arrays, they are passed to a function as a reference, so changes made to the array persist outside the function. 
    - NOTE: In Python, however, everything is passed to a function using `pass-by-object-reference`.
  
    :::{warning}
    Ref: Python for Programmers by Paul Deitel and Harvey Deitel

    In many programming languages there are two ways to pass arguments--pass-by-value
    and pass-by-reference (sometimes called call-by-value and call-by-reference, respectively):
      - With pass-by-value, the called function receives a copy of the argument's value 
      and works exclusively with that copy. Changes to the function's copy do not affect the original
      variable's value in the caller.
      - With pass-by-reference, the called function can access the argument's value in the caller
      directly and modify the value if it's mutable. 

    Python arguments are ALWAYS passed by reference. Some people call this pass-by-object-reference, 
    because "everything in Python is an object." When a function call provides an argument, Python copies
    the argument object's reference--not the object itself--into the corresponding parameter. This
    is important for performance. Function often manipulate large objects--frequency copying them would
    consume large amount of computer memory and significantly slow down program performance. 
    :::


## List
- `list` is a container for storing a sequence of values. The values can be of different type. When the values are all `int`, `float`, or `bool`, you can use special functions. 

### List Index
An index is used to access a particular element in a list. All the elements in the list get a number or index. The element numbering starts at 0, which means that the first element is accessed using 0, the second element is accessed using 1, etc. Since the numbering starts at 0, Python indexing is called 0-indexed. The square brackets on a list with index number lets you access a particular element: my_list[0] will access the first element in the list.


### Creating a list

```python
grades = ['A', 'B', 'C', 'D', 'F']
days_in_months = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
grades_count [20, 40, 10, 2, 3]
```

### Accessing a list
```python
grades[0]
grades[1]
days_in_months[11]
days_in_months[3]
days_in_months[0]
``` 

### Slicing a list
- List slicing allows you to pick out specific elements from a list. In oder to understand the list slicing, you need to know five things:
  1. Start index -- this is the index from which the slice of a list is taken. This index is included.
  2. End Index -- this is the index to which the slice is taken up to but not including.
  3. Step size -- you can specify a skip factor that allows you to skip certain number of values
  4. the colon is used separate start and end index and the step size.
  5. Start index, end index, and step size are all optional, but you need at least one
- Here are some variations of slicing:
  1. start index, but no end index -- my_list[3:] -- will take all elements from index 3 to the end of list, including the last value
  2. end index, but not start index -- my_list[:10] -- will take all elements from start of the of the list to index 10, but not include value at index 10
  3. both start and end index -- my_list[3:10] -- this will include all elements from index 3 all the way up to index 10, but not include index 10.
  4. start and end index and step size -- my_list[3:10:2] -- same as #3 but take every other element.
  5. no start index, end index, and step size -- my_list[:10:2] -- take all elements from start of list to index number 10, but not including index number 10; also take every other element.

```python
grades[2:4]
grades[1::2]
```

### -1 Index
- Index -1 means the last index in the list
```python
grades = ['A', 'B', 'C', 'D', 'F']
grades[-1] # returns the last element in the list
grades[::-1] # this is taking all the elements in the list but in reverse order; can be used to reverse a string
```
- `grades[::-1]` -- This starts at the end of the list and ends at position zero by stepping backward because of `-1` index.

### Reassigning a list
```python
grades = ['A', 'B', 'C', 'D', 'F']
grades[0] = 'a'
grades[1:2] = 'a'
grades[2:] = ['d', 'f']
```

### Deleting from a list
- Two ways to delete
```python
grades = ['A', 'B', 'C', 'D', 'F']
del grades[0]
del grades[1:3]
del grades
```

```python
grades = ['A', 'B', 'C', 'D', 'F']
grades.pop() # deletes the last element in list and returns it 
grades.pop(1) # deletes the first element in list and returns it
grades.pop(3) # deletes the fourth element in list and returns it
```

### The Plus Operator
- The `+` operator on a list combines two lists and **RETURNS** a new list
```python
grades1 = ['A', 'B', 'C']
grades2 = ['D', 'F']
grades = grades1 + grades2
```

### The Multiplication Operator 
- The `*` duplicates a list x number of times and RETURNS a concatenated list
```python
grades = ['A', 'B', 'C', 'D', 'F']
grades *= 3
```

### Can store different data types
- But you will lose some processing functionality, such as `max`, `min`, and `sum`.
```python
my_list = ['A', 1, 'Spam', True]
my_list2 = [['John', [55, 65, 86]], ['Jane', [70, 80, 80]]
```

### `in` Operator
- The `in` operator returns `True` if an element exists in a list

```python
my_list = ['A', 1, 'Spam', True]
'A' in my_list
```


### Built-in List Functions
- `len()` calculate length of list
- `max()` calculate max of list
- `min()` calculate min of list
- `sum()` calculate sum of list
- `sorted()` return a sorted list
- `list()` cast to type list -- convert tuple to list or a generator to list
- `any()` return `True` if the truthiness of any value is `True` in the list
- `all()` return `True` if the truthiness of all the values is `True` in the list


```{code-cell} ipython3
numbers = [3, 4, 8, 9, 5, 6, 7, 0, 1, 2, 10, 11, 12]
len(numbers)
```

```{code-cell} ipython3
numbers = [3, 4, 8, 9, 5, 6, 7, 0, 1, 2, 10, 11, 12]
max(numbers)
```

```{code-cell} ipython3
numbers = [3, 4, 8, 9, 5, 6, 7, 0, 1, 2, 10, 11, 12]
min(numbers)
```

```{code-cell} ipython3
numbers = [3, 4, 8, 9, 5, 6, 7, 0, 1, 2, 10, 11, 12]
sum(numbers)
```

```{code-cell} ipython3
numbers = [3, 4, 8, 9, 5, 6, 7, 0, 1, 2, 10, 11, 12]
sorted(numbers)
```

```{code-cell} ipython3
numbers = (3, 4, 8, 9, 5, 6, 7, 0, 1, 2, 10, 11, 12)
list(numbers)
```

```{code-cell} ipython3
booleans = [True, False, True]
print(any(booleans))
print(all(booleans))
```

```{code-cell} ipython3
booleans = [True, True, True]
print(any(booleans))
print(all(booleans))
```

### List unpacking 
```python
a, b = [3,4]
```

