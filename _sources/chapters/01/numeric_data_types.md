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

Python supports various data types, which we will introduce as we encounter them. Understanding data types is crucial because each value in Python is associated with a specific data type, and the behavior of values when they are combined is determined by their data types.

To determine the data type of a value, you can use the `type()` function.

```{code-cell} ipython3
type(2)
```

```{code-cell} ipython3
type(3.14)
```

## Int and Float

Values such as `4` and `-7` have the data type `int` (short for `integer`). Values like `2.5` and `-17.0` belong to the data type `float` (short for `floating point`). The value `7j` is an instance of the `complex` data type.

- `int` stores whole numbers, whether positive or negative, with unlimited range.
- `float` stores numbers with decimals, both positive and negative.

With respect to numeric data types, you should know some rules:

1. An expression involving two `int` operands results in an `int`:

```{code-cell} ipython3
1 + 2
```

```{code-cell} ipython3
type(1 + 2)
```

2. An expression involving two `float` operands results in a `float`:

```{code-cell} ipython3
1.0 + 2.0
```

```{code-cell} ipython3
type(1.0 + 2.0)
```

3. When an expression involves an `int` and a `float` as operands, resulting in a mixed data type, Python automatically converts the `int` to a `float`. This is why the following two expressions yield the same data type.

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

4. You can omit `0` after the decimal point, for instance, `10.`, but this practice is generally considered poor style.

```{code-cell} ipython3
10.
```

### Differences between `int` and `float`

- `float` occupies a fixed amount of space, while `int` takes up a variable amount of space.
- `int` values are stored as `bignum` data type behind the scenes.

```python
import sys
sys.getsizeof(2.0)
Out[3]: 24
sys.getsizeof(2**30)
Out[4]: 32
sys.getsizeof(2**130)
Out[6]: 44
```

- Both `int` and `float` can store both positive and negative numbers.
- The `type()` function is used to determine the data type.
- `float` can only represent approximations of real numbers due to the finite amount of memory available in computers.
  - `2/3` vs `1/3`

```{code-cell} ipython3
2 / 3
```

```{code-cell} ipython3
5 / 3
```

- If you do not need fraction values, use `int`.
