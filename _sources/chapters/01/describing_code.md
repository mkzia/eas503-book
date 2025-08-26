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

# Describing Code

Comments help explain what your code does and why. In Python, anything following a `#` on a line is a comment and is ignored by the interpreter. The `#` can appear anywhere on a line, but it does not create a comment inside a string literal.

Example:

```python
x * (x + 1)  # This is a secret formula
```

## Multiline comments

Python has no dedicated multiline comment syntax. Triple-quoted strings (`'''...'''` or `"""..."""`) can span multiple lines, but they are strings, not comments. When placed as the first statement in a module, class, or function, they become docstrings; elsewhere, they are still real string objects and may consume memory.

Examples (not true comments):

```python
"""
This spans multiple lines.
If placed at the top of a module/function/class,
it is a docstring, not a comment.
"""
x * (x + 1)
```

```python
'''
This also spans multiple lines,
but it’s still a string literal, not a comment.
'''
x * (x + 1)
```

## Best practice

- Use `#` for comments—even when they span multiple lines—by prefixing each line with `#`. This is unambiguous and cannot be mistaken for a docstring or a string literal.

Example:

```python
# This is a multiline comment.
# It spans multiple lines.
x * (x + 1)
```

- Reserve triple-quoted strings for actual docstrings that document modules, classes, and functions:

```python
def area(radius: float) -> float:
    """Compute the area of a circle with the given radius."""
    from math import pi
    return pi * radius * radius
```
