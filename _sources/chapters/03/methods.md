# String methods
- We have already encountered functions: built-in functions and functions we have defined. A method is another kind of function that is attached to a particular type. This section covers
the methods that are attached to string types.  
- Method calls in this form—`'browning'.capitalize()`—are shorthand for this: `str.capitalize('browning')`. 
- Methods are like functions, except that the first argument must be an object of the class in which the method is defined.

## Strip Methods
- `strip()` -- Strip spaces on the left and right of string
- `lstrip()` -- Strip spaces from the left of string
- `rstrip()` -- Strip spaces from the right of string

## Case Methods
- `islower()` -- Check if all alphabet characters are lower case
- `isupper()` -- Check if all alphabet characters are upper case
- `lower()` -- Lower case the string; returns a new string
- `upper()` -- Upper case the string; returns a new string
- `title()` -- Make the first letter of each word upper case
- `capitalize()` -- Make the first letter upper case
- `swapcase()` -- Make upper case upper and upper case lower

## Content Methods
- `isalpha()` -- Returns `True` if all the characters are alphabet 
- `isdecimal()` -- Returns `True` if all the characters are decimals (0-9)
- `isdigit()` -- Returns `True` if all the characters are decimals (0-9)
- `isnumeric()` -- Returns `True` if all the characters are digits; Note it supports exponents `'2\u00B3'` and fractions `'\u00BC'`. 
- `isalnum()` -- Returns `True` if the string is alpha numeric
- `startswith()` -- Returns `True` if the string starts with the specific input argument
- `endswith()` -- Returns `True` if the string ends with the specific input argument
- `find()` -- Returns the index if the character is found; otherwise returns `-1`
- `index()` -- Returns the index if the character is found; otherwise raises an error. 

## Modification Methods
- `replace()` -- Replaces character(s) with other character(s); returns a new string
- `split()` -- Splits a string; Default is space; **Can specify how many times to split**

