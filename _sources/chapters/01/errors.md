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

# Errors in Python

When an error occurs in your code, Python provides a meaningful explanation that can help you rectify your code. This section introduces you to three common errors that you are likely to encounter at this stage. Additional error types will be introduced as needed.

## NameError

A **NameError** occurs when you refer to a variable that has not been declared.

```{code-cell} ipython3
3 + moogah
```

## SyntaxError

A **SyntaxError** occurs when you arrange the operators and operands in an illegal arrangement.

```{code-cell} ipython3
2 + 
```

```{code-cell} ipython3
12 = x
```

## ZeroDivisionError

A **ZeroDivisionError** occurs when you try to divide by zero.

```{code-cell} ipython3
3 / 0
```
