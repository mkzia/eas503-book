# Getting Started

- Objectives
  - To understand what is a computer.
  - To understand what is a program.
  - To understand what is a programming language.
  - To learn about the features of Python.
  - To being using Python.


## Computers
- A modern computer can be defined as "a machine that **stores** and **manipulates** information
under the control of a **changeable program**."

- **manipulation** means to to transform information into new, useful forms, and then store, output,
or display information for our interpretation. 
  - Examples
    - Find students with highest and lowest GPA
    - Find patients whose stay in a hospital was more than 15 days
    - Sort the monthly sales of a bakery to determine which months have the highest sales
    - Classify a cancer case as benign or malignant based on diagnostic measurements
    - Predict house price based on historical data


## What is a Program?
- A computer program is a detailed step-by-step set of instructions telling a computer exactly what to do.

- If we **change** the program, then the computer performs a different sequence of actions, and hence, performs
a different tasks. 

- A program is written in terms of a few basic operations that its reader already understands. Using these few basic operations, you can "teach" a computer new operations by defining them in terms of the basic operations.
  - Example: Computers understand the addition and division operator, which are the basic mathematical operators. You can teach the computer to calculate the average by using the addition and division operator by instruction the computer to add all the numbers in a sequence and divide by the size of the sequence. 
  - Example: You can then use the new average operation and combine with other operations to create more operations. It’s a lot like creating life by putting atoms together to make proteins and then combining proteins to build cells, combining cells to make organs, and combining organs to make a creature.
  Defining new operations and combining them to do useful things is the heart and soul of programming.

- Every computer is just a machine for executing (carrying out) programs.

- Software (programs) rules the hardware (the physical machines). It is the software that determines what any computer can do. Without software, computers would just be expensive paperweights. The process of creating software is called programming. 

## What is a Programming Language?
- You can express directions to the nearest bus station in many different languages such as English, Spanish, or Hindi. 

- But natural languages are fraught with ambiguity and imprecision. 
  - English example: "I saw a man on a hill with a telescope."
    - There is a man on a hill, and I am watching him with my telescope.
    - There is a man on a hill, who I am seeing, and he has a telescope.
    - There is a man, and he is on a hill that also has a telescope on it.
    - I am on a hill, and I saw a man using a telescope.
    - There is a man on a hill, and I am sawing him with a telescope.
    - source: https://www.quora.com/What-are-some-examples-of-ambiguous-sentences

- Computer scientists have gotten around this problem by designing notations for expressing computations in an exact and unambiguous way. 
- These special notations are called "programming languages."
- Similar to natural languages, there are many programming languages. But they all are instructions that a machine
can understand. Programming languages can also look different. For example `3 + 4` in Python means add three to four. This same
instruction in Schema is express as `(+ 3 4)`.  They are both express the same idea-- they just look different. 
- Every programming language has a way to write mathematical expressions, repeat instructions a number of times, choose which instructions based on the current information you have, and much more.
- Programming languages take a high-level human readable language expression such as `c = a + b` and translates to machine language that the computer can execute.
- Machine language consists of actual instructions to CPUs. For adding two numbers, the CPU instructions might looking something like this:
```text
load the number from memory location 2001 into the CPU
load the number from memory location 2002 into the CPU
add the two numbers in the CPU
store the result into location 2003
```
- Compilers convert programs written in a high-level language into the machine language of some computer; the compiled code is hardware dependent.
- Interpreters simulate a computer that understands a high-level language.
- The source program is not translated into machine language all at once.
- An interpreter analyzes and executes the source code instruction by instruction (line-by-line).
- Compiling vs. Interpreting
  - Once program is compiled, it can be executed over and over without the source code or compiler. If it is interpreted, the source code and interpreter are needed each time the program runs
  - Compiled programs generally run faster since the translation of the source code happens only once.
  - Interpreted languages are part of a more flexible programming environment since they can be developed and run interactively
  - Interpreted programs are more portable, meaning the executable code produced from a compiler for a Pentium won’t run on a Mac, without recompiling. If a suitable interpreter already exists, the interpreted code can be run with no modifications.

:::{warning}
<strong>Bad code can be ambiguous due to human error. To the machine it is not ambiguous.</strong> When this happens, the program might behave unexpectedly. This unexpected behavior is called a **bug**!
:::

## Features of Python
- Python is
  - high-level language
    - a low-level language provides less abstraction than high-level languages to actual machine language
  - an interpreted language
    - Technically, Python uses a hybrid compiling/interpreting process. The Python source in the module file (the `.py`) is compiled into more primitive instructions called `byte code`. This byte code (the `.pyc`) is then interpreted. Having a `.pyc` file available makes running a module faster the second time around. If you delete this file, Python will create it again.
  - an object oriented language
    - combines data and associated instructions to manipulate the data into one package
  - easy to learn because its syntax is simple, hence easy to read
  - versatile
    -  can be used for web-development, machine learning, cloud administration 
  - popular
    - has many third-party packages that extend its functionality, especially for data science. 

## Using Python
There are four ways in which you can use Python. We will show you how to use all four ways, but we will mostly use Jupyter Notebook and Microsoft Visual Code. 

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