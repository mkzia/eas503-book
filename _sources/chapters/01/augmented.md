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

An augmented assignment combines an assignment statement with an operator to make the statement more concise. An augmented statement is executed as follows:
1. Evaluate the expression on the right of the `=` sign to produce a value. 
2. Apply the operator attached to the `=` sign to the variable on the left of the `=` and the value that was produced. This produces another value. Store the memory 
address of that value in the variable on the left of the `=`. 

Table {numref}`augmented` shows all the augmented assignments. 

```{table} Arithmetic operators
:name: augmented
| Symbol 	| Example       	| Result          	|
|--------	|---------------	|-----------------	|
| +=     	| x = 7 x += 2  	| x refers to 9   	|
| -=     	| x = 7 x -= 2  	| x refers 5      	|
| *=     	| x = 7 x *= 2  	| x refers to 14  	|
| /=     	| x = 7 x /= 2  	| x refers to 3.5 	|
| //=    	| x = 7 x //= 2 	| x refers to 3   	|
| %=     	| x = 7 x %= 2  	| x refers to 1   	|
| **=    	| x = 7 x **=2  	| x refers to 49  	|
```