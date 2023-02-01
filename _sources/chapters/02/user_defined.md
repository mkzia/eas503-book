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

# Defining your own functions
The built-in functions (e.g, type, print, input) that Python provides do basic tasks. We can write our own functions that can execute complicated sequence of instructions. 

https://www.mathsisfun.com/sets/function.html

```python
def f(x):
    squared_x  = x * x
    return squared_x
```

```python
def f(x):
    squared_x = x ** 2
    return squared_x
```

```python
def f(x):
    squared_x = pow(x, 2)
    return squared_x
```

```python
def f(x):
    return x**2
```

```python
def f(x):
    return pow(x, 2)
```


```python
def convert_to_celsius(fahrenheit):
    return (fahrenheit - 32) * 5 / 9

convert_to_celsius(80)
```

- What is a function definition?
  - A function definition is a kind of Python statement. The general form of a function definition is as follows:
  ```
    def <<function_name>>(<<parameters>>):
    <<block>>
  ```
- What is a function header? First line of function definition.
- What is a function body? What comes after the function definition and is indented by four spaces. 
- What is a return statement? ``return <<expression>>``


![def_call](./def_call.png)


## Designing New Functions: A Recipe
- What do you name the function?
- What are the parameters, and what types of information do they refer to?
- What calculations are you doing with that information?
- What information does the function return?

### Practice
1. Write a Python function that prints the following:
```
_____________________________
Happy birthday to you!!!
Happy birthday to you!!!
Happy birthday, dear John
Happy birthday to you!
Happy birthday to you!
______________________________
```
2. Write a Python function that prints the following:
```
______________________________
Happy birthday to you!!!
Happy birthday to you!!!
Happy birthday, dear Jane
Happy birthday to you!
Happy birthday to you!
______________________________
```
3.  Write a Python function that prints the following: 
```
Happy birthday to you!!!
Happy birthday to you!!!
```
4.  Write a Python function that prints the following using the function from the previous exercise. 
```
Happy birthday to you!!!
Happy birthday to you!!!
Happy birthday, dear John
Happy birthday to you!!!
Happy birthday to you!!!
```
5.  Repeat 4a for Jane
```
Happy birthday to you!!!
Happy birthday to you!!!
Happy birthday, dear Jane
Happy birthday to you!!!
Happy birthday to you!!!
```
6.  Write a function called print_happy_birthday_name that takes the name as an parameter to the function. 
```
Happy birthday, dear <Name>
```
7.  Combine the functions print_happy_birthday and print_happy_birthday_name('John')
8.  Write a function that calculates the distance between two points and returns the value.

## Variations in functions
- No input; no output; example -- print something
- One or more input; no output; example -- print the input
- One or more input: one or more output; example -- take two numbers and return their sum
- No input; one or more output; example -- a random number

## Summary
- A function definition introduces a new variable that refers to a function object. The return statement describes the value that will be produced as a result of the function when this function is done being executed.
- A parameter is a variable that appears between the parentheses of a function header.
- A local variable is a variable that is used in a function definition to store an intermediate result in order to make code easier to write and read.
- A function call tells Python to execute a function.
- An argument is an expression that appears between the parentheses of a function call. The value that is produced when Python evaluates the expression is assigned to the corresponding parameter.
- If you made assumptions about the values of parameters or you know that your function won’t work with particular values, write a precondition to warn other programmers. 