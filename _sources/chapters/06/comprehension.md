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

- [Video Recording (10 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=03d72d47-5c45-4273-b59e-afa9005ee0dc)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/06/comprehension.ipynb)


# Comprehension

## List Comprehension

- Unique to Python
- Three variations

```python
[ f(ele) for ele in sequence ]

[ f(ele) for ele in sequence if condition ]

[ f(ele) if condition else g(ele) for ele in sequence ]

[ f(ele) for ele in sequence if condition1 and condition2]

```


## Tuple Comprehension
- Tuple Comprehension returns a generator
- Generators generate one-time use values

```python
( f(ele) for ele in sequence )

( f(ele) for ele in sequence if condition )

( f(ele) if condition else g(ele) for ele in sequence )

```


## List Comprehension Exercises 

## Exercise 1
Re-write the following code to use List Comprehension

```python
my_list = [1, 2, 3]
new_list = []
for ele in my_list:
    tmp = ele * ele
    new_list.append(tmp)
```


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
my_list = [1, 2, 3]
new_list = []
for ele in my_list:
    tmp = ele * ele
    new_list.append(tmp)
new_list = [ele*ele for ele in my_list]
```

## Exercise 2
Re-write the following code to use List Comprehension
Multiply each number by 10

```python
my_list = [1, 2, 3]
new_list = []
for ele in my_list:
    tmp = ele * 10
    new_list.append(tmp)
```


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
my_list = [1, 2, 3]
new_list = []
for ele in my_list:
    tmp = ele * 10
    new_list.append(tmp)
new_list = [ele*10 for ele in my_list]
```

## Exercise 3
Upper case each letter in animal variable

```python
animal = 'buffalo'
```

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
animal = 'buffalo'
[char.upper() for char in animal]
```

## Exercise 4
Title each name in the student list

```python
students = ['john', 'jane', 'doe']
```

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
students = ['john', 'jane', 'doe']
[student[0].upper()+student[1:] for student in students]
students = ['john', 'jane', 'doe']
print([student.title() for student in students])
```

## Exercise 5
Use list comprehension to get the Truthiness of each element in `my_list`

```python
my_list = [0, '', []]
```


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
my_list = [0, '', []]
[bool(ele) for ele in my_list]
```

## Exercise 6
Convert each element of my_list to str using list comprehension

```python
my_list = range(6)
```


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
my_list = range(6)
[str(element) for element in my_list]
```

## Exercise 7
Use list comprehension to reduce a list of numbers to just even or odd

```python
numbers = range(20)
```

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
numbers = range(20)
even = [number for number in numbers if number % 2 == 0 ]
odd = [number for number in numbers if number % 2 != 0 ]
```

## Exercise 8
Use list comprehension to modify a list of numbers such that evens are left as is
and the odds are raised to the three power

```python
numbers = range(10)
```


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
numbers = range(10)
[number if number % 2 == 0 else number**3 for number in range(10)]
```

## Exercise 9
Use list comprehension to remove vowels from a sentence

```python
sentence = 'I rEAlly want to gO to work'
```

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
sentence = 'I rEAlly want to gO to work'
''.join([char for char in sentence if char.lower() not in 'aeiou'])
```
