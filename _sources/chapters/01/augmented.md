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

# Augmented Assignments

An augmented assignment combines an operator with assignment to produce a concise, readable statement.

Execution steps:

1. Evaluate the expression on the right-hand side of the equals sign to produce a value.
2. Apply the operator to the left-hand operand and the evaluated value, then assign the result back to the left-hand side. For mutable objects (e.g., lists), the operation may modify the object in place rather than rebind the name.

## Augmented assignment operators

| Symbol | Example          | Result              |
| ------ | ---------------- | ------------------- |
| `+=`   | `x = 7; x += 2`  | `x` refers to `9`   |
| `-=`   | `x = 7; x -= 2`  | `x` refers to `5`   |
| `*=`   | `x = 7; x *= 2`  | `x` refers to `14`  |
| `/=`   | `x = 7; x /= 2`  | `x` refers to `3.5` |
| `//=`  | `x = 7; x //= 2` | `x` refers to `3`   |
| `%=`   | `x = 7; x %= 2`  | `x` refers to `1`   |
| `**=`  | `x = 7; x **= 2` | `x` refers to `49`  |

Notes:

- `/=` always produces a float result, even when both operands are integers.
- `//=` follows floor-division semantics: it rounds toward negative infinity for negative numbers.
- `%=` follows Python’s modulo rule: the remainder’s sign matches the divisor’s sign.
