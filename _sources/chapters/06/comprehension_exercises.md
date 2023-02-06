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


# List Comprehension Exercises 

## Exercise 1
Re-write the following code to use List Comprehension

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

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
animal = 'buffalo'
[char.upper() for char in animal]
```

## Exercise 4
Title each name in the student list

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
students = ['john', 'jane', 'doe']
[student[0].upper()+student[1:] for student in students]
```

## Exercise 5
Use list comprehension to get the Truthiness of each element in `my_list`

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
my_list = [0, '', []]
[bool(ele) for ele in my_list]
```

## Exercise 6
Convert each element of my_list to str using list comprehension
```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
my_list = range(6)
[str(element) for element in my_list]
```

## Exercise 7
Use list comprehension to reduce a list of numbers to just even or odd
```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
numbers = range(20)
even = [number for number in numbers if number % 2 == 0 ]
odd = [number for number in numbers if number % 2 != 0 ]
```

## Exercise 8
Use list comprehension to modify a list of numbers such that evens are left as is
and the odds are raised to the three power

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
numbers = range(10)
[number if number % 2 == 0 else number**3 for number in range(10)]
```

## Exercise 9
Use list comprehension to remove vowels from a sentence

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
sentence = 'I rEAlly want to gO to work'
''.join([char for char in sentence if char.lower() not in 'aeiou' and char.lower() not in 'nt'])
```
