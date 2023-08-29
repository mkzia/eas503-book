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

# Return Statement

All functions inherently return a value. If a `return` statement is absent in a function, the `None` data type is automatically returned by default.

```{code-cell} ipython3
def f(x):
    x = x * 2

res = f(3)
res
```

```{code-cell} ipython3
print(res)
id(res)
```

```{code-cell} ipython3
def f(x):
    x = x * 2
    return None

print(f(3))
```
