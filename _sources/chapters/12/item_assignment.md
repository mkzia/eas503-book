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

# Item assignment

- **Supporting files**
  - [testdata.txt](https://raw.githubusercontent.com/mkzia/eas503/master/old/spring2023/week9/testdata.txt)
  - [people.tsv](https://raw.githubusercontent.com/mkzia/eas503/master/old/spring2023/week9/people.tsv)

This section covers how to add some advanced functionality to your class.

So far we have learned how to define operators such as `+`, `-`, `*`, `/`, and `==` for your class. Now we will learn how to define the
assignment operator `=`.

```{code-cell} ipython3
class MyClass:
    def __init__(self, **kwargs):
        self.data = {}
              
    def __setitem__(self, key, value): # MyCLass[key] = value
        self.data[key] = value
        
    def __getitem__(self, key): # MyClass[key]
        return self.data[key]      

my_class = MyClass()


my_class['Exam1'] = 90
my_class['Exam1']
```

## Basic Columnar Functionality

- Add functionality to pass in multiple columns of data; with and without header
- Add functionality to select multiple columns
- If the data that is passed has header, use `header=True`; otherwise just assume that the headers will be sequentially
numbered.

```{code-cell} ipython3
from collections import defaultdict
class MyClass:
    def __init__(self, **kwargs):
        self.data = defaultdict(list)
        header = kwargs.get('header') 
        lines = kwargs.get('lines')
        if header:
            header = lines.pop(0)
        else:
            header = list(range(len(lines[0])))
        
        # Store the data as a dictionary
        for line in lines:
            row = dict(zip(header, line))
            for key,value in row.items():
                self.data[key].append(value)
              
    def __setitem__(self, key, value): # MyCLass[key] = value
        self.data[key] = value
        
    def __getitem__(self, key): # MyClass[key]
        if type(key) in (str, int):
            return self.data[key]   
        elif isinstance(key, list):
            output = []
            for k in key:
                output.append(self.data[k])
            output = list(zip(*output))              
            return output

filename = 'people.tsv'
people = []
with open(filename) as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        people.append(line.strip().split('\t'))


mc = MyClass(lines=people, header=True)
print(mc[['first_name', 'last_name', 'email']])
print(mc['first_name'])

people = tuple(people)
filename = 'testdata.txt'
grades = []
with open(filename) as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        grades.append(line.strip().split(','))

grades = tuple(grades)
mc = MyClass(lines=list(people), header=True)
print(mc[['first_name', 'last_name', 'email']])
print(mc['first_name'])


mc = MyClass(lines=list(grades))
print(mc[[1, 2]])
print(mc[0])
```

## Add functionality to calculate means

- Add functionality to calculate mean of a column(s)  
  - Before you can calculate the mean, you must cast/convert columns to the correct data type.

```{code-cell} ipython3
from collections import defaultdict



class ListV2:
    def __init__(self, values):
        self.values = values
        
    def __add__(self, right):
        output = [l + r for l, r in zip(self.values, right.values)]
#         return ListV2(output)
        return output
    
    def __repr__(self):
        return str(self.values)
        

class MyClass:
    def __init__(self, **kwargs):
        self.data = defaultdict(list)
        header = kwargs.get('header')
        lines = kwargs.get('lines')
        if header:
            header = lines.pop(0)
        else:
            header = list(range(len(lines[0])))
        
        for line in lines:
            row = dict(zip(header, line))
            for key,value in row.items():
                self.data[key].append(value)
              
    def __setitem__(self, key, value): # MyCLass[key] = value
        self.data[key] = value
        
    def __getitem__(self, key): # MyClass[key]
        if type(key) in [str, int]:
            return ListV2(self.data[key])  
        elif isinstance(key, list):
            output = []
            for k in key:
                output.append(self.data[k])
            output = list(zip(*output))
                
            return output
        
    def as_type(self, column, cast_type):
        self.data[column] = list(map(cast_type, self.data[column]))

filename = 'testdata.txt'
grades = []
with open(filename) as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        grades.append(line.strip().split(','))

grades = tuple(grades)

mc = MyClass(lines=list(grades))
print(mc[[1, 2]])
mc.as_type(1, int)
print(mc[[1, 2]])
mc.as_type(1, int)
print(mc[[1, 2]])
```

### Calculate Means

```{code-cell} ipython3
from collections import defaultdict


class ListV2:
    def __init__(self, values):
        self.values = values
        
    def __add__(self, right):
        output = [l + r for l, r in zip(self.values, right.values)]
#         return ListV2(output)
        return output
    
    def __repr__(self):
        return str(self.values)
        


class MyClass:
    def __init__(self, **kwargs):
        self.data = defaultdict(list)
        header = kwargs.get('header')
        lines = kwargs.get('lines')
        if header:
            header = lines.pop(0)
        else:
            header = list(range(len(lines[0])))
        
        for line in lines:
            row = dict(zip(header, line))
            for key,value in row.items():
                self.data[key].append(value)
              
    def __setitem__(self, key, value): # MyCLass[key] = value
        self.data[key] = value
        
    def __getitem__(self, key): # MyClass[key]
        if type(key) in [str, int]:
            return ListV2(self.data[key])  
        elif isinstance(key, list):
            output = []
            for k in key:
                output.append(self.data[k])
            output = list(zip(*output))
                
            return output
        
    def as_type(self, column, cast_type):
        self.data[column] = list(map(cast_type, self.data[column]))
        
    def mean(self, columns):
        if type(columns) in [str, int]:
            data = self.data[columns]
            return sum(data)/len(data)
        elif isinstance(columns, list):
            data = []
            for column in columns:
                data.append(sum(self.data[column])/len(self.data[column]))
            
            data =  [columns, data]
            return MyClass(lines=data, header=True)

filename = 'testdata.txt'
grades = []
with open(filename) as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        grades.append(line.strip().split(','))

grades = tuple(grades)

mc = MyClass(lines=list(grades))
mc.as_type(1, int)
mc.as_type(2, int)
a = mc.mean([1, 2])
print(a.data)       
```

## Add functionality to Slice

Basic example

```{code-cell} ipython3
class AClass:
    
    def __getitem__(self, a):
        print(a, type(a))
a = AClass()   
a[1:10:2, :]
```

```{code-cell} ipython3
b = slice(1, 10, 2)
print(b.start)
print(b.stop)
print(b.step)

print(a[:, 5:20:2])
```

### How to Transpose

```{code-cell} ipython3
x = [[1,2,3], [4, 5, 6], [7, 8,9]]
for c1, c2, c3 in zip(*x):
    print(c1, c2, c3)


x = {1: [5, 6], 2: [7, 8]}
list(zip(*x.values()))

```

```{code-cell} ipython3
from collections import defaultdict



class ListV2:
    def __init__(self, values):
        self.values = values
        
    def __add__(self, right):
        output = [l + r for l, r in zip(self.values, right.values)]
#         return ListV2(output)
        return output
    
    def __repr__(self):
        return str(self.values)
        

class MyClass:
    def __init__(self, **kwargs):
        self.data = defaultdict(list)
        header = kwargs.get('header')
        lines = kwargs.get('lines')
        if header:
            self.header = lines.pop(0)
        else:
            self.header = list(range(len(lines[0])))
        
        for line in lines:
            row = dict(zip(self.header, line))
            for key,value in row.items():
                self.data[key].append(value)
              
    def __setitem__(self, key, value): # MyCLass[key] = value
        self.data[key] = value
        
    def __getitem__(self, key): # MyClass[key]
        if type(key) in [str, int]:
            return ListV2(self.data[key])  
        elif isinstance(key, list):
            output = []
            for k in key:
                output.append(self.data[k])
            output = list(zip(*output))       
            return output
        elif isinstance(key, slice):
            all_rows = list(zip(*self.data.values()))
            output = all_rows[key.start:key.stop:key.step]
            return MyClass(lines=output)
            
        elif isinstance(key, tuple):
            row = key[0]
            col = key[1]
            columns = list(self.data.keys())
            columns = columns[col]
            data = []
            for col in columns:
                data.append(self.data[col])
            
            
            all_rows = list(zip(*data))
            output = all_rows[row.start:row.stop:row.step]
            output = [columns] + output
            return MyClass(lines=output, header=True)
            
            
        
    def as_type(self, column, cast_type):
        self.data[column] = list(map(cast_type, self.data[column]))
        
    def mean(self, columns):
        if type(columns) in [str, int]:
            data = self.data[columns]
            return sum(data)/len(data)
        elif isinstance(columns, list):
            data = []
            for column in columns:
                data.append(sum(self.data[column])/len(self.data[column]))
            
            data =  [columns, data]
            return MyClass(lines=data, header=True)
        
    def __repr__(self):
        print(self.header)
        for ele in list(zip(*self.data.values())):
            print(ele)


filename = 'testdata.txt'
grades = []
with open(filename) as f:
    for line in f:
        line = line.strip()
        if not line:
            continue
        grades.append(line.strip().split(','))

grades = tuple(grades)

mc = MyClass(lines=list(grades))
mc.as_type(1, int)
mc.as_type(2, int)  
a = mc[5:21:2, 1:6] 
print(a)        
```
