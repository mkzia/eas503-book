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

# Introduction to Functions

A function is a self-contained sequence of statements or instructions that possesses a name. For example, consider a function designed to convert Celsius to Fahrenheit. Since the formula for this conversion remains consistent, with the only variable being the temperature in Celsius, you can create a function that accepts the temperature as an argument, performs the conversion, and subsequently returns the temperature in Fahrenheit.

What are the advantages of using functions?

- Many programs require a specific sequence of statements or instructions to be executed repeatedly. By consolidating these repetitive statements into a single function, which can be accessed whenever necessary, functions help reduce code duplication.
- Functions aid in breaking down larger programs into logical subprograms, enhancing ease of writing and debugging.
- Functions can be invoked at any point using their names.
- Functions can call other functions.
- Functions can OPTIONALLY accept argument(s) that they can utilize within the function.
- Functions can OPTIONALLY return value(s).

The general form of a function call is as follows:

```text
def <<function_name>>(<<parameters>>):
    body
```

```{note}
Note the distinction between parameters and arguments: Function parameters are the names listed in the function's definition. Function arguments are the actual values provided to the function. Parameters are initialized with the values of the supplied arguments. [Reference](https://developer.mozilla.org/en-US/docs/Glossary/Parameter)
```

In numerous programming languages, braces ({}) are employed to enclose a function's contents. In contrast, in Python, a function body is differentiated from the surrounding code by indenting all of the function content by four spaces

```{code-cell} ipython3
def convert_celsius_to_fahrenheit(degrees_in_celsius):
    return 9 / 5 * degrees_celsius + 32
```

## IndentationError

An **IndentationError** is a type of **SyntaxError** that occurs when the indentation is incorrect.

```python
def convert_celsius_to_fahrenheit(degrees_in_celsius):
    f = 9 / 5 * degrees_in_celsius + 32
  return 
```

![indent_error](./indent_error.png)
