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


# Relational Operators
- A relational operator converts a conditional into a boolean, which is a basic Python data type.

- Assume `a=1` and `b=1`

| Relational Operators | What it does?                                | Example       |
|----|---------------------------------------------|---------------|
| == | True if a has the same value as b           | a == b #True  |
| != | True if a does not have the same value as b | a != b #False |
| >  | True if a is greater than b                 | a > b # False |
| <  | True if a is less than b                    | a < b # False |
| >= | True if a is greater than or equal to b     | a >= b # True |
| <= | True if a is less than or equal to b        | a <= b # True |

- These operators evaluate to True or False depending on the values you give them.
- Conditionals are used to instruct computer to make a decision. 


```python
45 > 34
45 > 79
45 < 79
45 < 34

23.1 >= 23
23.1 >= 23.1
23.1 <= 23.1
23.1 <= 23

67.3 == 87
67.3 == 67
67.0 == 67
67.0 != 67
67.0 != 23
```

##  Combining Comparisons

```python
x = 2
y = 5
z = 7
x < y and y < z

(x < y) and (y < z) # better

```

```python
x = 3
(1 < x) and (x <= 5)

x = 7
(1 < x) and (x <= 5)


x = 3 
1 < x <= 5 # You can chain comparisons

3 < 5 != True 
(3 < 5) and (5 != True)

3 < 5 != False
(3 < 5) and (5 != False)
```

## Short-Circuit Evaluation 
- When Python evaluates an expression containing `and` or `or`, it does so from left to right. As soon as it knows enough to stop evaluating, it stops, even if some operands have not been looked at yet. This is called short-circuit evaluation. 

```python
is_superuser = True
is_staff = True
is_active = False
if is_superuser or (is_staff and is_active):
    print('Enter!')
else:
    print('You Shall Not Pass!')
```

``` python
is_staff = True
is_active = True
if is_staff and is_active:
    print('Enter!')
else:
    print('You Shall Not Pass!')
```