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

# Variables

- Variables provide names for values (numbers, strings, None). They act as identifiers that label a value for future reference. The value of a variable can be modified through assignment.

- Variables must be assigned before they can be utilized in expressions.

- Variables do not have to specify the data type of data at the time of assignment. The data type is inferred from the value. For this reason, Python is known as a **Dynamically Typed Language**. Languages that require variable data types to be declared at the time of assignment are called **Statically Typed Languages**. A consequence of Python being a dynamically typed language is that you can reassign a variable to a different data type. This is allowed in Python but is not allowed in some programming languages.

```python
x = 3 # data type int
x = 3.14 # data type float; this is allowed!
```

- Variable names are case-sensitive, meaning `ph` and `pH` are considered two distinct names.

- Variable names **MUST** adhere to specific rules, and it is **BEST** to adhere to Python's guidelines for naming.

## Restrictions for Variable Names

You must adhere to these

1. Must start with a letter or underscore.
2. Can consist of letters, underscores, and numbers. **NO SPACES**
3. Symbols like `(,),@,+,-,*,/` cannot be used in names.
4. Cannot use Python keywords

## Python Keywords

- Python keywords are reserved, meaning they cannot be used as variable names.

```text
False      await      else       import     pass
None       break      except     in         raise
True       class      finally    is         return
and        continue   for        lambda     try
as         def        from       nonlocal   while
assert     del        global     not        with
async      elif       if         or         yield
```

## Conventions for Variable Names

1. Use snake_case, not camelCase, for variable and function names.
2. Variables should be in lowercase.
3. Uppercase is reserved for constants, such as `PI = 3.14`.
4. UpperCamelCase is used for classes.
5. `__private__` with a double underscore is a convention that signifies the variable shouldn't be accessed directly. This convention is analogous to private variables in other programming languages.
6. Avoid using Python functions as variable names, examples, `int`, `type`, `float`

- `int = 3` do `del int` to restore python keyword
- `print = 'Yah'` do `del print` to restore Python keyword

## Variable Assignment

Variables are created by executing assignment statements.

```python
degrees_celsius = 26.0
```

This is referred to as an assignment statement; in this case, we assign the value `26.0` to the variable `degrees_celsius`. Whenever Python encounters a variable within an expression, it substitutes the value that the variable represents.

```{code-cell} ipython3
degrees_celsius = 26.0
9 / 5 * degrees_celsius + 32
```

Variables are called variables because their value can vary as the program executes.

```{code-cell} ipython3
degrees_celsius = 15.5
9 / 5 * degrees_celsius + 32
```

