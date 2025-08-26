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

# Working with Large Numbers

What is the output of the following code?

10000000000 + 0.00000000001

The result should, in theory, reflect the tiny increment. However, due to floating-point precision limits, the actual result is `10000000000.0`—as if the addition never happened. This occurs because Python (like most languages) uses IEEE 754 double-precision floats with finite precision. When two numbers differ greatly in magnitude, the smaller addend can be rounded away.

Adding many small numbers to a very large number can likewise have no observable effect. This is problematic in domains like finance, where every cent matters.

To reduce floating-point error when summing:

- Add numbers in ascending order of magnitude (smallest to largest).
- Use dedicated high-precision tools when correctness is critical.

Better options for higher precision:

- Python’s built-in decimal arithmetic: the `decimal` module (configurable precision).
- Arbitrary-precision libraries such as [mpmath](https://mpmath.org/).

Example with Decimal:

```python
from decimal import Decimal, getcontext

getcontext().prec = 30
result = Decimal('10000000000') + Decimal('0.00000000001')
print(result)  # 10000000000.00000000001
```
