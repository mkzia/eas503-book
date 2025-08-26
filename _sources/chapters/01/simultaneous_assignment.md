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

# Simultaneous Assignment

Simultaneous (tuple) assignment lets you assign values to multiple variables in a single statement. It is especially handy for swapping variables without a temporary placeholder.

Traditional swap:

```python
temp = x
x = y
y = temp
```

Concise swap with simultaneous assignment:

```python
x, y = y, x
```

More examples:

- Multiple assignments:
  `a, b, c = 1, 2, 3`
- Unpacking iterables:
  `x, y = [10, 20]`
- Ignoring values with a throwaway name:
  `first, _ = (5, 6)`
- Extended unpacking:
  `head, *middle, tail = [1, 2, 3, 4, 5] # head=1, middle=[2,3,4], tail=5`

Notes:

- The right-hand side is fully evaluated before any assignments occur.
- The number of targets must match the number of values (unless using starred unpacking).
