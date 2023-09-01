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

**PEMDAS**: "Please Excuse My Dear Aunt Sally"

Order of Precedence:

1. **P** – Parentheses
2. **E** – Exponents
3. **MD** - Multiplication and Division (left to right)
4. **AS** – Addition and Subtraction (left to right)

Precedence in Python:

1. Parentheses
2. Exponents
3. Unary plus, Unary minus
4. Multiplication, Division, Integer division, Modulus (Remainder)
5. Addition, Subtraction

What is incorrect with the following expression? `212 - 32 * 5 / 9`

It's advisable to use parentheses to clarify complex expressions, even when they aren't necessary for intent, as this practice enhances code readability.
