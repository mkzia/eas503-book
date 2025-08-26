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

# Operator Precedence

What is `8/2(2+2)`?

PEMDAS: “Please Excuse My Dear Aunt Sally”

Order of precedence:

1. Parentheses
2. Exponents
3. Multiplication and division (left to right)
4. Addition and subtraction (left to right)

## Precedence in Python

1. Parentheses
2. Exponentiation `**` (right to left)
3. Unary plus `+x`, unary minus `-x`
4. Multiplication `*`, division `/`, floor division `//`, modulo `%` (left to right)
5. Addition `+`, subtraction `-`

## Ambiguity in `8/2(2+2)`

The expression `8/2(2+2)` is ambiguous. Under standard precedence (and Python’s rules), it’s parsed as:

8 / 2 * (2 + 2)

Some readers might interpret `2(2+2)` as implicit multiplication forming a single term:

8 / (2 * (2 + 2))

To avoid ambiguity, always add parentheses to make the intended order explicit.

## What’s potentially unclear about `212 - 32 * 5 / 9`?

The expression is valid, but the intent may be unclear to readers. Parentheses improve readability:

```python
212 - (32 * 5 / 9)
```

This makes it obvious that the multiplication and division occur before the subtraction.

## Best practice

Use parentheses to clarify complex expressions, even when not strictly necessary. Clear grouping improves readability and reduces errors.
