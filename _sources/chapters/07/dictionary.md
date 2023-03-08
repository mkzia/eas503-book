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

# Dictionaries 

In certain context, lists/tuples have a limitation where you do not know what the "meaning" of each element is. For example, we used `days_in_months = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]` to represent the the days in months with the assumption that the index corresponds to month digit. Another example, a tuple that represents students,
```python
(
    ('John Doe', 'jdoe@buffalo.edu', 11223344, 'Biology'),
    ('Jane Doe', 'jane@buffalo.edu', 22334455, 'Chemistry'),
)
```
In both cases you as the programmer know what the data structure holds because you are using it ia specific way.Dictionary is a data structure that allows you to associate a "name" with each value. The months can be represented as

```python
days_in_months = {
    'Jan': 31,
    'Feb': (28,29),
    'Mar': 31,
    'Apr': 30,
    'May': 31,
    'Jun': 30,
    'Jul': 31,
    'Aug': 31,
    'Sep': 30,
    'Oct': 31,
    'Nov': 30,
    'Dec': 31,
}
```


```python
(
    {
        'Name': 'John Doe', 
        'Email': 'jdoe@buffalo.edu',
        'ID': 11223344, 
        'Major': 'Biology'
    },
    {
        'Name': 'Jane Doe', 
        'Email': 'Jane@buffalo.edu',
        'ID': 22334455, 
        'Major': 'Chemistry'
    },
)
```

- The"name is called a "key"
- The value is called a "value"
- Together they are called a key-value pair
- Key is the 'index' to access the corresponding value
- Python dictionary (since v3.6) keep the key values in the order they were inserted


## Creating a Dictionary
- There are two ways to create a dictionary
### Method 1
- my_dict = {}
```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
```


### Method 2
- my_dict = dict()

```python
my_dict = dict(
    name='john',
    email='john@email.com',
    id=1234,
    major='Engineering'
)
```

## Accessing a Value
```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}

print(my_dict['name']) # Method 1

key = 'name' # Method 2 -- use a variable key
print(my_dict[key])
```

## Iterating Over a Dictionary

### By Values

```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
for value in my_dict.values():
    print(value)
```

### By Keys

```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
for key in my_dict.keys():
    print(key)
```

### Key-Value Pair

```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
for key, value in my_dict.items():
    print(f'key is {key} and value is {value}')
```

## Checking if a Key Exists 

```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}

key = 'Major'
if key in my_dict:
    print(True)
else:
    print(False)
```


## Dictionary Methods
- Methods are functions that are attached to a data

### Empty Dict
```python
my_dict.clear() ## empty dict
```


### Copy a Dict
- Creates a **SHALLOW COPY**
```python
my_dict.copy() # Shallow copy
```

```python
x = {1: True, 2: [3, 4, 5]}
y = x.copy()
x[1] = False
print(x, y)
```

```python
x = {1: True, 2: [3, 4, 5]}
y = x.copy()
x[2].append(6)
print(x, y)
```

- Create a deep copy using the `copy` module

```python
import copy
x = {1: True, 2: [3, 4, 5]}
y = copy.deepcopy(x)
x[2].append(6)
print(x, y)
```

### Creating dictionary using initial values
```python
new_student = {}.fromkeys(
    ['name', 'email', 'id', 'major'], 'missing')

my_dict = {}.fromkeys(range(5), 'iammissing')
```

### Safely getting a value
- If a key does not exist and you try to access it, Python will raise an error. Instead, you can use the `get()` method to safely get the value, meaning it will return `None` if the key does not exist. The default is `None` for missing key, but you can override that. 


```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
my_dict.get('name', None) # default
my_dict.get('name', False)
my_dict.get('name', 'defaultname')
```

### Removing Values from a Dictionary

#### Method 1 
```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
my_dict.pop('name')
```


#### Method 2
```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
del my_dict['name']
```

What happens when you try to remove a key that does not exist? 


### Removing Last Item from the Dictionary

```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
my_dict.popitem()
```

### Updating a Dictionary
- Updates over write pre-existing keys

#### Method 1 
- pass in a another dictionary to the `.update()` method
```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
my_dict.update({'Graduate Year': 2024})
```

#### Method 2
- Individually set a value
```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
my_dict['Graduate Year'] = 2024
```

#### Method 3
- Remember to save the value!!!
```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
my_dict | {'Graduate Year': 2024}

print(my_dict)
```

```python
my_dict = {
    'name': 'john',
    'email': 'john@email.com',
    'id': 1234,
    'major': 'Engineering'
}
my_dict |= {'Graduate Year': 2024}

print(my_dict)
```

## Handing Missing Keys
- Say you need to update a key but you do not know if it exists, how would you do it?

```python
my_dict = {'LoginCount': 0}
my_dict['LoginCount'] += 1
```

```python
my_dict = {'Grades': []}
my_dict['Grades'].append(3)
```


```python
my_dict = {}
if 'LoginCount' not in my_dict:
    my_dict['LoginCount'] =  0
my_dict['LoginCount'] += 1
```

```python
my_dict = {}
if 'Grades' not in my_dict:
    my_dict['Grades'] =  []
my_dict['Grades'].append(3)
```

- A better way when you know the data type is `defaultdict`

```python
from collections import defaultdict
my_dict = defaultdict(int)
my_dict['LoginCount'] += 1
```

```python
from collections import defaultdict
my_dict = defaultdict(list)
my_dict['Grades'].append(3)
```

## Counting
```python
from collections import Counter
days_in_months = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

Counter(days_in_months)
```

## Dictionary Comprehension    


```python
{ ele:f(ele) for ele in sequence }

{ ele:f(ele) for ele in sequence if condition }

{ ele:f(ele) if condition else g(ele) for ele in sequence }

{ ele:f(ele) for ele in sequence if condition1 and condition2}

```

### Examples

```{code-cell} ipython3
{key: key*value for key, value in my_dict.items()}
```

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
{num: num*num for num in range(5)}
```

```{code-cell} ipython3
{num: ("even" if num % 2 == 0 else "odd") for num in range(1, 20)}
```

#### Zip two lists

```{code-cell} ipython3
list1 = ['john', 'jane', 'doe']
list2 = [95, 99, 98]

{list1[i]: list2[i] for i in range(len(list1))}
```

```{code-cell} ipython3
dict(zip(list1,list2))
```