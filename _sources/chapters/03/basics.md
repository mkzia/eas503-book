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

# Strings Basics

- In Python, text is represented as a string, which is a **sequence** of characters (letters, digits, and symbols).
- In Python, we indicate that a value is a string by putting either single or double quotes around it.

## Operations on Strings
- `len(string)` -- to get length of a string
- `+` -- can add strings, but not str and type float or int
- `*` -- to repeat a string 
- `+=` -- add to another string and save value
- `int("3")` -- convert str to int
- `float("3.4")` -- convert str to float


## Single Quotes vs Double Quotes
```python
'Aristotle'
"Issac Newton"
```

## Triple Quotes for String Literal
```python
'''Should you want a string
​ 	that crosses multiple lines,
​ 	Use matched triple quotes.'''
```

```python
"""
This is a string literal. 
        Spaces are printed as is. 
  Hello there!"""
```

## Printing in Python
```python
print('abbcd', 2, 3)
print('abbcd', 2, 3, sep='\n') # default separator is space
```

## Determining the length of a string
```python
scientist = 'Issac Newton'
print(len(scientist))
```


## Concatenating Strings
```python
'Alan Turning' + ' ' + 'Grace Hopper'
```

```python
'NH' + 3 # This will not work. You cannot add a str and int type. 
```

```python
'Four score and ' + str(7) + ' years ago'
```

## Converting Strings to Numbers
```python
int('0')
int('11')
int('-324')
float('-324.40')
```

## Repeating Strings
```python
'AT' * 5
'-' * 5
```

## Using Special Characters in Strings
- How would you put a single quote inside a string that is declared using a single quote?
- `'\\'` -- how would you print `/\/\`
- `'\n'`
- `'\''`
- `'\"'`
- `'\t'` -- useful for parsing TSV files



## Getting information from the Keyboard
```python
number = input('Please enter a number: ')
```

- Input returns a `str` data type. 

```{warning}
Input arguments to a function are not the same as the `input` function!
```

## Converting Numeric Values
```python
number = int(input('Please enter a number: '))
```

```python
def convert_celsius(fahrenheit):
    return (fahrenheit - 32.0) * 5.0 / 9.0    
```

```python
def convert_celsius():
    fahrenheit = float(input('Please enter temperature in Fahrenheit: '))
    celsius =  (fahrenheit - 32.0) * 5.0 / 9.0  
    print('The temperature in celsius is: ', celsius) 
```