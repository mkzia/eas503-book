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


# Tuples
- Tuples just like lists except that they are immutable. Once you have created a tuple, you cannot modify it. 
- Why use them?
  - Faster than lists
  - Make code safer -- because you cannot change it
  - Valid keys in a dictionary


## Actually you can modify a tuple

```{code-cell} ipython3
my_tuple = (1, 2, 3, [4, 5, 6])
my_tuple[3].append(7)
print(my_tuple)
```

