# Choosing which statements to execute

```Python
if some condition is True:
    do something
elif some other condition is True: # else if 
    do something
elif some other condition is True: # else if 
    do something
elif some other condition is True: # else if 
    do something
else:
    do something 
```
- colons are important and indentation matters
- can have many `elif` tests
- do not need `else`
- conditions can be nested

## Examples
| pH Level | Solution Category |
|----------|-------------------|
| 0-4      | Strong acid       |
| 5-6      | Weak acid         |
| 7        | Neutral           |
| 8-9      | Weak base         |
| 10-14    | Strong base       |

```python
ph = float(input('Enter the pH level: '))
if ph < 7.0:
    print(ph, " is acidic.") #indentation important
```

```python
ph = float(input('Enter the pH level: '))
if ph < 7.0:
    print(ph, " is acidic.")
    print('You should be careful with that!') #indentation is important
```


```python
ph = float(input('Enter the pH level: '))
if ph < 7.0:
    print(ph, " is acidic.") #indentation important

if ph > 7.0:
    print(ph, " is basic.") 
```

```python
ph = float(input('Enter the pH level: '))
if ph < 7.0:
    print(ph, " is acidic.") #indentation important
elif ph > 7.0:
    print(ph, " is basic.") 
```

```python
ph = float(input('Enter the pH level: '))
if ph < 7.0
    ph = 8.0 #indentation important
if ph > 7.0:
    print(ph, " is basic.") 
```

```python
ph = float(input('Enter the pH level: '))
if ph < 7.0:
    ph = 8.0  #indentation important
    print(ph, " is basic.") #
elif ph > 7.0:
    print(ph, " is basic.") 
```

```python
compound = input('Enter the compound: ')
if compound == 'H20':
    print('Water')
elif compound == 'NH3':
    print('Ammonia')
elif compound == 'CH4':
    print('Methane')
else:
    print('Unknown compound')
```


## Nested if statements
```python
value = input('Enter the pH level: ')
if len(value) > 0:
    ph = float(value) 
    if ph < 7.0:
        print(ph, " is acidic.")
    elif ph > 7.0:
        print(ph, " is basic.")
    else:
        print(ph, " is neutral.")

else:
    print('No pH value was given!')
```


```python
if age < 45:
    if bmi < 22.0:
        risk = 'low'
    else:
        risk = 'medium'
else:
    if bmi < 22.0:
        risk = 'medium'
    else:
        risk = 'high'

```

```python
young = age < 45
slim = bmi < 22.0
if young:
    if slim:
        risk = 'low'
    else:
        risk = 'medium'
else:
    if slim:
        risk = 'medium'
    else:
        risk = 'high'
```

```python
young = age < 45
slim = bmi < 22.0
if young and slim:
    risk = 'low'
elif young and not slim :
    risk = 'medium'
elif not young and slim:
    risk = 'medium'
elif not you and not slim:
    risk = 'high'
```

- What is wrong with the following code?
```python
ph = 2
if ph < 7.0:
    print(ph, ' is acidic')
elif ph < 3.0:
    print(ph, ' is VERY acidic! Be careful.')
```

- Given a number x, print FizzBuzz if it is a multiple of 5 and 7, Fizz if it is a multiple of 5, and Buzz if it is a multiple of 7. 


```python
# Implement the min() function for three inputs

def my_min():
  number1 = int(input('Enter first integer: '))
  number2 = int(input('Enter second integer: '))
  number3 = int(input('Enter third integer: '))

  minimum = number1  

  if number2 < minimum:
      minimum = number2

  if number3 < minimum:
      minimum = number3

  print('Minimum value is', minimum)
```


https://www.analyzemath.com/Equations/solve-quadratic-equations-using-discriminants.html