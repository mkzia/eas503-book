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
Variables give names to values (number, string, None). They are an identifier that labels a value for future reference. The value of a variable can be changed through assignment. 

Variables must be assigned values before they can be used in expressions. 

Variables names **MUST** follow certain rules and it is **BEST** to follow Python guidelines for naming.

## Restrictions for variable names:
1. Start with a letter or underscore.
2. The rest can have letters, underscore, and numbers.
3. Symbols cannot be used in name `(@,+)`.
4. Do not use Python keywords or reserved words such as `print`, `str`, `int`, `float`.
 - `int = 3` do `del int` to restore python keyword
 - `print = 'Yah'` do `del print` to restore Python keyword

## Conventions for variable names:
1. Use snake_case not camelCase for variable and function names.
2. Variables should be lowercase.
3. Upper case are used for constants `PI = 3.14`.
4. UpperCamelCase for classes.
5. `__private__`  double underscore is convention that means you are not supposed access this variable directly. They are by convention like private variables in other languages. 

Variable names are case sensitive, so `ph` and `pH` are two different names. 

## Variable Assignment
Variables are created by executing assignment statements. 

```python
degrees_celsius = 26.0
```

This is called an assignment statement; we say that `degrees_celsius` is assigned the value `26.0`. Whenever Python sees a variable in an expression, it substitutes the value to which the variables refers:

```{code-cell} ipython3
degrees_celsius = 26.0
9 / 5 * degrees_celsius + 32
```

Variables are called variables because their value can vary as the program executes.

```{code-cell} ipython3
degrees_celsius = 15.5
9 / 5 * degrees_celsius + 32
```

## Python Keywords

```text
False      await      else       import     pass
None       break      except     in         raise
True       class      finally    is         return
and        continue   for        lambda     try
as         def        from       nonlocal   while
assert     del        global     not        with
async      elif       if         or         yield
```

Variable names are case sensitive, so `ph` and `pH` are two different names.