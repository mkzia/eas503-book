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

# Numeric and None Data Types

Python support many different data types. We will introduce them as we use them. It is important to know the data types because every value in Python has a particular data type and the data types of values determine how they behave when they are combined. 

To determine the data type of a value, you can use the `type()` function. 

## Numeric Data Types
Values such as `4` and `-7` have data type `int` (short for `integer`). Values such as `2.5` and `-17.0` have data type float (short for `floating point`). The value `7j` is an example of a `complex` data type. 

- `int` store whole number, positive or negative, unlimited
- `float` store number with decimals, positive or negative

With respect to numeric data types, you should know some rules:
- An expression involving two `int` operands produces an `int`:
- 
```{code-cell} ipython3
1 + 2
```

```{code-cell} ipython3
type(1 + 2)
```

- An expression involving two `float` operands produces a `float`:
```{code-cell} ipython3
1.0 + 2.0
```

```{code-cell} ipython3
type(1.0 + 2.0)
```

- When an expression's operands are an `int` and a `float`, meaning mixed data type, Python automatically converts the `int` to a `float`. That is why the following two expressions return the same data type. 

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

## None Data Type
- The numeric data types are: `int`, `float`, and `complex`.
