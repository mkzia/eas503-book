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

# Arithmetic Operators

{numref}`arithmetic-operators` lists the arithmetic operators.

```{table} Arithmetic operators
:name: arithmetic-operators
| **Symbol**  | **Operator**      | **Example**  | **Result**  |
|------------ |------------------ |------------- |------------ |
| -           | Negation          | -5           | -5          |
| +           | Addition          | 11 + 3.1     | 14.1        |
| -           | Subtraction       | 5 - 19       | -14         |
| *           | Multiplication    | 8.5 * 4      | 34.0        |
| /           | Division          | 11 / 2       | 5.5         |
| //          | Integer Division  | 16 // 5      | 3           |
| %           | Modulus/Remainder | 31 % 24      | 7           |
| **          | Exponentiation    | 2 ** 5       | 32          |
```

Operators that have two operands are called **binary operators**. Negation is a **unary** operator because it applies to one operand.

## Negation

The negation operator simply negates the value.

```{code-cell} ipython3
-5
```

```{code-cell} ipython3
--5
```

```{code-cell} ipython3
---5
```

## Addition, Subtraction, Multiplication, and Division

- The addition, subtraction, multiplication, and division operators are the familiar mathematical operators.

:::{warning}
When the operands are of mixed data type, meaning `int` and `float`, the resulting value will be type `float`.
:::

## Integer Division, Modulo

To know the integer part of a division result, use the integer division operator. For example, to know how many 24-hour days there are in 53 hours.

```{code-cell} ipython3
53 // 24
```

To find out how many hours are left over, you can use the modulo operator, which gives the remainder of the division:

```{code-cell} ipython3
53 % 24 
```

### Working with Negative Numbers

To correctly compute the result with negative numbers in integer division and the modulo operation, remember two rules:

- **Rule 1**: Python's integer division rounds towards negative infinity, which differs from truncation. Truncation simply discards digits after the decimal point. Therefore, exercise caution when dealing with negative operands.
- **Rule 2**: `n = q * base + r`, where:
  - `n` represents the dividend, the number to the left of `//` and `%`.
  - `q` stands for the quotient, obtained through integer division.
  - `base` denotes the divisor, the number to the right of `//` and `%`
  - `r` signifies the remainder, the outcome of the modulo operator.
  
By considering the equation in rule **Rule 2**, it will follow that for the modulo operator, the sign of the remainder matches the sign of the divisor.

### Case 1: Positive `n` and Negative `base`

Consider:

- `n = 17`
- `base = -10`

When dividing 17 by -10, the result is -1.7, which rounds down to -2 due to **Rule 1** and is the quotient (`q`). To calculate the modulo operator result, solve for `r` in the equation `17 = -2 * -10 + r`, yielding `r = -3`. Observe that the sign of the remainder matches that of the divisor.

```{code-cell} ipython3
17 // -10
```

```{code-cell} ipython3
17 % -10
```

### Case 2: Negative `n` and Positive `base`

Consider:

- `n = -17`
- `base = 10`

When dividing -17 by 10, the result is -1.7, which rounds down to -2 due to **Rule 1** and is the quotient (`q`). To determine the modulo result, solve for `r` in the equation `-17 = -2 * 10 + r`, yielding `r = 3`. Observe that the sign of the remainder matches that of the divisor.

```{code-cell} ipython3
-17 // 10
```

```{code-cell} ipython3
-17 % 10
```

### Case 3: Negative `n` and Negative `base`

Consider:

- `n = -17`
- `base = -10`

When dividing 17 by 10, the result is 1.7, which rounds down to 1 due to **Rule 1** and is the quotient (`q`). To determine the modulo result, solve for `r` in the equation `-17 = 1 * -10 + r`, yielding `r = -7`. Observe that the sign of the remainder matches that of the divisor.

```{code-cell} ipython3
-17 // -10
```

```{code-cell} ipython3
-17 % -10
```

## Exponentiation

The following expression calculates 3 raised to the 6th power:

```{code-cell} ipython3
3 ** 6
```
