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

# Python Data Types

Python supports various data types, which we will introduce as we encounter them. Understanding data types is crucial because every value in Python has an associated type, and how values behave when combined is determined by their types.

To determine the data type of a value, use the `type()` function:

```python
type(2) # Output: <class 'int'>
type(3.14) # Output: <class 'float'>
```

## int and float

- Values such as `4` and `-7` have the data type `int` (short for integer).
- Values like `2.5` and `-17.0` belong to the data type `float` (short for floating point).
- The value `7j` is an instance of the `complex` data type (used for complex numbers).

### Key characteristics

1. int

   - Stores whole numbers (positive, negative, or zero) with unlimited precision.
   - Examples: `-100`, `0`, `42`.

2. float
   - Stores numbers with decimal points (positive or negative).
   - Examples: `3.14`, `-0.001`, `2.0`.



### Rules for numeric operations

Python follows specific rules when performing operations with numeric data types:

1. Two int operands produce an int

   ```python
   1 + 2           # Output: 3
   type(1 + 2)     # Output: <class 'int'>
   ```

2. Two float operands produce a float

   ```python
   1.0 + 2.0       # Output: 3.0
   type(1.0 + 2.0) # Output: <class 'float'>
   ```

3. Mixing int and float produces a float

   Python automatically converts the int to a float in mixed-type operations.

   ```python
   17.0 - 10        # Output: 7.0
   type(17.0 - 10)  # Output: <class 'float'>

   17 - 10.0        # Output: 7.0
   type(17 - 10.0)  # Output: <class 'float'>
   ```

4. Omitting the 0 after the decimal point

   You can write `10.` instead of `10.0`, but this is generally considered poor style.

   ```python
   10.   # Output: 10.0
   ```


### Differences between int and float

1. Memory usage

   - float occupies a fixed amount of memory (commonly 24 bytes on many CPython builds; this can vary by platform and Python version).
   - int uses a variable amount of memory depending on the size of the number.

   Example:

   ```python
   import sys
   sys.getsizeof(2.0)     # Example output: 24 (bytes)
   sys.getsizeof(2**30)   # Example output: 32
   sys.getsizeof(2**130)  # Example output: 44
   ```

   Note: Python’s int is implemented as an arbitrary-precision integer (“bignum”), so it grows as needed.

2. Precision

   - int values are exact.
   - float values are binary approximations of real numbers due to finite memory, which can lead to rounding behavior.

   Example:

   ```python
   2 / 3  # Output: 0.6666666666666666
   5 / 3  # Output: 1.6666666666666667
   ```

3. Use cases
   - Use int when you do not need fractional values.
   - Use float when working with real numbers or when fractional values are required.


### Additional notes

- The `type()` function is a handy way to inspect the data type of a value.
- Python also supports the `complex` type for complex numbers (e.g., `7 + 3j`), though it’s less common in everyday programming.
