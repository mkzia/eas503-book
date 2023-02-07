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

# String methods
- We have already encountered functions: built-in functions and functions we have defined. A method is another kind of function that is attached to a particular type. This section covers
the methods that are attached to string types.  
- Method calls in this form—`'browning'.capitalize()`—are shorthand for this: `str.capitalize('browning')`. 
- Methods are like functions, except that the first argument must be an object of the class in which the method is defined.

## Strip Methods
- `strip()` -- Strip spaces on the left and right of string
```{code-cell} ipython3
my_string = '   ABBCCC  '
print(my_string, 'Dummy')
print(my_string.strip())
```
- `strip(chars)` -- Strip chars on the left and right of string
```{code-cell} ipython3
my_string = 'ABBCCCA'
print(my_string.strip('A'))
my_string = '  ABBCCCA'
print(my_string.strip('A'))
```

- `lstrip()` -- Strip spaces from the left of string
```{code-cell} ipython3
my_string = '   ABBCCC  '
print(my_string, 'Dummy')
print(my_string.lstrip(), 'Dummy')
```
- `rstrip()` -- Strip spaces from the right of string
```{code-cell} ipython3
my_string = '   ABBCCC  '
print(my_string, 'Dummy')
print(my_string.rstrip(), 'Dummy')
```

## Case Methods
- `islower()` -- Check if all alphabet characters are lower case
```{code-cell} ipython3
my_string = 'EAS503'
print(my_string.islower())
```
- `isupper()` -- Check if all alphabet characters are upper case
```{code-cell} ipython3
my_string = 'EAS503'
print(my_string.isupper())
```
- `lower()` -- Lower case the string; returns a new string
```{code-cell} ipython3
my_string = 'EAS503'
print(my_string.lower())
```
- `upper()` -- Upper case the string; returns a new string
```{code-cell} ipython3
my_string = 'eas503'
print(my_string.upper())
```
- `title()` -- Make the first letter of each word upper case
```{code-cell} ipython3
my_string = 'the lazy dog jumped over the quick brown fox'
print(my_string.title())
```
- `capitalize()` -- Make the first letter upper case
```{code-cell} ipython3
my_string = 'the lazy dog jumped over the quick brown fox'
print(my_string.capitalize())
```
- `swapcase()` -- Make upper case upper and upper case lower
```{code-cell} ipython3
my_string = 'tHe laZy dOg Jumped oveR thE quIck bRown Fox'
print(my_string.swapcase())
```


## Content Methods
- `isalpha()` -- Returns `True` if all the characters are alphabet 
```{code-cell} ipython3
my_string = 'EAS503'
print(my_string.isalpha())
my_string = 'EAS'
print(my_string.isalpha())
```
- `isdecimal()` -- Returns `True` if all the characters are numbers (0-9); USE THIS!
- `isdigit()` -- Returns `True` if all the characters are numbers (0-9), superscripts (`"\u00B2"`), or fractions `'\u00BC'`; 
- `isnumeric()` -- Returns `True` if all the characters are numbers (0-9), superscripts (`"\u00B2"`), fractions `'\u00BC'`, or Roman Numerals!

- `isalnum()` -- Returns `True` if the string is alpha numeric
```{code-cell} ipython3
my_string = 'EAS503'
print(my_string.isalnum())
```
- `startswith(substring)` -- Returns `True` if the string starts with the specific input argument
```{code-cell} ipython3
my_string = 'EAS503'
print(my_string.startswith('EAS'))
```
- `endswith(substring)` -- Returns `True` if the string ends with the specific input argument
```{code-cell} ipython3
my_string = 'EAS503'
print(my_string.startswith('03'))
```
- `find(substring)` -- Returns the index if the character is found; otherwise returns `-1`
```{code-cell} ipython3
my_string = 'ABBCCC'
print(my_string.find('BB'))
print(my_string.find('B'))
print(my_string.find('AC'))
```
- `index(substring)` -- Returns the index if the character is found; otherwise **raises an error**
```{code-cell} ipython3
my_string = 'ABBCCC'
print(my_string.index('BB'))
print(my_string.index('B'))
```
```{code-cell} ipython3
my_string = 'ABBCCC'
print(my_string.index('AC'))
```
- `in` operator -- Returns `True` if the operand on the left exists in the string
```{code-cell} ipython3
my_string = 'ABBCCC'
print('A' in my_string)
```
- `count(substring)` -- Returns the number of times the substring occurs
```{code-cell} ipython3
my_string = 'ABBCCC'
print(my_string.count('C'))
print(my_string.count('CC'))
print(my_string.count('CCC'))
```

## Modification Methods
- `replace()` -- Replaces character(s) with other character(s); returns a new string
```{code-cell} ipython3
my_string = '(EAS503)'
print(my_string.replace('(', '').replace(')', ''))
```
- `zfill(number_of_zeros)` -- prepend zeros to a string; returns a new string
```{code-cell} ipython3
my_string = 'EAS503'
my_string.zfill(8)
```

```{code-cell} ipython3
my_string = '123'
my_string.zfill(8)
```

## Creating a new String
- `join((value1, value2, value3))` -- Creates a new string separated the values by whatever is in the string

```{code-cell} ipython3
years = ('1900', '1924', '1950', '1990')
''.join((years))
```

```{code-cell} ipython3
years = ('1900', '1924', '1950', '1990')
'-'.join((years))
```

```{code-cell} ipython3
years = ('1900', '1924', '1950', '1990')
print('\n'.join((years)))
```