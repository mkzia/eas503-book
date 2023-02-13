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

- [Video Recording (16 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=99864159-cd4e-4f0f-b2d3-afa800ca3bb4)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/04/strings.ipynb)




# String Comparisons

- When strings are compared, they are compared lexicographic, meaning strings are put into alphabetical order and uppercase comes before lowercase and numbers come before the alphabets. 
- ASCII Table: https://www.rapidtables.com/code/text/ascii-table.html

```{warning}
**Memorize the following:**
  - 0-9 -- 48-57
  - A-Z -- 65-90
  - a-z -- 97-122
```

```{code-cell} ipython3
'A' < 'a'
```

```{code-cell} ipython3
'A' > 'Z'
```

```{code-cell} ipython3
'abc' < 'abd'
```

```{code-cell} ipython3
'abc' < 'abcd' # shorter is less
```

```{code-cell} ipython3
'1' < '2'
```

```{code-cell} ipython3
'1' < '20'
```

```{warning}
Numbers in strings are not naturally sorted!
`'2' < '11'` is `False`
```
- Convert a single character to its unicode number: `ord()`
```{code-cell} ipython3
print(ord('0'))
print(ord('9'))
print(ord('A'))
print(ord('Z'))
print(ord('a'))
print(ord('b'))
```

- Convert a unicode number to its unicode character: `chr()`
```{code-cell} ipython3
print(chr(48))
print(chr(57))
print(chr(65))
print(chr(90))
print(chr(97))
print(chr(122))
```

## `in` Operator
- Python provides a way to check if one string appears inside another one using the `in` operator. 

```{code-cell} ipython3
'Jan' in '01 Jan 1838'
```

```{code-cell} ipython3
'Feb' in '01 Jan 1838'
```

```{code-cell} ipython3
'a' in 'abc'
```

```{code-cell} ipython3
'A' in 'abc'
```

## Sorting by Hand
- Sort the following strings by hand: `['AABC', 'ABC', 'ABCD', '1', '2', '11', 'a', 'abc', 'b', 'abcd']`
```{code-cell} ipython3
:tags: ["hide-input"]
result = ['1', '11', '2', 'AABC', 'ABC', 'ABCD', 'a', 'abc', 'abcd', 'b']
```

- Sort the following strings by hand: `['Male21', 'Female25', 'Male30', 'Male2', 'Female24', 'Male11']`
```{code-cell} ipython3
:tags: ["hide-input"]
result = ['Female24', 'Female25', 'Male11', 'Male2', 'Male21', 'Male30']
```