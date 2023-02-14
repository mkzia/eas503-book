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

- [Video Recording (29 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=cb166c4c-c070-4671-a522-afa9005b5668)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/06/for_loop_exercises.ipynb)




# For Loop Exercises

## Exercise 1
Write a function that takes in a list of values and returns its sum

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def sum_list(input_list):
    summed_values = 0
    for value in input_list:
        summed_values += value

    return summed_values


print(sum_list([1, 2, 3, 4]))
```

## Exercise 2
Write a function that takes in a list of values and returns its average

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def avg_list(input_list):
    summed_values = 0
    number_of_values = 0
    for value in input_list:
        summed_values += value
        number_of_values += 1

    return summed_values / number_of_values


print(avg_list([1, 2, 3, 4]))
```

## Exercise 3
Write a function that takes in a list of values and returns its average.
Instead of using a for loop as in ex2, use sum() and len() to calculate the average


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def avg_list(input_list):

    return sum(input_list) / len(input_list)

print(avg_list([1, 2, 3, 4]))
```

## Exercise 4
Write a function that multiplies the elements of the list by two and returns them

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def multiply(input_list):
    output = []

    for ele in input_list:
        output.append(ele * 2)

    return output


print(multiply([1, 2, 3, 4]))
```

## Exercise 5
Write a pow() function that computes the power of each element in a list

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def pow(input_list, power):
    output = []

    for ele in input_list:
        output.append(ele ** power)

    return output


print(pow([1, 2, 3, 4], 2))
print(pow([1, 2, 3, 4], 3))
```

## Exercise 6
Write a function to remove duplicate from a list

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def remove_duplicate(input_list):
    return list(set(input_list))


print(remove_duplicate([1, 2, 3, 4, 4, 5, 1]))
```

## Exercise 7
Write a function that reads grades from an input file and calculates their average
- input: filename
- use: for_ex7_data1.txt
- use: for_ex7_data2.txt
- use: for_ex7_data3.txt
- Use a list to read the values in to and then use sum and len to calculate the average.
- Be careful about empty rows!
- Be careful about non-numbers!

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def average_from_file(filename):
    grade_list = []
    with open(filename) as file:
        for line in file:
            if line.strip():
                try:
                    grade_list.append(float(line))
                except ValueError:
                    print('Bad value: ', line)

    return sum(grade_list) / len(grade_list)


print(average_from_file('for_ex7_data1.txt'))
```

## Exercise 8
Write a function that simulates a coin toss
- Input: number of simulation
- Output: a string that concatenates the results, ex. 'HHHTTTHTHTHT'


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def coin_toss(number):
    import random
    random.seed(503)
    output = ''
    for i in range(number):
        toss = random.randint(0, 1)

        if toss == 0:
            output += 'H'
        else:
            output += 'T'

    return output


print(coin_toss(10))
```

## Exercise 9
Write a function that uses the output from the 
coin_toss function and calculates the probability of H and T
- Input: number of simulation
- Output: probability of H and T

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def coin_toss(number):
    import random
    random.seed(503)
    output = ''
    for i in range(number):
        toss = random.randint(0, 1)

        if toss == 0:
            output += 'H'
        else:
            output += 'T'

    return output


def coin_toss_probability(number):
    result = coin_toss(number)
    head_count = 0
    tail_count = 0

    for ele in result:
        if ele == 'H':
            head_count += 1
        elif ele == 'T':
            tail_count += 1

    return (head_count / len(result), tail_count / len(result))


print(coin_toss_probability(100))
```

## Exercise 10
Write a function that simulates coin_toss_probability for a given number of times and calculates the average of H and T
- Input: number of simulations
- Input: number of coin tosses
- Output: average probability


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def simulate_coin_toss_probability(num_sims, num_toss):

    head_prob = 0
    tail_prob = 0

    for i in range(num_sims):
        h_prob, t_prob = coin_toss_probability(num_toss)
        head_prob += h_prob
        tail_prob += t_prob

    return (head_prob / num_sims, tail_prob / num_sims)


print(simulate_coin_toss_probability(10, 100))
```

## Exercise 11
Write a function that reads a file in which each line has multiple student
grades and calculates the student average grade
Print average of each student on screen
Use list comprehension to convert grades to int
use: for_ex11_data.txt

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def print_student_average(filename):

    with open(filename) as file:
        for line in file:
            student_name, *tests = line.split(',')
            tests = [int(ele) for ele in tests]
            print(student_name, sum(tests)/len(tests))

print_student_average('for_ex11_data.txt')

```

## Exercise 12
Write a function that generates a given number of students with a given number of grades and saves them to a file
inputs: output_filename, number_of_students, number_of_tests, test_score_range(low, high)
example output:
```text
student1,93,78,82,83,65
student2,86,76,85,86,65
student3,70,98,88,80,93
student4,89,68,81,80,76
student5,99,67,100,83,68
student6,75,77,69,72,76
student7,67,93,90,92,66
student8,89,83,90,97,91
student9,92,84,75,92,92
student10,65,89,80,68,89
```

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def generate_students(output_filename, number_of_students, number_of_tests, test_score_range):

    import csv
    import random

    number_of_students = 10
    number_of_tests = 5
    test_score_range = (65, 100)

    csvfile = csv.writer(open(output_filename, 'w'), delimiter=',')

    for i in range(1, number_of_students+1):
        line = []
        student_name = 'student' + str(i)
        line.append(student_name)
        for ii in range(number_of_tests):
            line.append(random.randint(test_score_range[0], test_score_range[1]))

        csvfile.writerow(line)

generate_students('testdata.txt', 10, 3, (65,100))
```