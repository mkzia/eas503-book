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

- [Video Recording (36 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=c8e521d6-9b89-4f8e-ae5b-afa3004ff4f5)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/03/formatting.ipynb)

# String Formatting

The fastest and latest way to do string formatting is using the F-strings.

```{code-cell} ipython3
  PI = 3.14159265359 
  print(f'{PI:.2f}')
```

But you have to know the other ways so you can read older code or use these ways if you have to use an older version of Python

## What can you format?

String-formatting allows you to do at least five things. These string-format specifiers come after a colon.

1. specify width
2. align data to left, right, or center; make sure to explain the default alignment for string and number; make sure to
3. specify padding character when specified width is greater than the width of the string/number being used
4. specify precision for floating values
5. add commas to numbers for easier viewing;

## Oldest Method

```{code-cell} ipython3
  PI = 3.14159265359 
  name = 'PI'
  print('%s is %.2f' % (name, PI))  # oldest way format specifier is <width>.<precision><type>
```

## Newer Method

Still used for creating string templates.

```{code-cell} ipython3
PI = 3.14159265359 
name = 'PI'
print(('{0} is {1:.2f}'.format('PI', PI)) ) # 
```

## Newest Method

Newest and fastest method for string formatting.
`{<variable or expression>}:<format-specifier>}` where the format specifier is: `<padding_character><alignment><width>.<comma><precision><type>`

- padding_character can be anything. most common are
  - space (default)
  - `-`
  - `0`
- alignment
  - `<` -- left aligned
  - `^` -- center aligned
  - `>` -- right aligned
- width is a number. If the width is greater than the number of characters, then:
  - strings are left aligned
  - numbers are right aligned
- comma is used to add commas to large numbers for easier viewing
- precision controls how many decimal places to show. **NOTE** This uses round, but leaves trailing zeros.
- type specifies the data type
  - `f` -- float
  - `d` -- integer
  - `s` -- string

```{code-cell} ipython3
PI = 3.14159265359 
name = 'PI'
# {<variable or expression>:<format-specifier>} where the format specifier is <width>.<precision><type>
print(f'{name} is {PI:.2f}') # newest way
```

Reference: <https://pyformat.info/>

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
str_format = 'The course number is {0}. It has {1} students. The class average is {2}.'.format(course_number, class_size, class_average)
f_string = f'The course number is {class_size}. It has {course_number} students. The class average is {class_average}.'

print(str_format)
print(f_string)
```

## Example 6 specify number of spaces to use -- width

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0:10}. It has {1:10} students. The class average is {2:10}.'.format(course_number, class_size, class_average)
f_string = f'The course number is {course_number:10}. It has {class_size:10} students. The class average is {class_average:10}.'

print(str_format)
print(f_string)
```

## Example 7 right align

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0:>10}. It has {1:>10} students. The class average is {2:>10}.'.format(course_number, class_size, class_average)
f_string = f'The course number is {course_number:>10}. It has {class_size:>10} students. The class average is {class_average:>10}.'

print(str_format)
print(f_string)
```

## Example 8 left align

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0:<10}. It has {1:<10} students. The class average is {2:<10}.'.format(course_number, class_size, class_average)
f_string = f'The course number is {course_number:<10}. It has {class_size:<10} students. The class average is {class_average:<10}.'

print(str_format)
print(f_string)
```

## Example 9 center align

```{code-cell} ipython3
course_number = 'EAS503'
class_size = 113
class_average = 92.3
str_format = 'The course number is {0:^10}. It has {1:^10} students. The class average is {2:^10}.'.format(course_number, class_size, class_average)
f_string = f'The course number is {course_number:^10}. It has {class_size:^10} students. The class average is {class_average:^10}.'

print(str_format)
print(f_string)
```

## Example 10 Padding with zeros

- Zero padding does not require a alignment specifier

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

## Example 12 Adding Commas

```{code-cell} ipython3
number = 123456
f'{number:,}'
```

```{code-cell} ipython3
number = 123456.2345
f'{number:,.2f}'
```

## Rounding

- When you use `.2f`, for example, the f-string will round, but keep the trailing zero. When you use the `round()` function, the trailing zero is dropped. Study the following examples.

```{code-cell} ipython3
f'{3.5:.0f}'
```

```{code-cell} ipython3
f'{4.5:.0f}'
```

```{code-cell} ipython3
f'{2.675:.2f}'
```

```{code-cell} ipython3
f'{4.5:.2f}'
```

```{code-cell} ipython3
round(4.5, 2)
```

```{code-cell} ipython3
f'{4.5:.0f}'
```

```{code-cell} ipython3
f'{4.8999:.2f}'
```

```{code-cell} ipython3
round(4.8999, 2)
```
