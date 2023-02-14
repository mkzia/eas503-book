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

- [Video Recording (6 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=c9cb67cd-f676-4dcc-9908-afa9005c269c)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/06/while_loop_exercises.ipynb)


# While Loop Exercises

## Exercise 1
Write a program that takes integers from the user and returns the average. Use a while loop and make an empty string the stop criteria.

```{code-cell} ipython3
:tags: ["hide-input",  "remove-output", "output_scroll"]
summed_values = 0  # a container to store the sum of interger values collected
number_count = 0  # a container to store the number of integer values collected

input_string = input('Enter an integer. Enter nothing to quit: ')

while input_string:
    summed_values += int(input_string)
    number_count += 1
    input_string = input('Enter an integer. Enter nothing to quit: ')


average = summed_values / number_count

print('The average of %d numbers is %f' %(number_count, summed_values))

```


## Exercise 2
Write a program that takes integers from the user and returns the average. Use a while loop and make negative number the stop criteria.

```{code-cell} ipython3
:tags: ["hide-input",  "remove-output", "output_scroll"]
summed_values = 0  # a container to store the sum of interger values collected
number_count = 0  # a container to store the number of integer values collected

number = int(input('Enter an integer. Enter negative number to quit: '))

while number >=0:
    summed_values += int(number)
    number_count += 1
    number = int(input('Enter an integer. Enter nothing to quit: '))


average = summed_values / number_count

print('The average of %d numbers is %f' %(number_count, summed_values))
```

## Exercise 3
Write a program that takes test grades from the user and returns their average and the letter grade of the average.Use a while loop and make negative number the stop criteria.
A >=90
B 80-89
C 70-79
D 60-69
F 59 or less


```{code-cell} ipython3
:tags: ["hide-input",  "remove-output", "output_scroll"]
test_grades = 0  # a container to store the sum of interger values collected
number_tests = 0  # a container to store the number of integer values collected

number = int(input('Enter a test grade. Enter negative number to quit: '))

while number >=0:
    test_grades += int(number)
    number_tests += 1
    number = int(input('Enter a test grade. Enter negative number to quit: '))


average = test_grades / number_tests


if   90 <= average:
    letter_grade = 'A'
elif 80 <= average <= 89:
    letter_grade = 'B'
elif 70 <= average <= 79:
    letter_grade = 'C'
elif 60 <= average <= 69:
    letter_grade = 'D'
elif 60 >= average:
    letter_grade = 'F'


print(average, letter_grade)

```

## Exercise 4
Write a program that takes an integer and counts down to zero -- print the value

```{code-cell} ipython3
:tags: ["hide-input",  "remove-output", "output_scroll"]
number = int(input('Enter a starting number: '))

while number >= 0:
    print(number)
    number -= 1
```

## Exercise 5
# Write a program that takes an integer number and outputs all the even numbers starting from 0 to the number

```{code-cell} ipython3
:tags: ["hide-input",  "remove-output", "output_scroll"]
end_number = int(input('Enter an integer number: '))
current_number = 0
while current_number <= end_number:
    if current_number % 2 == 0:
        print(current_number)
    current_number += 1

```