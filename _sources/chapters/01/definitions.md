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

- To learn the key terms used to comprehend programming.

## Previous Terms

- **Hardware:** The physical components of a computing system.
- **Computer:** A machine that stores and manipulates information under the control of a changeable program.
- **Program:** A detailed set of instructions for a computer to execute.
- **Programming:** The process of creating a computer program to solve a specific problem.
- **Programming Language:** A notation used for writing computer programs, often referring to high-level languages like Python, Java, C++, etc.
- **High-level Language:** A programming language that is readable by humans.
- **Low-level Language:** A programming language with fewer abstractions than a high-level language, requiring more explicit instructions.
- **Machine Language:** The actual CPU instructions for storing, accessing data from, or writing data into memory, as well as executing computations.

## New Terms

- **Syntax:** A set of rules that specify the correct arrangement of operators and operands.
- **Operator:** Symbols that perform specific mathematical or logical manipulations.
- **Operand:** The value that an operator acts upon.
- **Expression:** A combination of operators and operands that returns a value.
- **Statement:** A single command in a programming language.

The **syntax** of a computer language consists of a set of rules that guide how you can combine **operators** and **operands** to form valid **expressions**.

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
