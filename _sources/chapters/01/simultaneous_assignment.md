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
Simultaneous assignment is useful when you want to swap values. So instead of doing this:


```Python
  temp = x
  x = y
  y = temp
```

you can do this:

```python
x, y = y, x
```