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

# Built-in functions

`abs(-9)`: `-9` is the argument. Arguments appear between the parenthesis after the function name. Arguments are evaluated left to right.

```{code-cell} ipython3
day_temperature = 3
night_temperature = 10
abs(day_temperature - night_temperature)
```


Because function calls produce values, they can be used in expressions:

```{code-cell} ipython3
abs(-7) + abs(3.3)
```

![subexpression](./subexpression.png)

Functions to convert one type of variable to another

```{code-cell} ipython3
int(34.6)
```

```{code-cell} ipython3
int(-4.3)
```

```{code-cell} ipython3
float(21)
```

```{code-cell} ipython3
str(21)
```

The Round function can round floats
```{code-cell} ipython3
str(21)
```

```{code-cell} ipython3
round(3.8)
```

```{code-cell} ipython3
round(3.3)
```

```{code-cell} ipython3
round(3.5)
```

```{code-cell} ipython3
round(-3.3)
```

```{code-cell} ipython3
round(-3.5)
```

The round function can take an OPTIONAL second argument

```{code-cell} ipython3
round(3.141592653,2)
```

The `help(fxn)` function gives information about a function

```{code-cell} ipython3
help(round)

```

```{code-cell} ipython3
help(pow)
```


Using the `pow` function

```{code-cell} ipython3
pow(2, 4)
```

```{code-cell} ipython3
pow(2, 4, 3)
```


We can also use function calls as arguments to other functions:
```{code-cell} ipython3
pow(abs(-2), round(4.3))
```

Some other useful functions


```{code-cell} ipython3
min(2, 3, 4)
```


```{code-cell} ipython3
max(2, -3, 4, 7, -5)
```

```{code-cell} ipython3
max(2, -3, min(4, 7), -5)
```

Function objects have memory addresses just like variables:

```{code-cell} ipython3
id(-9)
```

```{code-cell} ipython3
id(23.1)
```

```{code-cell} ipython3
show_size = 8.5
id(show_size)
```

```{code-cell} ipython3
id(abs)
```

```{code-cell} ipython3
id(round)
```