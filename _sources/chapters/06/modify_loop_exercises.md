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


# Modify Loop Exercises

## Exercise 1
Write a function that prints from 1 to n using a for loop, it should skip every multiple of 5. 

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def modify_loop_ex1(n):
    for number in range(n):

        if number % 5 == 0:
            print('Skipping:', number)
            continue

        print(number)

```

## Exercise 2
Write a function that prints from 1 to n squared using a while loop. It should stop the while loop if the iteration count is 50. 

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def modify_loop_ex2(n):

    iteration_count = 0
    number = 1
    while number <= n:

        if number == 50:
            break

        print(number)
        number += 1
        iteration_count += 1
```

## Exercise 3
Write a function that reads numbers from a file and prints their average. Skip empty lines. Use `modify_loop_ex3_data.txt`

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def modify_loop_ex3(filename):

    numbers = []
    with open(filename) as file:
        for line in file:
            if not line.strip():
                continue

            numbers.append(float(line))

    print(round(sum(numbers)/len(numbers),2))
```

