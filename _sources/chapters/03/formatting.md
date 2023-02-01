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

# String Formatting

The fastest and latest way to do string formatting is using the F-strings (https://realpython.com/python-f-strings/)

```{code-cell} ipython3
  PI = 3.14159265359 
  print(f'{PI:.2f}')
```
But you have to know the other ways so you can read older code or use these ways if you have to use an older version of Python

## Oldest Method
```{code-cell} ipython3
  PI = 3.14159265359 
  name = 'PI'
  print('%s is %.2f' % (name, PI))  # oldest way format specifier is <width>.<precision><type>
```

## Newer Method
Still used for creating string templates
```{code-cell} ipython3
PI = 3.14159265359 
name = 'PI'
#{<index>:<format-specifier>} where the format specifier is <width>.<precision><type>
print(('{0} is {1:.2f}'.format('PI', PI)) ) # 
```

## Newest Method
Newest and fastest method for string formatting
```{code-cell} ipython3
PI = 3.14159265359 
name = 'PI'
# {<name_of_variable>:<format-specifier>} where the format specifier is <width>.<precision><type>
print(f'{name} is {PI:.2f}') # newest way
```

Reference: https://pyformat.info/

```{code-cell} ipython3
a_str = 'EAS503'
an_int = 113
a_float = 92.3
print(a_str, an_int, a_float)
```

```{code-cell} ipython3
line1 = 'This is the first line.\n'
line2 = 'This is the second line.'
lines = line1 + line2
```

```{code-cell} ipython3
line = 'This is the first line.\n'
line += 'This is the second line.'
```


## Example 1

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3

str_format = '{}'.format(course_number)
f_string = f'{course_number}'

print(str_format)
print(f_string)
```

## Example 2

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3

str_format = 'The course number is {}.'.format(course_number)
f_string = f'The course number is {course_number}.'

print(str_format)
print(f_string)
```


## Example 3 use index

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {}. It has {} students.'.format(course_number, class_size)
str_format = 'The course number is {0}. It has {1} students.'.format(course_number, class_size)
f_string = f'The course number is {course_number}. It has {class_size} students.'

print(str_format)
print(f_string)
```


## Example 4 change index

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {1}. It has {0} students.'.format(course_number, class_size)
f_string = f'The course number is {class_size}. It has {course_number} students.'

print(str_format)
print(f_string)
```

## Example 5 adding a float

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0}. It has {1} students. The class average is {2}'.format(course_number, class_size, class_average)
f_string = f'The course number is {class_size}. It has {course_number} students. The class average is {class_average}.'

print(str_format)
print(f_string)
```

## Example 6 specify number of spaces to use -- width

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0:10}. It has {1:10} students. The class average is {2:10}'.format(course_number, class_size, class_average)
f_string = f'The course number is {course_number:10}. It has {class_size:10} students. The class average is {class_average:10}.'

print(str_format)
print(f_string)
```

## Example 7 right align


```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0:>10}. It has {1:>10} students. The class average is {2:>10}'.format(course_number, class_size, class_average)
f_string = f'The course number is {class_size:>10}. It has {class_size:>10} students. The class average is {class_average:>10}.'

print(str_format)
print(f_string)
```

## Example 8 left align

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0:<10}. It has {1:<10} students. The class average is {2:<10}'.format(course_number, class_size, class_average)
f_string = f'The course number is {course_number:<10}. It has {class_size:<10} students. The class average is {class_average:<10}.'

print(str_format)
print(f_string)
```


## Example 9 center align

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0:^10}. It has {1:^10} students. The class average is {2:^10}'.format(course_number, class_size, class_average)
f_string = f'The course number is {course_number:^10}. It has {class_size:^10} students. The class average is {class_average:^10}.'

print(str_format)
print(f_string)
```

## Example 10 Padding with zeros

```{code-cell} ipython3
student_id = 223333

str_format = 'The number padded {} padded with zeros {:08}'.format(student_id, student_id)
f_string = f'The number padded {student_id} padded with zeros {student_id:08}'

print(str_format)
print(f_string)
```

## Example 11 Padding with dashes

```{code-cell} ipython3
student_id = 223333

str_format = 'The number padded {} padded with zeros {:->8}'.format(student_id, student_id)
f_string = f'The number padded {student_id} padded with zeros {student_id:->8}'

print(str_format)
print(f_string)
```

