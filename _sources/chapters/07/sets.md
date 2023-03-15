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

# Sets

- Formal mathematical sets
- **Do not have duplicate values**
- Are not ordered
- Cannot access via index. 
- Useful for doing set operations
- Can have different data types

```{code-cell} ipython3
A = {0, 2, 4, 6, 8}
B = {1, 2, 3, 4, 5}
```

## Check if a value belongs
```{code-cell} ipython3
2 in A
```

## Union -- all values
```{code-cell} ipython3
A | B
```
## Intersection -- shared values
```{code-cell} ipython3
A & B
```


## Difference -- order matters
```python
A - B
B - A
```

## Check Subset 
```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
B = {3, 4}
B < A
```

```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
B = {3, 4}
B <= A
```

```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
B = {3, 4}
B > A
```

## Adding a single element 

```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
A.add(6)
print(A)
```

```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
A.add(1)
print(A)
```

## Removing an element
- Three ways

### Discard 
- Will **NOT** raise an error if the element being remove is not in set. 

```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
A.discard(1)
print(A)
A.discard('P')
```

### Remove 
- Will raise an error if the element being remove is not in set. 

```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
A.remove(1)
print(A)
A.remove('P')
```


### Pop 
- Will remove an element

```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
A.pop()
```

## Checking if multiple dictionary keys exist

```{code-cell} ipython3
d1 = dict(a=1, b=2, c=3, d=4)
d2 = dict(b=20, d=40, e=50)
d1.keys() & d2.keys() # this works because dict.keys() returns "set-like" view rather than a list
{'b', 'd'}
```


```{code-cell} ipython3
d1 = dict(a=1, b=2, c=3, d=4)
d2 = dict(b=20, d=40, e=50)
d1.keys() <= {'a', 'b', 'c', 'd'}
```



## Symmetric difference  
https://en.wikipedia.org/wiki/Symmetric_difference

```{code-cell} ipython3
A = {1, 2, 3, 4, 5}
B = {3, 4}
A ^ B
```