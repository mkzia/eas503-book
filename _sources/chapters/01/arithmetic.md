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

# Arithmetic Operators in Python

This section provides an overview of arithmetic operators in Python, including their usage, examples, and behavior with negative numbers.

## Arithmetic Operators Overview

| Symbol | Operator         | Example    | Result |
| ------ | ---------------- | ---------- | ------ |
| `-`    | Negation (unary) | `-5`       | `-5`   |
| `+`    | Addition         | `11 + 3.1` | `14.1` |
| `-`    | Subtraction      | `5 - 19`   | `-14`  |
| `*`    | Multiplication   | `8.5 * 4`  | `34.0` |
| `/`    | Division         | `11 / 2`   | `5.5`  |
| `//`   | Integer division | `16 // 5`  | `3`    |
| `%`    | Modulo/remainder | `31 % 24`  | `7`    |
| `**`   | Exponentiation   | `2 ** 5`   | `32`   |

## Negation

The negation operator (`-`) negates the value of its operand.

### Negation examples

-5 # Result: -5
--5 # Result: 5
---5 # Result: -5

## Addition, subtraction, multiplication, and division

These operators perform the standard mathematical operations.

### Examples

```python
11 + 3.1  # Result: 14.1
5 - 19    # Result: -14
8.5 * 4   # Result: 34.0  (result is float because 8.5 is float)
11 / 2    # Result: 5.5
```

> Note: When operands are of mixed numeric types (e.g., `int` and `float`), the result is a `float`.

## Integer division (`//`) and modulo (`%`)

### Integer division (`//`)

The integer division operator (`//`) returns the floor of the division—i.e., the largest integer less than or equal to the true quotient. If both operands are integers, the result is an integer; if at least one operand is a float, the result is a float.

#### Example

```python
53 // 24  # Result: 2
```

### Modulo (`%`)

The modulo operator (`%`) returns the remainder of the division. The remainder’s sign matches the divisor’s sign.

#### Example

```python
53 % 24  # Result: 5
```

## Working with negative numbers

When performing integer division and modulo operations with negative numbers, Python follows these rules:

1. Integer division rounds toward negative infinity (floor), not toward zero.
2. The relationship between dividend, divisor, quotient, and remainder is:
   ```
   n = q * base + r
   ```
   - `n`: dividend (left of `//` or `%`)
   - `q`: quotient (result of `//`)
   - `base`: divisor (right of `//` or `%`)
   - `r`: remainder (result of `%`)

The sign of the remainder (`r`) always matches the sign of the divisor (`base`). This differs from some other languages where the remainder’s sign may match the dividend’s sign.

### Case 1: Positive `n` and negative `base`

Given `n = 17` and `base = -10`:

```python
17 // -10  # Result: -2
17 % -10   # Result: -3
```

Explanation:

- Quotient (`q`) = -2 (floors from -1.7)
- Remainder (`r`) = -3 (matches the divisor’s sign)

### Case 2: Negative `n` and positive `base`

Given `n = -17` and `base = 10`:

```python
-17 // 10  # Result: -2
-17 % 10   # Result: 3
```

Explanation:

- Quotient (`q`) = -2 (floors from -1.7)
- Remainder (`r`) = 3 (matches the divisor’s sign)

### Case 3: Negative `n` and negative `base`

Given `n = -17` and `base = -10`:

```python
-17 // -10  # Result: 1
-17 % -10   # Result: -7
```

Explanation:

- Quotient (`q`) = 1 (floor of 1.7 is 1)
- Remainder (`r`) = -7 (matches the divisor’s sign)

## Exponentiation

The exponentiation operator (`**`) raises a number to the power of another.

### Example

```python
3 ** 6     # Result: 729
2 ** -3    # Result: 0.125
9 ** 0.5   # Result: 3.0
```

Python supports negative and fractional exponents.
