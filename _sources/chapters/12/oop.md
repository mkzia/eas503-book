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

# Object-Oriented Programming
- We know how to store various data in Python using various data types  
- We also know how to define functions that manipulate
or operate on that data. 
- Object-oriented programming allows us to define
the data and functions in one place.

## Comparison between Procedural and Object-oriented Programming
- Procedural programming:
  - We write a list of nouns (data)
  - We also have a separate list of verbs (functions)
  - We leave it up to the programmer to figure out which data goes with with function
- Object-oriented programming:
  - We define an object which contains both the nouns (data) and verbs (functions) that manipulate that data. 
  - Data --> Attribute
  - Function --> Method 


## Procedural Programming Example

```python
# function 
def average(numbers): 
  return sum(numbers) / len(numbers)

# data
scores = [80, 90, 95, 92 85]

# User has to know which data to pass into function
# to get desired output
print(f'The average score is {average(scores)}.')

```


## Object-Oriented Programming Example
- Define a new class that will contain both the
data and the function to manipulate it. 
- So put the scores list and the average function
inside a class

```{code-cell} ipython3
class ScoreList():
  def __init__(self, scores):
    self.scores = scores

  def average(self):
    return sum(self.scores) / len(self.scores)

scores = ScoreList([80, 90, 95, 92, 85]) 
print(f'The final score is {scores.average()}.')   
```

- No difference it the actual calculation, only that the
code is organized differently.

## Basic Building Blocks to defining a class
- `class` - keyword to indicate that you are creating/defining a class; example `class ScoreList`
- `__init__` - a method that is invoked automatically
when an instance of a class is created. Class is analogous to a blue print and an object is an instance
of a class with its own separate data from other objects (attributes/data), but shared functionality (methods/functions). 

## Benefits of OOP
- We can organize our code into distinct objects, so each object handles storing and manipulating the data. 
- We can create hierarchies of classes where each child
inherits from its parent class attributes and methods, reducing code repetition and improves code maintainability.


## Thoughts on OOP
- In Python everything is an object, which means every entity has some attributes and associated functionality called methods. This means that `str` and `dict` are classes that know how to store data and how to operate on them. 
- Do not overdo OOP. It is possible to create a very large object which then basically functions like a procedural system disguised as an object-oriented one. 


## Data Class Builders

### namedtuple

- Sometimes you want to build a class that simply contains data and no added functionality. For this, use use `namedtuple`

```{code-cell} ipython3
class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

p1 = Point(10, 10)
p2 = Point(10, 10)
print(p1)
print(p2)
print(p1 == p2)
print(p1 is p2)
```

```{code-cell} ipython3
from collections import namedtuple
Point = namedtuple('Point', 'x y')

p1 = Point(10, 10)
p2 = Point(10, 10)
print(p1)
print(p2)
print(p1 == p2)
print(p1 is p2)
```

- Right away we notice that a `namedtuple` provides a useful representation of the object. 

### Equality vs Reference

- `==` is for value equality
- `is` is for reference equality

```{code-cell} ipython3
x = {1: 2, 3:4}
y = x
print(x == y)
print(x is y)

x = {3:4, 1:2}
y = {1:2, 3:4}
print(x == y)
print(x is y)
```

### Passing in a mutable object to a class 
```{code-cell} ipython3
class ScoreList():
    def __init__(self, scores):
        self.scores = scores

    def average(self):
        return sum(self.scores) / len(self.scores)

l1 = [80, 90, 95, 92, 85]
scores = ScoreList(l1) 
print(f'The final score is {scores.average()}.') 
l1.pop()
print(f'The final score is {scores.average()}.')    
```



### __repr__ vs __str__
- `__repr__` - a method that returns a string containing
an object's printed representation. Its purpose is to unambiguous
- `__str__` - a method that also returns a string representation of an object, but it is supposed to be human readable. 
- `print()` will first try to use `__str__`. If that is not available, then it will use `__repr__`. That if that is not available, then it will use the parents `__repr__`. 

```{code-cell} ipython3
class a:
    def __init__(self, value):
        self.value = value
    
    def __repr__(self):
        return f'__repr__: {self.value}'
        
    def __str__(self):
        return f'__str__: {self.value}'

print(a(1))
a(1)
```

### NamedTuple

- You can also use the `NamedTuple` class to build a data class. The benefit is that you can overwrite default functions, for example `__str__. 

```{code-cell} ipython3
from typing import NamedTuple

class Point(NamedTuple):
    x: int
    y: int

    def __str__(self):
        return f'x: {self.x}; y: {self.y}'

p1 = Point(10, 10)
p2 = Point(10, 10)
print(p1)
print(p2)
print(p1 == p2)
print(p1 is p2)
```

- Equality is meaningful and now you control what is printed

:::{warning}
`namedtuple` and `NamedTuple` are immutable!
:::


### Dataclass

- A third way to build a data class is to use the `dataclass` operator

```{code-cell} ipython3
from dataclasses import dataclass

@dataclass
class Point:
    x: int
    y: int

    def __str__(self):
        return f'x: {self.x}; y: {self.y}'

p1 = Point(10, 10)
p2 = Point(10, 10)
print(p1)
print(p2)
print(p1 == p2)
print(p1 is p2)
```

```python
from dataclasses import dataclass

@dataclass
class InventoryItem:
    """Class for keeping track of an item in inventory."""
    name: str
    unit_price: float
    quantity_on_hand: int = 0

    def total_cost(self) -> float:
        return self.unit_price * self.quantity_on_hand

```

```python
class InventoryItem:
    def __init__(self, name: str, unit_price: float, quantity_on_hand: int = 0):
        self.name = name
        self.unit_price = unit_price
        self.quantity_on_hand = quantity_on_hand
```

:::{warning}
`dataclasses` are mutable by default. You can make them immutable by passing in an optional argument, `@dataclass(frozen=True)`
:::

## Getting data as a dict


```{code-cell} ipython3
from collections import namedtuple
from typing import NamedTuple
from dataclasses import dataclass


Pointnamedtuple = namedtuple('Point', 'x y')


class PointNamedTuple(NamedTuple):
    x: int
    y: int

    def __str__(self):
        return f'x: {self.x}; y: {self.y}'

@dataclass
class Pointdataclass:
    x: int
    y: int

    def __str__(self):
        return f'x: {self.x}; y: {self.y}'

p1 = Pointnamedtuple(10, 12)
p2 = PointNamedTuple(10, 12)
p3 = Pointdataclass(10, 12)
print(p1._asdict())
print(p2._asdict())
print(dataclasses.asdict(p3))

```

## Replacing values in an immutable data class

- Returns a new object

```{code-cell} ipython3
from collections import namedtuple
from typing import NamedTuple
from dataclasses import dataclass


Pointnamedtuple = namedtuple('Point', 'x y')


class PointNamedTuple(NamedTuple):
    x: int
    y: int

    def __str__(self):
        return f'x: {self.x}; y: {self.y}'

@dataclass
class Pointdataclass:
    x: int
    y: int

    def __str__(self):
        return f'x: {self.x}; y: {self.y}'

p1 = Pointnamedtuple(10, 12)
p2 = PointNamedTuple(10, 12)
p3 = Pointdataclass(10, 12)
print(p1._replace(x=5))
print(p2._replace(x=5))
print(dataclasses.replace(p3, x=5))
```


## Default values in data classes

```{code-cell} ipython3
from collections import namedtuple
from typing import NamedTuple
from dataclasses import dataclass


Pointnamedtuple = namedtuple('Point', 'x y', defaults=[5, 10])


class PointNamedTuple(NamedTuple):
    x: int = 5
    y: int = 10

    def __str__(self):
        return f'x: {self.x}; y: {self.y}'

@dataclass
class Pointdataclass:
    x: int = 5
    y: int = 10

    def __str__(self):
        return f'x: {self.x}; y: {self.y}'

p1 = Pointnamedtuple()
p2 = PointNamedTuple()
p3 = Pointdataclass()
print(p1)
print(p2)
print(p3)
```

- The order of defaults in `namedtuple` is flipped!

```{code-cell} ipython3
Point = namedtuple('Point', 'x y', defaults=[5])
p1 = Point(1)
print(p1)
```


:::{warning}
If you are using lots of data classes and have processing logic elsewhere, then you should probably not use a dataclass and put the processing logic and data together. 
:::



## Examples

```python
class Person:
    def __init__(self, first_name, last_name, email):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
```

```python
class Person:
    def __init__(self, first_name, last_name, email):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email

    def __repr__(self):
        return f'{self.first_name} {self.last_name}'
```

```python
class Person:
    def __init__(self, first_name, last_name, email):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email

    def __repr__(self):
        return f'{self.first_name} {self.last_name}'

    def get_email(self):
        return self.email

    def get_full_name(self):
        return f'{self.last_name}, {self.first_name}'
```

```python
class Student(Person):

    def __init__(self, first_name, last_name, email, program):
        super().__init__(first_name, last_name, email)
        self.program = program

class Student(Person):
    PROGRAMS = ['graduate', 'undergraduate']

    def __init__(self, first_name, last_name, email, program):
        super().__init__(first_name, last_name, email)
        if program.lower() not in self.PROGRAMS:
            raise ValueError('program can only be "graduate" or "undergraduate"')
        self.program = program.lower()
        self.classes = []


    def enroll(self, name_of_course):
        self.classes.append(name_of_course)

    def print_classes(self):
        classes = ', '.join(self.classes)
        print(f'{classes}')

s1 = Student('john', 'doe', 'jdoe@example.edu', 'gradUate')
print(s1)
s1.enroll('abc')
s1.enroll('abc')
s1.enroll('efg')
s1.enroll('hij')
s1.print_classes()
```

- `super()` - used to invoke parent class's methods


```python
class Student(Person):
    PROGRAMS = ['graduate', 'undergraduate']

    def __init__(self, first_name, last_name, email, program):
        super().__init__(first_name, last_name, email)
        if program.lower() not in self.PROGRAMS:
            raise ValueError('program can only be "graduate" or "undergraduate"')
        self.program = program
        self.classes = []


    def enroll(self, name_of_course):
        if name_of_course not in self.classes:
            self.classes.append(name_of_course)
        else:
            print(f'Already enrolled in {name_of_course} {self.get_full_name()}!')

    def print_classes(self):
        classes = ', '.join(self.classes)
        print(f'{classes}')

    def print_self(self):
        print(self)

s1 = Student('john', 'doe', 'jdoe@example.edu', 'graduate')
print(s1)
s1.enroll('abc')
s1.enroll('abc')
s1.enroll('efg')
s1.enroll('hij')
s1.print_classes()

```

```python
class Course:
    def __init__(self, course_name, credits):
        self.course_name = course_name
        self.credits = credits

    def __repr__(self):
        return f'{self.course_name}'


    def get_course_name(self):
        return self.course_name



class Student(Person):
    PROGRAMS = ['graduate', 'undergraduate']

    def __init__(self, first_name, last_name, email, program):
        super().__init__(first_name, last_name, email)
        if program.lower() not in self.PROGRAMS:
            raise ValueError('program can only be "graduate" or "undergraduate"')
        self.program = program
        self.classes = []


    def enroll(self, course):
        if course not in self.classes:
            self.classes.append(course)
        else:
            print(f'Already enrolled in {course}!')

    def print_classes(self):
        classes = ', '.join(sorted([i.course_name for i in self.classes]))
        print(f'{classes}')

c1 = Course('Math', 3)
c2 = Course('Physics', 4)
c3 = Course('Chemistry', 3)
c4 = Course('English', 3)

s1 = Student('john', 'doe', 'jdoe@example.edu', 'graduate')
print(s1)
s1.enroll(c1)
s1.enroll(c2)
s1.enroll(c3)
s1.enroll(c3)
s1.print_classes()
```

```python
class Student(Person):
    PROGRAMS = ['graduate', 'undergraduate']
    MAX_CREDITS = 9

    def __init__(self, first_name, last_name, email, program):
        super().__init__(first_name, last_name, email)
        if program.lower() not in self.PROGRAMS:
            raise ValueError('program can only be "graduate" or "undergraduate"')
        self.program = program
        self.classes = []
        self.enrolled_credits = 0

    def enroll(self, course):
        if self.enrolled_credits < self.MAX_CREDITS:
            self.classes.append(course)
            self.enrolled_credits += course.credits
        else:
            print('Cannot enroll')
        if self.get_total_credits() + course.credits > self.MAX_CREDITS:
            print(f'You will be over the max credits! Cannot add {course}.')
            return

        if course not in self.classes:
            self.classes.append(course)
        else:
            print(f'Already enrolled in {course}!')

    def print_classes(self):
        classes = ', '.join(sorted([i.course_name for i in self.classes]))
        print(f'{classes}')


    def get_total_credits(self):
        total_credits = 0
        for ele in self.classes:
            total_credits += ele.credits
        return total_credits

class Course:
    def __init__(self, course_name, credits):
        self.course_name = course_name
        self.credits = credits

    def __repr__(self):
        return f'{self.course_name}'

    def __str__(self):
        return f'{self.course_name}'


    def get_course_name(self):
        return self.course_name


c1 = Course('Math', 3)
c2 = Course('Physics', 4)
c3 = Course('Chemistry', 3)
c4 = Course('English', 3)

s1 = Student('john', 'doe', 'jdoe@example.edu', 'graduate')
print(s1)
s1.enroll(c1)
s1.enroll(c1)
s1.enroll(c3)
s1.enroll(c4)
s1.enroll(c2)
s1.print_classes()
```

:::{note}
first name --> first_name (variables and Functions)
first_name --> FirstName (classes)
:::

### Exercise 1
Modify enroll to accept multiple classes!

```python
class Student(Person):
    PROGRAMS = ['undergraduate', 'graduate']
    MAX_CREDITS = 12
    
    def __init__(self, first_name, last_name, email, program):
        if program.lower() not in self.PROGRAMS:
            raise ValueError(f'Programs can only be {self.PROGRAMS}. You entered: {program}.')
        
        super().__init__(first_name, last_name, email)
        self.program = program.title()
        self.courses = []
        self.total_credits = 0
   
    def __repr__(self):
        return f'{self.first_name} {self.last_name}; {self.program}'
    
    def enroll(self, *courses):
        for course in courses:
            if (self.total_credits + course.credits) > self.MAX_CREDITS:
                print('This will put you above 16 Credits')
                return       
            if course not in self.courses:
                self.courses.append(course)
                print(self.courses[-1].course_name)
                print(self.courses[-1].credits)

                self.total_credits += course.credits
            else:
                print(f'Already enrolled in {class_name} ')
        
    def print_classes(self):
        print(', '.join([ele.course_name for ele in self.courses]))
```
### Exercise 2
Write a Beverage class whose instances will
represent beverages. Each beverage should have 
two attributes: a name (describing the beverage)
and a temperature. Create several beverages and 
check that their names and temperatures are all
handled correctly.

```python
class Beverage:
    def __init__(self, name, temp):
        self.name = name
        self.temp = temp
        
    def __repr__(self):
        return f'{self.name}: {self.temp}'
        
b1 = Beverage('Coke', 60)
b2 = Beverage('Pepsi', 50)
b3 = Beverage('7up', 40)

beverages = [b1, b2, b3]
for beverage in beverages:
    print(beverage)
```

### Exercise 3

Modify the Beverage class, such that you can create 
a new instance specifying the name, 
and not the temperature. 
If you do this, then the temperature should 
have a default value of 75 degrees Celsius. 
Create several beverages and double-check 
that the temperature has this default when 
not specified.

```python
class Beverage:
    def __init__(self, name, temp=75):
        self.name = name
        self.temp = temp
        
    def __repr__(self):
        return f'{self.name}: {self.temp}'
        
b1 = Beverage('Coke', 60)
b2 = Beverage('Pepsi')
b3 = Beverage('7up', 40)

beverages = [b1, b2, b3]
for beverage in beverages:
    print(beverage)
```

### Exercise 4

Create a new LogFile class that expects to 
be initialized with a filename. 
Inside of `__init__`, open the file for 
writing and assign it to an attribute, file, 
that sits on the instance. Check that it’s 
possible to write to the file via the file attribute.

```python
class Logfile:
    def __init__(self, filename):
        self.filename = filename
        self.file = None
        
    def open_file(self):
        self.file = open(self.filename, 'w')
        
    def write_row(self, row):
        self.file.write(f'{row.strip()}\n')
        
    def close_file(self):
        self.file.close()
        

        
l1 = Logfile('log1.txt')
l1.open_file()

for row in ['abc', 'efg', 'hij']:
    l1.write_row(row)
    
l1.close_file()

l2 = Logfile('log2.txt')
l2.open_file()

for row in ['ABC', 'EFG', 'DHIJ']:
    l2.write_row(row)
    
l2.close_file()
```

### Exercise 5

```python
class Person:
    def __init__(self, first_name, last_name):
        self.first_name = first_name
        self.last_name = last_name

    def __repr__(self):
        return f'{self.first_name} {self.last_name}; {self.get_gpa()}'

class Student(Person):
    def __init__(self, first_name, last_name, credit_hours, q_point):
        super().__init__(first_name, last_name)
        self.credit_hours = credit_hours
        self.q_point = q_point
        

    def get_gpa(self):
        return round(self.q_point / self.credit_hours, 2)
    
    
filename = 'data.tsv'

students = []

with open(filename) as file:
    for line in file:
        if not line.strip():
            continue
        
        name, credits, q_points = line.strip().split('\t')
        last_name, first_name = name.split(',')
        first_name = first_name.strip()
        
        student = Student(first_name, last_name, int(credits), int(q_points))
        students.append(student)
```

## Payroll system using polymorphism
- Employee -- Abstract
    - variables (properties)
        - lastname
        - firstname
        - social_security_number
    - functions (methods)
        - __repr__ -- 
        - earnings() -- 
- SalariedEmployee -- inherits from Employee
- CommissionEmployee -- inherits from Employee
- HourlyEmployee -- inherits from Employee
- BasePlusCommissionEmployee -- inherits from CommissionEmployee

- Demonstrate polymorphism


### Exercise 

```python
# Java How to Program Deitel et. al

from abc import ABC, abstractmethod


class Employee(ABC):

    def __init__(self, first_name, last_name, ssn):
        self.first_name = first_name
        self.last_name = last_name
        self.ssn = ssn

    @abstractmethod
    def earnings(self):
        pass

    def __repr__(self):
        return f'{self.first_name} {self.last_name}\nsocial security: {self.ssn}'


class SalariedEmployee(Employee):
    def __init__(self, first_name, last_name, ssn, salary):
        super().__init__(first_name, last_name, ssn)
        self.weekly_salary = salary

    def earnings(self):
        return self.weekly_salary

    def __repr__(self):
        return f'salaried employee: {super().__repr__()}\nweekly salary: ${self.weekly_salary}'


class HourlyEmployee(Employee):
    def __init__(self, first_name, last_name, ssn, hourly_wage, hours_worked):
        super().__init__(first_name, last_name, ssn)
        self.hourly_wage = hourly_wage
        self.hours_worked = hours_worked

    def earnings(self):
        if self.hours_worked < 40:  # no overtime
            earned = self.hourly_wage * self.hours_worked
        else:
            earned = 40 * self.hourly_wage + \
                (self.hours_worked - 40) * self.hourly_wage * 1.5

        return earned

    def __repr__(self):
        return f'hourly employee: {super().__repr__()}\nhourly wage: ${self.hourly_wage}; hours worked: {self.hours_worked}'


class CommissionEmployee(Employee):
    def __init__(self, first_name, last_name, ssn, sales, rate):
        super().__init__(first_name, last_name, ssn)
        self.sales = sales
        self.rate = rate

    def earnings(self):
        earned = self.sales * self.rate
        return earned

    def __repr__(self):
        return f'commission employee: {super().__repr__()}\ngross sales: ${self.sales}; commission rate: {self.rate}'


class BasePlusCommissionEmployee(CommissionEmployee):
    def __init__(self, first_name, last_name, ssn, sales, rate, salary):
        super().__init__(first_name, last_name, ssn, sales, rate)
        self.salary = salary

    def earnings(self):
        earned = self.salary + super().earnings()
        return earned

    def __repr__(self):
        return f'base-salaried {super().__repr__()}; base-salary: ${self.salary}'


print('Employees processed individually:\n')
salaried_employee = SalariedEmployee('John', 'Smith', '111-11-1111', 800)
print(salaried_employee)
print(f'earned: ${salaried_employee.earnings()}')

print()
hourly_employee = HourlyEmployee('Karen', 'Price', '222-22-2222', 16.75, 40)
print(hourly_employee)
print(f'earned: ${hourly_employee.earnings()}')

print()
commission_employee = CommissionEmployee('Sue', 'Jones', '333-33-3333', 10000, 0.06)
print(commission_employee)
print(f'earned: ${commission_employee.earnings()}')


print()
base_plus_commission_employee = BasePlusCommissionEmployee('Bob', 'Lewis', '444-44-4444', 5000, 0.04, 300)
print(base_plus_commission_employee)
print(f'earned: ${base_plus_commission_employee.earnings()}')


employees = [salaried_employee, hourly_employee,
             commission_employee, base_plus_commission_employee]

for employee in employees:
    print()
    print(employee)
    if employee.__class__.__name__ == 'BasePlusCommissionEmployee':
        employee.salary = 1.10 * employee.salary
        print(f'new base salary with 10% increase is {employee.salary}')
    print(f'earned: ${employee.earnings()}')

```

## Operator overloading
- We know how to create objects. Now we will learn how to define what +, -, or lte means for an object
- add
- gt
- lt
- eq
- iterators https://www.programiz.com/python-programming/iterator
- generators https://www.programiz.com/python-programming/generator

### Basic Class

```{code-cell} ipython3
import math
class Circle:

    def __init__(self, radius):
        self.radius = radius

    def get_area(self):
        return math.pi * self.radius**2


    def __repr__(self):
        return "Circle with radius " + str(self.radius)
    def __str__(self):
        return "Circle with radius " + str(self.radius)

c1 = Circle(10)
c2 = Circle(5)

print(c1)
print(c2)
print(c2.get_area())
```


### Adding Add


```{code-cell} ipython3
class Circle:

    def __init__(self, radius):
        self.radius = radius

    def get_area(self):
        return math.pi * self.radius**2

    def __str__(self):
        return "Circle with radius " + str(self.radius)

    def __add__(self, another_circle):
        return Circle(self.radius + another_circle.radius)


c1 = Circle(10)
c2 = Circle(5)
c3 = c1 + c2 ### ==> c1.__add__(c2) ==> Circle.__add__(c1, c2)
print(c3)


class Circle:

    def __init__(self, radius):
        self.radius = radius

    def get_area(self):
        return math.pi * self.radius**2

    def __str__(self):
        return "Circle with radius " + str(self.radius)

    def __add__(self, another_circle):
        return Circle(self.radius + another_circle.radius)

    def __gt__(self, another_circle):
        return self.radius > another_circle.radius

    def __lt__(self, another_circle):
        return self.radius < another_circle.radius



c1 = Circle(10)
c2 = Circle(5)
print(c1 < c2)



class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def __add__(self, another_point):
        return Point(self.x + another_point.x, self.y + another_point.y)

    def __sub__(self, another_point):
        return Point(self.x - another_point.x, self.y - another_point.y)

    def __str__(self):
        return f'{self.x}, {self.y}'

p1 = Point(3, 4)
p2 = Point(8, 6)
print(p2+p1)

import math
class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def __add__(self, another_point):
        return Point(self.x + another_point.x, self.y + another_point.y)

    def __sub__(self, another_point):
        return Point(self.x - another_point.x, self.y - another_point.y)

    def length(self):
        return math.sqrt(self.x**2 + self.y**2)

    def distance(self, another_point):
        return (self - another_point).length()

    def __str__(self):
        return f'{self.x}, {self.y}'

p1 = Point(3, 4)
p2 = Point(8, 6)
print(p1.distance(p2))
```

### Iterator Class

```python
class MyRange:

    def __init__(self, limit):
        self.limit = limit

    def __iter__(self):
        self.value = 0
        return self

    def __next__(self):
        if self.value < self.limit:
            output = self.value
            self.value += 1
            return output
        else:
            raise StopIteration


i = iter(MyRange(10))
next(i)
for ele in MyRange(10):
    print(ele)


class PowX:
    def __init__(self, limit, power):
        self.limit = limit
        self.power = power

    def __iter__(self):
        self.value = 0
        return self

    def __next__(self):
        if self.value < self.limit:
            output = self.value**self.power
            self.value += 1
            return output
        else:
            raise StopIteration


for ele in PowX(10, 3):
    print(ele)


## lets use generator

def PowX(limit, power):
    value = 0
    while value < limit:
        yield value**power
        value += 1

for ele in PowX(10, 3):
    print(ele)

new_list = []
for number in numbers:

    if number % 2 == 0
        new_list.append(number)
        I am here!!
```


## Self
- `self` is a reference to an instance of a class. You can use `self` to access attributes and methods bound to an instance.
- class variable vs instance variable (https://www.digitalocean.com/community/tutorials/understanding-class-and-instance-variables-in-python-3)
- staticmethods vs class methods

```python
class TestClass:
    class_variable = 1 # Belongs to the class. Shared by all instances



t1 = TestClass()
t2 = TestClass()


print('\nPrint class_variable')
print('t1.class_variable: ', t1.class_variable)
print('t2.class_variable: ', t2.class_variable)


print('\nChange class_variable in class definition and print class_variable')
TestClass.class_variable = 2
print('t1.class_variable: ', t1.class_variable)
print('t2.class_variable: ', t2.class_variable)


print('\nChange class_variable in instance t1 and print class_variable')
t1.class_variable = 3
print('t1.class_variable: ', t1.class_variable)
print('t2.class_variable: ', t2.class_variable)


print('\nChange class_variable in instance t2 and print class_variable')
t2.class_variable = 4
print('t1.class_variable: ', t1.class_variable)
print('t2.class_variable: ', t2.class_variable)


print('\n', '-'*60, '\n')

class TestClass:
    class_variable = 1 # Belongs to the class. Shared by all instances

    def __init__(self, instance_variable):
        self.instance_variable = instance_variable


t1 = TestClass(1)
t2 = TestClass(2)


print('\nPrint class_variable')
print('t1.class_variable: ', t1.class_variable)
print('t2.class_variable: ', t2.class_variable)

print('\nPrint instance_variable')
print('t1.instance_variable: ', t1.instance_variable)
print('t2.instance_variable: ', t2.instance_variable)


print('\nChange class_variable in class definition and print class_variable')
TestClass.class_variable = 2
print('t1.class_variable: ', t1.class_variable)
print('t1.class_variable: ', t2.class_variable)


print('\nChange instance_variable for t1 and print instance_variable')
t1.instance_variable = 10
print('t1.instance_variable: ', t1.instance_variable)
print('t2.instance_variable: ', t2.instance_variable)

print('\nChange instance_variable for t2 and print instance_variable')
t2.instance_variable = 20
print('t1.instance_variable: ', t1.instance_variable)
print('t2.instance_variable: ', t2.instance_variable)


print('\nChange class_variable in instance t1 and print class_variable')
t1.class_variable = 3
print('t1.class_variable: ', t1.class_variable)
print('t2.class_variable: ', t2.class_variable)


print('\nChange class_variable in instance t2 and print class_variable')
t2.class_variable = 4
print('t1.class_variable: ', t1.class_variable)
print('t2.class_variable: ', t2.class_variable)



print('\n', '-'*60, '\n')


class TestClass:
    class_variable = 1

    # @staticmethod are bound to class rather than object. Therefore, to use them, you do not have
    # to instantiate an object.
    # NOTE: staticmethods do no have access to class properties (variables or methods).
    # This means they cannot access class_variable.
    # Such methods are used when you do not want subclasses to change/overwrite a specific method.

    @staticmethod
    def add(number1, number2):
        return number1 + number2


print('@staticmethod add: ', TestClass.add(3,4))


class TestClass2:
    class_variable = 1

    # @staticmethod are bound to class rather than object. Therefore, to use them, you do not have
    # to instantiate an object.
    # NOTE: staticmethods do no have access to class properties (variables or methods).
    # This means they cannot access class_variable.
    # Such methods are used when you do not want subclasses to change/overwrite a specific method.

    @staticmethod
    def add(number1, number2):
        return number1 + number2# + class_variable

print('@staticmethod add: ', TestClass2.add(3,4))
print('\n', '-'*60, '\n')

class TestClass:
    class_variable = 1

    # @classmethod are bound to class rather than object. Therefore, to use them, you do not have
    # to instantiate an object.
    # NOTE: Unlike staticmethods, classmethods do have access to class properties (variables or methods).
    # This means they can access class_variable.

    @classmethod
    def add(cls, number1, number2):
        return number1 + number2
print('@classmethod add: ', TestClass.add(5,6))



class TestClass2:
    class_variable = 1

    # @classmethod are bound to class rather than object. Therefore, to use them, you do not have
    # to instantiate an object.
    # NOTE: Unlike staticmethods, classmethods do have access to class properties (variables or methods).
    # This means they can access class_variable.

    @classmethod
    def add(cls, number1, number2):
        return number1 + number2 + cls.class_variable

print('@classmethod add -- access to class variable: ', TestClass2.add(5,6))


print('\n', '-'*60, '\n')


class TestClass:
    class_variable = 1

    @staticmethod
    def add_static(number1, number2):
        return number1 + number2

    @classmethod
    def add_class(cls, number1, number2):
        return number1 + number2 + cls.class_variable


    def add_object(self, number1, number2):
        return number1 + number2 + self.class_variable + 29


print('add_static: ', TestClass.add_static(13,14))
print('add_class: ', TestClass.add_class(13,14))


t1 = TestClass()

print('Call from class -- add_object: ', TestClass.add_object(t1, 13, 14))
print('Call from object -- add_object: ', t1.add_object(13, 14))
```

## Item assignment
```python
class MyClass:
    def __init__(self, **kwargs):
        self.data = {}
              
    def __setitem__(self, key, value):
        self.data[key] = value
        
    def __getitem__(self, key):
        return self.data[key]      
```   
- add functionality pass in multiple data; with and wihtout header   
- add functionality to select multiple columns
- add functionality to add two columns  
- add functionality to take a mean of a column(s)  
- add functionality to select rows   
- add functionality slicing!