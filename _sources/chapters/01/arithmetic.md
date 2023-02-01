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
| **Symbol** 	| **Operator**     	| **Example** 	| **Result** 	|
|------------	|------------------	|-------------	|------------	|
| -          	| Negation         	| -5          	| -5         	|
| +          	| Addition         	| 11 + 3.1    	| 14.1       	|
| -          	| Subtraction      	| 5 - 19      	| -14        	|
| *          	| Multiplication   	| 8.5 * 4     	| 34.0       	|
| /          	| Division         	| 11 / 2      	| 5.5        	|
| //         	| Integer Division 	| 16 // 5     	| 3          	|
| %          	| Modulus/Remainder | 31 % 24   	  | 7        	  |
| **         	| Exponentiation   	| 2 ** 5      	| 32         	|
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

## Integer Division, Modulo, and Exponentiation 
To know the integer part of a division result, use the integer division operator. For example, to know how many 24-hour days there are in 53 hours. 

```{code-cell} ipython3
53 // 24
```

To find out how many hours are left over, you can use the modulo operator, which gives the remainder of the division:

```{code-cell} ipython3
53 % 24 
```

:::{warning}
Python integer division rounds towards negative infinity. This is different from truncation. Truncation would just drop the digits after the decimal. So, be careful with negative operands! 
:::

```{code-cell} ipython3
17 // 10
```

```{code-cell} ipython3
-17 // 10
```

`-1.7` rounded towards negative infinity is `-2`. 

For the modulo operator, the sign of the result matches the sign of the divisors (the second operand)
```{code-cell} ipython3
-17 % 10
```

```{code-cell} ipython3
17 % 10
```

The following expression calculates 3 raised to the 6th power:

```{code-cell} ipython3
3 ** 6
```

