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

The result should have twenty zeros between the first and last significant digit, but that is too many for the computer to store, so the result is just 10000000000—it is as if the addition never took place. Adding lots of small numbers to a large one can therefore have no effect at all, which is not what a bank wants when it totals up the values of its customers’ savings accounts, for example.

If you have to add up floating-point numbers, add them from smallest to largest in order to minimize the error.

Better yet, use a specialized library:
- [mpmath: a Python library for arbitrary-precision floating-point arithmetic](https://mpmath.org/) 