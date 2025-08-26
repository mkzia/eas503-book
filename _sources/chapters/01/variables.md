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

- Variables are names bound to values (e.g., numbers, strings, or `None`). They act as identifiers that label a value for later use. A variable’s value can be changed via assignment.
- Variables must be assigned a value before they are used in expressions.
- Python does not require declaring a variable’s type at assignment time—the type is inferred from the value. Python is therefore a dynamically typed language. In contrast, languages that require declaring types at assignment are statically typed.

  - Because Python is dynamically typed, you can reassign a variable to a value of a different type. This is allowed in Python but disallowed in some languages.

  x = 3 # type: int
  x = 3.14 # type: float; this is allowed

- Variable names are case-sensitive, so `ph` and `pH` are distinct.
- Variable names must follow certain rules, and it’s best to follow Python’s style guidelines when naming.


## Restrictions for Variable Names

You must follow these rules:

1. A variable name must start with a letter (a–z, A–Z) or an underscore (`_`).
2. A variable name may contain letters, digits, and underscores. Spaces are not allowed.
3. Symbols such as `( ) , @ + - * /` cannot be used in variable names.
4. Variable names cannot be Python keywords.


## Python Keywords

Python keywords are reserved words and cannot be used as variable names.

```text
False      await      else       import     pass
None       break      except     in         raise
True       class      finally    is         return
and        continue   for        lambda     try
as         def        from       nonlocal   while
assert     del        global     not        with
async      elif       if         or         yield
```


## Python Naming Conventions

### Variable and function names

- Use snake_case (e.g., `my_variable`, `calculate_total`).
- Keep names lowercase.
- Choose descriptive, meaningful names.
- Avoid single-letter names except for short-lived counters or iterators.

### Constants

- Use UPPER_CASE with underscores (e.g., `MAX_VALUE`, `PI`).
- Define at module level.

```python
PI = 3.14159
MAX_ATTEMPTS = 3
```

### Class names

- Use PascalCase (also called UpperCamelCase) (e.g., `BankAccount`, `UserProfile`).
- Use nouns that describe the object.

### Privacy conventions

1. Protected members (`_name`)

   - Single leading underscore.
   - Signals “non-public” by convention; not enforced by Python.

   ```python
   class Account:
       def __init__(self):
           self._balance = 0
   ```

2. Private members (`__name`)

   - Double leading underscore triggers name mangling: `__name` becomes `_ClassName__name`.
   - Makes external access harder (but not impossible).

   ```python
   class Account:
       def __init__(self):
           self.__balance = 0  # becomes _Account__balance
   ```

3. Special methods (`__name__`)

   - Double underscore prefix and suffix.
   - Reserved for Python’s special (“dunder”) methods.
   - Examples: `__init__`, `__str__`, `__len__`.

   ```python
   class Account:
       def __init__(self):
           pass
       def __str__(self):
           return "Account instance"
   ```

### Avoiding built-in names

- Don’t shadow Python keywords or built-in function/type names.
- Common built-ins to avoid: `list`, `dict`, `str`, `int`, `sum`, `max`.
- If you accidentally shadow a built-in, you can restore it by deleting your binding.

```python
# Bad
list = [1, 2, 3]  # shadows built-in list

# Good
my_list = [1, 2, 3]

# Restore shadowed built-in
del list
```


## Variable Assignment

Variables are created by executing assignment statements.

```python
degrees_celsius = 26.0
```

This is an assignment statement: the value `26.0` is bound to the name `degrees_celsius`. When Python encounters a variable in an expression, it substitutes the value bound to that name.

```python
degrees_celsius = 26.0
9 / 5 * degrees_celsius + 32
```

Variables are called “variables” because their values can change during execution.

```python
degrees_celsius = 15.5
9 / 5 * degrees_celsius + 32
```
