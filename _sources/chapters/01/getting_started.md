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

# Getting Started

## Objectives

- To understand what a computer is.
- To understand what a program is.
- To understand what a programming language is.
- To learn about the features of Python.
- To begin using Python.

## Computers

- A modern computer can be defined as 'a machine that **stores** and **manipulates** information under the control of an **changeable program**.'
  - **Manipulation** means transforming information into new, useful forms, and then storing, outputting, or displaying information for our interpretation.
  - **Examples**:
    - Find students with the highest and lowest GPA.
    - Find patients whose stay in a hospital was more than 15 days.
    - Sort the monthly sales of a bakery to determine which months have the highest sales.
    - Classify a cancer case as benign or malignant based on diagnostic measurements.
    - Predict house prices based on historical data.

## What is a Program?

- A computer program is a detailed, step-by-step set of instructions that precisely tells a computer what to do.
- If we **change** the program, the computer performs a different sequence of actions, resulting in the execution of a distinct task.
- A program is composed of a few fundamental operations that its reader already comprehends. By utilizing these basic operations, you can introduce new operations to a computer by defining them in relation to the foundational ones.
  - **Example**: Computers comprehend basic mathematical operators such as addition and division. You can instruct the computer to calculate the average using these operators by guiding it to add all numbers in a sequence and then divide by the sequence size.
  - **Example**: Subsequently, you can integrate the newly created average operation with other functions to generate additional operations. This process is akin to constructing life, where atoms are assembled to form proteins, proteins are combined to construct cells, cells are organized into organs, and organs are assembled to create a living creature.
- Defining new operations and combining them to do useful things is the heart and soul of programming.
- Every computer is essentially a machine designed to execute (carry out) programs.
- Software (programs) governs the hardware (physical machines), and it is the software that dictates the capabilities of any computer. Without software, computers would be nothing more than costly paperweights. The act of crafting software is referred to as programming.

## What is a Programming Language?

- You can express directions to the nearest bus station in many different languages, such as English, Spanish, or Hindi.
- But natural languages are fraught with ambiguity and imprecision.
  - **English example**: "I saw a man on a hill with a telescope"
    - There is a man on a hill, and I am watching him with my telescope
    - There is a man on a hill, who I am seeing, and he has a telescope
    - There is a man, and he is on a hill that also has a telescope on it
    - I am on a hill, and I saw a man using a telescope
    - There is a man on a hill, and I am sawing him with a telescope.
    - source: <https://www.quora.com/What-are-some-examples-of-ambiguous-sentences>
- Computer scientists have resolved this issue by devising notations for expressing computations precisely and without ambiguity.
- These special notations are called "programming languages."
- Similar to natural languages, there exist numerous programming languages. However, they all serve as instructions that machines can comprehend. These programming languages can also exhibit variations in appearance. For instance, in Python, `3 + 4` signifies the addition of three and four. In Scheme, this equivalent instruction is presented as `(+ 3 4)`. While both convey the same concept, they are visually distinct.
- Every programming language includes methods for crafting mathematical expressions, iterating instructions multiple times, making selections among instructions based on available information, and much more.
- Programming languages take a **high-level** language, comprising human-readable expressions like `c = a + b`, and translate it into machine language that the computer can execute.
- A machine language consists of precise instructions for CPUs. When it comes to adding two numbers, the CPU instructions might resemble something like this:

```text
load the number from memory location 2001 into the CPU
load the number from memory location 2002 into the CPU
add the two numbers in the CPU
store the result in to location 2003
```

- Compilers transform programs written in a high-level language into the machine language of a specific computer; the compiled code is dependent on the hardware and operating system.
- Interpreters simulate a computer that understands a high-level language.
  - The source program is not translated into machine language all at once.
  - An interpreter analyzes and executes the source code instruction by instruction (line by line).

### Compiling vs. Interpreting

- Once a program has been compiled, it can be executed repeatedly without requiring the source code or compiler. If it is interpreted, both the source code and the interpreter are necessary each time the program runs.
- Compiled programs generally run faster since the translation of the source code occurs only once.
- Interpreted languages offer a more flexible programming environment as they can be developed and run interactively.
- Interpreted programs are more portable, meaning the executable code produced by a compiler for a specific architecture won't run on a different architecture without recompilation. In contrast, if a suitable interpreter already exists, the interpreted code can be run with no modifications.

:::{warning}
<strong> Bad code can become ambiguous due to human error. However, to a machine, it remains unambiguous. </strong>  When this occurs, the program might exhibit unexpected behavior, which is referred to as a **bug!**
:::

## Features of Python

Python is

- **High-level language:**
  - A low-level language provides less abstraction than high-level languages and is closer to the actual machine language.
- **Interpreted language:**
  - Technically, Python employs a hybrid compiling/interpreting process. The Python source code in the module file (the `.py` file) is compiled into more primitive instructions known as `byte code`. This byte code (the `.pyc` file) is subsequently interpreted. The presence of a `.pyc` file enhances the speed of module execution on subsequent runs. If this file is deleted, Python will regenerate it.
- **Object-oriented language:**
  - It combines data and the corresponding instructions for data manipulation into a single package.
- **Easy to learn:**
  - Python's syntax is simple, making it easy to understand and read.
- **Versatile:**
  - Python can be used for various purposes such as web development, machine learning, and cloud administration.
- **Popular:**
  - It boasts numerous third-party packages that extend its functionality, particularly in the realm of data science.

## Using Python

There are four ways in which you can use Python. We will demonstrate how to utilize all four methods, with a primary focus on Jupyter Notebook and Microsoft Visual Code

### A Basic Python Program

- Please install [Anaconda Python Distribution](https://www.anaconda.com/products/distribution)

```python
def add(x: int, y:int) -> int:
    return x + y

def main():
    x = 1
    y = 2
    result = add(x, y)
    output_string = f'The output of add({x}, {y}) is {result}.'
    print(output_string)

if __name__=='__main__':
    main()
```

- By convention, the statements of a program are often placed in a function called `main()`.

1. Command Line
2. IDLE
3. Jupyter Notebook
4. Microsoft Visual Code
   1. Recommended Packages
      1. File Utils
      2. Markdown All in One
      3. SQLite Viewer
