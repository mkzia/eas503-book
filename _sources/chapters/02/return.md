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

All functions return a value. If you do not have a `return` statement in a function, nothing is produced, but by default the `None` data type is returned. 

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