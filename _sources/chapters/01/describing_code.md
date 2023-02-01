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

# Describing Code

Sometimes it is helpful to write comments describing your code. Any time Python encounters the `#` character it ignores the rest of the line. 

```python
x * (x + 1) # secret formula
```

You can have multiline comments by surrounding your comments using triple quotes, either single quotes (`'`) or double quotes (`"`)
```python
"""
This is a multiline comment. 
Test 1234
"""
x * (x + 1)
```

```python
'''
This is a multiline comment. 
Test 1234
'''
x * (x + 1)
```