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

- [Video Recording (5 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=add3c7e4-de13-4755-b598-afa800ca2ff9)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/04/boolean.ipynb)



# Conditionals/Making Choices Using Flow Controls

- So far we have only written small programs that are a sequence of instructions. Sometimes you have to alter the sequential flow of a program to suit the needs of a particular situation.

## Boolean Type
- Python has a built-in Boolean type called `bool`. Unlike `int` and `float`, which can have almost unlimited possible values, `bool` has only two: `True` and `False`. 

## Boolean Operators
- There are three basic Boolean operators: `and`, `or`, and `not`. `not` has the highest precedence, followed by `and`, followed by `or`. 

| Operator | What it does?                                        | Example                                                                   |
|----------|------------------------------------------------------|---------------------------------------------------------------------------|
| `and`    | True if both a AND b are true (logical conjunction)  | if is_teacher and is_active:   print('You can access')                    |
| `or`     | True if either a OR b are true (logical disjunction) | if is_superuser or (is_teacher and is active):    print('You can access') |
| `not`    | True if the opposite of a is true (logical negation) | if not is_superuser:   print('You cannot access')    


```{code-cell} ipython3
not True
```

```{code-cell} ipython3
not False
```

```{code-cell} ipython3
True and True
```

```{code-cell} ipython3
False and False
```


```{code-cell} ipython3
True and False
```


```{code-cell} ipython3
False and True
```

```{code-cell} ipython3
True or True
```

```{code-cell} ipython3
False or False
```


```{code-cell} ipython3
True or False
```

```{code-cell} ipython3
False or True
```

```python
cold = True
windy = False

(not cold) and windy # It is not cold and windy
not (cold and windy) # 
```

## Truthiness and Falsiness 
- Things that are false on their own
  - `None` (basic data type)
  - `False` (basic data type)
  - Any empty sequence: `''`, `[]`, `()`
  - Any zero value: 0, 0.0
  - Anything whose `len()` returns 0
  - Empty objects
  - Everything else is True 
    