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

- [Video Recording (8 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=f994b76e-1368-4c8b-b242-afa90059a25b)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/05/lists.ipynb)



# Strings as Lists
Remember, strings are a sequence, so you can index them. 

```{code-cell} ipython3
my_string = 'Doe, John'
print(my_string[0])
print(my_string[-1])
print(my_string[2])
```

## Splitting a Name

When you split a string using split, a list is returned. 
```{code-cell} ipython3
my_string = 'Doe, John'
print(my_string.split())
print(my_string.split(','))
print(my_string.split(', '))
```


## Splitting a Date
### Example 1

```{code-cell} ipython3
date = '2023/05/23'
print(date.split('/'))

year, month, day = date.split('/')
print(year, month, day)
print(int(year), int(month), int(day))
```
### Example 2

```{code-cell} ipython3
date = '05-23-2023'
print(date.split('-'))

month, day, year = date.split('-')
print(month, day, year)
print(int(month), int(day), int(year))
```

### Example 3

```{code-cell} ipython3
date = '05-23-2023'

month, day, year = date[:2], date[3:5], date[6:]
print(month, day, year)
print(int(month), int(day), int(year))
```

## Limiting splits

```{code-cell} ipython3
my_string = 'range=start=3;end=20;step=2'
print(my_string.split('=', 1))
```

### Extract the key-value pairs
```{code-cell} ipython3
my_string = 'range=start=3;end=20;step=2'
range_options = my_string.split('=', 1)[1]
start, end, step = range_options.split(';')
start = start.split('=')[1] # or [-1]
end = end.split('=')[1] # or [-1]
step = step.split('=')[1] # or [-1]
print(start, end, step)
```

## Splitting lines
```{code-cell} ipython3
long_string='First line\nSecond line\nThird line'
print(long_string.split())
print(long_string.split('\n'))
print(long_string.splitlines())
```

## Checking Character Type Manually  

```{code-cell} ipython3
my_string = 'EaS503!'

def char_type(char):
    if 'A' <= char <= 'Z':
        return 'Upper Case'
    elif 'a' <= char <= 'z':
        return 'Lower Case'
    elif '0' <= char <= '9':
        return 'Digit'
    else:
        return 'Not Alpha Numeric'


print(my_string[0], char_type(my_string[0]))
print(my_string[1], char_type(my_string[1]))
print(my_string[2], char_type(my_string[2]))
print(my_string[3], char_type(my_string[3]))
print(my_string[4], char_type(my_string[4]))
print(my_string[5], char_type(my_string[5]))
print(my_string[6], char_type(my_string[6]))
```


