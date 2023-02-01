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

# Numeric Data Types

Python support many different data types. We will introduce them as we use them. It is important to know the data types because every value in Python has a data type and the data types of values determine how they behave when they are combined. 

To determine the data type of a value, you can use the `type()` function. 

```{code-cell} ipython3
type(2)
```

```{code-cell} ipython3
type(3.14)
```

## Numeric Data Types
Values such as `4` and `-7` have data type `int` (short for `integer`). Values such as `2.5` and `-17.0` have data type float (short for `floating point`). The value `7j` is an example of a `complex` data type. 

- `int` store whole number, positive or negative, unlimited
- `float` store number with decimals, positive or negative

With respect to numeric data types, you should know some rules:
1. An expression involving two `int` operands produces an `int`:

```{code-cell} ipython3
1 + 2
```

```{code-cell} ipython3
type(1 + 2)
```

2. An expression involving two `float` operands produces a `float`:
```{code-cell} ipython3
1.0 + 2.0
```

```{code-cell} ipython3
type(1.0 + 2.0)
```

3. When an expression's operands are an `int` and a `float`, meaning mixed data type, Python automatically converts the `int` to a `float`. That is why the following two expressions return the same data type. 

```{code-cell} ipython3
17.0 - 10
```

```{code-cell} ipython3
type(17.0 - 10)
```

```{code-cell} ipython3
17 - 10.0
```

```{code-cell} ipython3
type(17 - 10.0)
```

You can leave out `0` after the decimal, e.g., `10.`, but this is considered bad style. 
```{code-cell} ipython3
10.
```

### Difference between `int` and `float`
- They are stored differently 
  - `float` take up a fixed amount of space. `int` take up variable amount of space. 
  - `int` are stored as `bignum` data type behind the scenes. 

```python
import sys
sys.getsizeof(2.0)
Out[3]: 24
sys.getsizeof(2**30)
Out[4]: 32
sys.getsizeof(2**130)
Out[6]: 44
```
- Both `int` and `float` can store positive and negative numbers
- `type()` -- used to figure out which type of data type it is
- `float` can only represent approximations to real numbers because computers have finite amount of memory.
  - `2/3` vs `1/3`

```{code-cell} ipython3
2 / 3
```

```{code-cell} ipython3
5 / 3
```

- If you do not need fraction values, use `int`.
