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

# Definitions

Objectives
- To learn words that are used to understand programs


## Previous Definitions
- Hardware: The physical components of a computing system.
- Computer: A machine that stores and manipulates information under the control of a changeable program.
- Program: A detailed set of instructions for a computer to carry out.
- Programming: The process of creating a computer program to solve some problem.
- Programming Language: A notation for writing computer programs. Usually used to refer to high-level languages such as Python, Java, C++, etc.
- High-level Language: A programming language that is human readable. 
- Low-level Language: A programming language that has less abstractions than a high-level language, meaning you have to write more explicit instructions. 
- Machine language: Actual CPU instructions for storing and accessing data from/into memory and executing computations. 

## New Definitions
- Syntax: a set of rules that specify correct arrangement of operators and operands. 
- Operator: symbols that perform specific mathematical or logical manipulations. 
- Operand: the value that an operator acts on.
- Expression: combination of operators and operands that return a value.
- Statement: a single command in a programming language.

The **syntax** of a computer language is a set of rules that tells you how you can combine **operators** and **operands** to write legal **expressions**.  

## Example

```{code-cell} ipython3
3 + 4
```

In the above expression:
- `3` is an operand.
- `+` is an operator.
- `4` is an operand.
- The whole thing is called an expression. 

The expression `3 + 4` is **evaluated** to `7`. When an expression is evaluated, it produces a single value.

The operand can be a value or another expression.

```{code-cell} ipython3
2 - (3 / 5)
```
In the above expression:
- `3` is an operand.
- `+` is an operator.
- `(3 / 5)` is an operand which itself is an expression, a legal arrangement of operands and an operator.

Expressions do not have to involve an operator.

```{code-cell} ipython3
212
```
The above line is consider both an expression and a value.

