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

- [Video Recording (28 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=e9c44de7-a4de-4510-a573-afa9005b568d)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/06/loop.ipynb)


# Loops

## Repeating code using loops

```
for <ele> in <sequence>:
    <body>
```

- The loop index variable `ele` takes on each successive value in the sequence, and the statements in the body of the loop are executed once for each value.
- For loops have a limitation -- you have to know how many times you are looping -- it is a definite loop. The number of iterations is determined when the loop starts. If you do not know how many times you will be looping, use a while loop, which is an indefinite loop that will continue to loop until its condition is no longer true.

```
while <condition>
    <body>
```

## Controlling Loops
- `break` - Used to break a loop
- `continue` - Used to skip the current loop and go to the next value

## Range

```python
range(start,stop,step) # [start:step:stop)
```

## Examples

### Example 1
```python
values = [4, 10, 3, 8, -6]
for i in range(len(values)):
    print(i)
```

### Example 2
```python
values = [4, 10, 3, 8, -6]
for i in range(len(values)):
    print(i, values[i])
```

### Example 3
```python
values = [4, 10, 3, 8, -6]
for i in range(len(values)):
    print(i, values[i])
```

### Example 3
```python
values = [4, 10, 3, 8, -6]
for index, value in enumerate(values):
    print(index, value)
```

### Example 4
```python
values = [4, 10, 3, 8, -6]
for i in range(len(values)):
    values[i] = values[i] * 2
```

### Example 5
```python
metals = ['Li', 'Na', 'K']
weights = [6.941, 22.98976928, 39.0983]
for i in range(len(metals)):
    print(metals[i], weights[i])
```

### Example 6
```python
metals = ['Li', 'Na', 'K']
weights = [6.941, 22.98976928, 39.0983]
for metal, weight in zip(metals, weights):
    print(metal, weight)
```

### Example 7
```python
elements = [['Li', 'Na', 'K'], ['F', 'Cl', 'Br']]
for inner_list in elements:
    for item in inner_list:
        print(item)
```

### Example 8

```python
info = [
    ['Isaac Newton', 1643, 1727],
    ['Charles Darwin', 1809, 1882],
    ['Alan Turing', 1912, 1954, 'alan@bletchley.uk']
]
for item in info:
    print(len(item))
```

## How to sum numbers in an array?

```python
x = [1, 7, 3]

sum = 0
for ele in x:
    sum = sum *10 + ele
```

## How to sort without sorting?
```python
string1 = '1134000234'
string2 = ''.join(sorted([ele for ele in string1]))
string3 = ''.join(sorted([ele for ele in string1], reverse=True))
print(string1, string2, string3)
```

```python
store = [0] * 10

for char in string1:
    index = int(char)
    store[index] += 1

sorted_string = ''
for idx, ele in enumerate(store):
    sorted_string += str(idx) * ele
print(sorted_string)
```

## How to sum an integer?
```python
number = 1234
sum = 0
while number:
    sum += number % 10
    number = number // 10 
print(sum)
```

## File Handling

```python
with open(filename, 'r') as file:
    for line in file:
        if not line.strip(): # used for skipping empty lines!
            continue
        # do something with line
```


## Skipping Bad values
You can use a `try/except` blocks to skip bad values

```python
try:
    value = float(line)
except:
    continue
```

## Initial Values
Sometimes before the for loop code you to have initialize a variable to 0 or an empty list.
1. If you want to calculate the average or sum of a list, for example, you would need to initialize a variable to zero and update it every time you access a new element in a list.

```python
total = 0
count = 0
for value in my_list:
   total += value
   count += 1
average = total / count
```

2. If you want to keep track of some values as you loop over some list, you might need to initialize an empty list. One example is removing duplicates from a sequence.

```python
unique_values = []
for ele in sequence:
    if ele not in unique_values:
        unique_values.append(ele)
```


