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

# Working with Large Numbers

What is the output of the following?

```{code-cell} ipython3
10000000000 + 0.00000000001
```

The result should have consisted of twenty zeros between the first and last significant digit. However, this magnitude is excessive for the computer to store. Consequently, the result is merely 10000000000—essentially as though the addition never occurred. Adding numerous small numbers to a large one can result in no effect whatsoever. Such an outcome isn't desirable, especially when a bank is tallying the values of its customers' savings accounts.

When dealing with the addition of floating-point numbers, it's advisable to add them in ascending order of magnitude to minimize the error.

Alternatively, utilizing a specialized library is a preferable option:

- [mpmath: a Python library for arbitrary-precision floating-point arithmetic](https://mpmath.org/)
