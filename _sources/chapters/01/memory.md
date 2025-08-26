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

# Memory Management in Python

The way Python handles variables in memory differs from many other programming languages. In some languages, variables act like named storage locations—literal boxes in memory that hold values. When you assign a new value, it overwrites the old one.

![Memory Model 1](./mem_model1.png)

In Python, values (objects) live somewhere in memory, and variables are references to those objects. Assigning a variable is like placing a small sticky note on a value that says, “This is x.” This is often called the sticky-note model. In other words, a Python variable is a symbolic name bound to an object (a value with a type at a memory address).

![Memory Model 2](./mem_model2.png)

## What happens when we execute this statement?

```text
variable = expression
```

Execution proceeds as follows:

1. Evaluate the expression on the right-hand side of = to produce a value (an object with a type and a memory address).
2. Bind the name on the left-hand side to that object by storing its address/reference in the variable. If the name doesn’t exist yet, Python creates it; if it does, Python rebinds the name to the new object.

Note: The previous object is not “overwritten.” If nothing else references it, it becomes eligible for garbage collection.

## Example 1

```python
difference = 20
double = 2 * difference
print(double)   # 40

difference = 5
print(double)   # 40 (unchanged, because double already refers to its own value)
```

Explanation:

- After the first two lines, `double` references the result of `2 * 20`, which is `40`.
- Rebinding `difference` to `5` does not retroactively change `double`.

## Example 2

```python
number = 3
print(number)           # 3

number = 2 * number
print(number)           # 6

number = number * number
print(number)           # 36
```

Explanation:

- Each assignment rebinds `number` to a new result; it doesn’t mutate a stored value in place.

You can use Python Tutor to visualize the bindings (the “sticky notes”) as they change:
https://pythontutor.com/
