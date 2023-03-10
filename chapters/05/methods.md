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

- [Video Recording (2 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=698387e6-f38b-401c-b3fc-afa90059a21b)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/05/lists.ipynb)



# List methods (functions)
Lists supports the following methods:
- `append(value)` - add an element to the end of a list
- `insert(index, value)` - insert an element to the list at the specified location
- `remove(value)` - remove the first matching value from a list 
- `pop()` - remove the last element in the list; also returns the value; you can save this to another variable
- `pop(index)` - remove the element at specified index in the list; also returns the value; you can save this to another variable
- `clear()` - empty the list
- `index(element)` - return position of first matching element
- `count(element)` - return the number of elements in the list that match `element`;
- `sort()` - sort the list in place 
- `reverse()` - reverse the list in place

```{code-cell} ipython3
grades = ['A', 'B', 'C']
grades.append('D')
print(grades)
```

```{code-cell} ipython3
grades = ['A', 'B', 'C']
grades.insert(3, 'F')
print(grades)
```

- if the insert index is greater than the length of the list, the value will be added to the end of the list. 
```{code-cell} ipython3
grades = ['A', 'B', 'C']
grades.insert(10, 'F')
print(grades)
```

```{code-cell} ipython3
grades = ['A', 'B', 'C']
grades.insert(0, 'F') # insert at beginning
print(grades)
```

```{code-cell} ipython3
grades = ['A', 'B', 'A', 'C']
grades.remove('A')
print(grades)
```

```{code-cell} ipython3
grades = ['A', 'B', 'C', 'D', 'F']
grades.pop() # deletes the last element in list and returns it 
print(grades)
grades.pop(0) # deletes the first element in list and returns it
print(grades)
grades.pop(2) # deletes the third element in list and returns it
print(grades)
```

```{code-cell} ipython3
grades = ['A', 'B', 'C']
grades.clear()
print(grades)
```

```{code-cell} ipython3
grades = ['A', 'C', 'B', 'C']
print(grades.index('C'))
```

```{code-cell} ipython3
grades = ['A', 'C', 'B', 'C']
print(grades.count('C'))
```

```{code-cell} ipython3
grades = ['A', 'C', 'B', 'C']
grades.sort()
print(grades)
```

```{code-cell} ipython3
grades = ['A', 'B', 'C']
grades.reverse()
print(grades)
```






