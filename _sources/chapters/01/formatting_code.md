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

# Formatting Code

When a statement is too long, you can split it across multiple lines in two ways:

1. Preferred: Use implicit line continuation inside parentheses `()`, brackets `[]`, or braces `{}`. No backslash needed.
2. Discouraged: Use the explicit line-continuation character `\`.

## Example 1: Using parentheses (preferred)

```python
(2 +
 3)
```

## Example 2: Using the line-continuation character (discouraged)

```python
2 + \
3
```

## Additional examples

### Single line (hard to read)

```python
result = 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
```

### With implicit line continuation using parentheses (readable)

```python
result = (
    2 + 3 + 4 +
    5 + 6 + 7 +
    8 + 9 + 10
)
```

Tips:

- Align wrapped lines for clarity.
- Prefer breaking after an operator.
- For lists, dicts, and function calls with many arguments, wrap and indent similarly:

```python
numbers = [
    2, 3, 4, 5, 6, 7, 8, 9, 10,
]

config = {
    "host": "localhost",
    "port": 5432,
    "use_ssl": True,
}

total = sum(
    x
    for x in range(1, 11)
)
```
