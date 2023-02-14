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



# Tuples
- Tuples just like lists except that they are immutable. Once you have created a tuple, you cannot modify it. 
- Why use them?
  - Faster than lists
  - Make code safer -- because you cannot change it
  - Valid keys in a dictionary


## Actually you can modify a tuple

```{code-cell} ipython3
my_tuple = (1, 2, 3, [4, 5, 6])
my_tuple[3].append(7)
print(my_tuple)
```

