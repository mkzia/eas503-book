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

# Errors in Python

When an error occurs, Python provides informative messages to help you diagnose and fix the problem. This section introduces three common errors you’re likely to encounter early on. Additional error types will appear later as needed.

## NameError

A NameError occurs when you reference a name (variable or function) that hasn’t been defined or is out of scope. Common causes include typos, using a variable before assigning it, or accessing a name outside its scope.

Example:

print(my_variable)

Explanation: The name `my_variable` has not been defined, so Python raises a NameError. Define the variable before using it.

## SyntaxError

A SyntaxError occurs when code violates Python’s grammar rules. Typical issues include missing operands, invalid assignments, unmatched parentheses, incorrect indentation, or misuse of reserved keywords.

Examples:

2 +

Explanation: The `+` operator is missing a right-hand operand; Python expects a complete expression such as `2 + 3`.

```python
12 = x
```

Explanation: You can’t assign to a literal. Put the variable on the left-hand side: `x = 12`.

## ZeroDivisionError

A ZeroDivisionError occurs when you attempt to divide by zero. This applies to integer and floating-point division, and it can occur with `/`, `//`, and `%`.

Example:

```python
3 / 0
```

Explanation: Division by zero is undefined, so Python raises ZeroDivisionError. This error is specific to division-like operations and does not occur with addition, subtraction, or multiplication.
