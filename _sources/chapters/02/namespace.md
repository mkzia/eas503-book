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

# Namespace and Scope

**Namespace**: an association between identifiers and the things they represent in a program. In Python, modules, classes, and objects act as namespaces.

**Scope**: The area of a program where a given variable maybe reference. For examples, variables defined in functions are said to have local scope.

```{code-cell} ipython3
def quadratic(a, b, c, x):
    """ax^2 + bx + c"""
    first = a * x ** 2
    second = b * x
    third = c
    return first + second + third
quadratic(2, 3, 4, 0.5)
quadratic(2, 3, 4, 1.5)
```

Variables like `first`, `second`, and `third` that are created within a function are called local variables. Local variables get created each time that function is called, and they are erased when the function returns. Because they only exist when the function is being executed, they cannot be used outside of the function. This means that trying to access a local variable from outside the function is an error, just like trying to access a variable that has never been defined is an error.

A function’s parameters are also local variables, so we get the same error if we try to use them outside of a function definition.

The area of a program that a variable can be used in is called the variable’s **scope**. The scope of a local variable is from the line in which it is defined up until the end of the function.

```{code-cell} ipython3
y = 1
def quadratic(a, b, c, x):
    """ax^2 + bx + c"""
    first = a * pow(x, 2) ## Changed
    second = b * x
    third = c
    return first + second + third
quadratic(2, 3, 4, 0.5)
quadratic(2, 3, 4, 1.5)
```

## Tracing Function Calls in the Memory Location

Let us trace the function call [link](https://pythontutor.com/visualize.html#code=def%20f%28x%29%3A%0A%20%20%20%20x%20%3D%202%20*%20x%0A%20%20%20%20return%20x%0A%20%20%20%20%0Ax%20%3D%201%0Ax%20%3D%20f%28x%20%2B%201%29%20%2B%20f%28x%20%2B%202%29&cumulative=true&curInstr=0&heapPrimitives=true&mode=display&origin=opt-frontend.js&py=3&rawInputLstJSON=%5B%5D&textReferences=false)

```python
def f(x):
    x = 2 * x
    return x
    
x = 1
x = f(x + 1) + f(x + 2)
```
