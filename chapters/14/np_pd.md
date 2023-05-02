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


# NumPy and Pandas operations


## iterrows -- iterate over rows
- iterate over the data row-wise. The first element is the index and second element is the row values

```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
for idx, row in df.iterrows():
    print(idx, row)
```

## iteritems -- iterate over columns


```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
for column_name, column in df.iteritems():
    print(column_name, column)
```


## Select subset of data
```python
header = ['exam1', 'exam2', 'exam3']
data = np.random.randint(65, 101, 12).reshape(4,3)
students = ['student1', 'student2', 'student3', 'student4']
df = pd.DataFrame(data=data, index=students, columns=header)

df.loc['student1', 'exam1']
df.loc[['student1', 'student3'], ['exam1', 'exam3']]
```

## Use conditions to select
```python
header = ['exam1', 'exam2', 'exam3']
data = np.random.randint(65, 101, 12).reshape(4,3)
students = ['student1', 'student2', 'student3', 'student4']
df = pd.DataFrame(data=data, index=students, columns=header)

df>=90
df[df>=90]
df['exam1']>=85 #   
df[df['exam1']>=85] # gives all columns where exam1 is greater than 85
df[df['exam1']>=85]['exam3'] 
df[df['exam1']>=85][['exam2', 'exam3']] 


df[(df['exam1']>=85) & (df['exam2']>=85)]
df[(df['exam1']>=85) & (df['exam2']>=85)]['exam3']

df[(df['exam1']>=85) | (df['exam2']>=85)]
df[(df['exam1']>=85) | (df['exam2']>=85)]['exam3']
```


## Adding student index
```python
header = ['exam1', 'exam2', 'exam3']
data = np.random.randint(65, 101, 12).reshape(4,3)
students = ['student1', 'student2', 'student3', 'student4']
df = pd.DataFrame(data=data, columns=header)
df['name'] = students

df.set_index('name', inplace=True)
df.loc['student1']
df.reset_index(inplace=True)
```

## Multi-index data
```python
students = 'student1 student1 student1 student2 student2 student2 student3 student3 student3'
exams = 'exam1 exam2 exam3'.split()*3
classes = 'class1 class2'
index = list(zip(students.split(), exams))
index = pd.MultiIndex.from_tuples(index)
df = pd.DataFrame(np.random.randint(65, 101, 3*3*2).reshape(9,2) , index, classes.split())
df.loc['student1'].loc['exam1']['class1'] 
df.index.names
df.index.names = ['Students', 'Exams']

## cross-section
df.xs('student1')
df.xs('exam1', level='Exams')
```


## Dealing with missing data


```python
my_dict = {'student1': [90, 84, np.nan], 'student2': [77, np.nan, np.nan], 'student3': [88, 65, 93]}
df = pd.DataFrame(my_dict)
df.dropna()
df.dropna(axis=0)
df.dropna(axis=1)

df.dropna(thresh=2)
df.fillna(value=55)

df.drop(axis=0, labels=[1,2]) 
df.drop(axis=1, columns=['student1']) 
```


## Groupby
```python
my_dict = {
    'Exams': 'exam1 exam1 exam1'.split() + 'exam2 exam2 exam2'.split() + 'exam3 exam3 exam3'.split(),
    'Students': 'student1 student2 student3'.split()*3,   
    'Scores': np.random.randint(65,101,9)
}
df = pd.DataFrame(my_dict)
df.groupby('Students').mean()
df.groupby('Students').mean().loc['student1']
df.groupby('Exams').max()['Scores']
df.groupby('Exams').describe() 
df.groupby('Students').describe().transpose() 
```

## Merging  -- SQL JOIN
```python
departments = { 
    'DepartmentId': [1, 2, 3, 4],
    'DepartmentName': ['IT', 'Physics', 'Arts', 'Math'] 
}

df1 = pd.DataFrame(departments)

students = {
    'StudentId': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    'StudentName': ['Michael', 'John', 'Jack', 'Sara', 'Sally', 'Jena', 'Nancy', 'Adam', 'Stevens', 'George'],
    'DepartmentId': [1, 1, 1, 2, 2, np.nan, 2, 3, 3, np.nan]
}

df2 = pd.DataFrame(students)

marks = {
    'MarkId': [1, 2, 3, 4, 5, 6, 7, 8],
    'StudentId': [1, 2, 3, 4, 5, 6, 7, 8], 
    'Mark': [18, 20, 16, 19, 14, 20, 20, 20]
}

df3 = pd.DataFrame(marks)

pd.merge(df2, df1, how='inner', on='DepartmentId')
pd.merge(df1, df2, how='inner', on='DepartmentId')
pd.merge(df1, df2, how='outer', on='DepartmentId')
pd.merge(df2, df1, how='right', on='DepartmentId') 

pd.merge(df3, pd.merge(df2, df1, how='inner', on='DepartmentId'), how='inner', on='StudentId')
data = pd.merge(df3, pd.merge(df2, df1, how='inner', on='DepartmentId'), how='inner', on='StudentId')

data[['StudentName', 'Mark', 'DepartmentName']] 

```
- ref: https://stackoverflow.com/a/48411543

## Concatenation
```python
d1 = {
    'C0': ['COR0', 'COR1', 'COR2'],
    'C1': ['C1R0', 'C1R1', 'C2R2'],
    'C2': ['C2R0', 'C2R1', 'C2R2'],
}

df1 = pd.DataFrame(d1)

d2 = {
    'C0': ['C0R3', 'C0R4', 'C0R5'],
    'C1': ['C1R3', 'C1R4', 'C1R5'],
    'C2': ['C2R3', 'C2R4', 'C2R5'],
}

df2 = pd.DataFrame(d2)

d3 = {
    'C0': ['C0R6', 'C0R7', 'C0R8'],
    'C1': ['C1R6', 'C1R7', 'C1R8'],
    'C2': ['C2R6', 'C2R7', 'C2R8'],
}

df3 = pd.DataFrame(d3)

pd.concat([df1, df2, df3])

## Concatenation -- Fix index

d1 = {
    'C0': ['COR0', 'COR1', 'COR2'],
    'C1': ['C1R0', 'C1R1', 'C2R2'],
    'C2': ['C2R0', 'C2R1', 'C2R2'],
}

df1 = pd.DataFrame(d1, index=[1, 2, 3])

d2 = {
    'C0': ['C0R3', 'C0R4', 'C0R5'],
    'C1': ['C1R3', 'C1R4', 'C1R5'],
    'C2': ['C2R3', 'C2R4', 'C2R5'],
}

df2 = pd.DataFrame(d2, index=[4, 5, 6])

d3 = {
    'C0': ['C0R6', 'C0R7', 'C0R8'],
    'C1': ['C1R6', 'C1R7', 'C1R8'],
    'C2': ['C2R6', 'C2R7', 'C2R8'],
}

df3 = pd.DataFrame(d3, index=[7, 8, 9])

pd.concat([df1, df2, df3])
```


## More Pandas Operations
```python
data['DepartmentName'].unique() 
data['DepartmentName'].nunique() 
data['DepartmentName'].value_counts()
data[data['Mark']>17]  
```

## Lambda with Pandas
- Scale marks by 5 
```python

def times5(val):
    return val * 5

data['Mark'].apply(times5)

data['Mark'].apply(lambda val: val*5)

```
- Upper all department names

```python
def upper(string):
    return string.upper()

data['DepartmentName'].apply(upper)

data['DepartmentName'].apply(lambda string: string.upper())
```
```python

mapping = {18: 'B', 14: 'C', 19: 'A-', 20: 'A+'}
df3['Mark'].map(mapping)     


```


## Dropping columns
```Python
data.columns
data.drop(['StudentId', 'MarkId' , 'DepartmentId'], axis=1)
```

## Sorting 
```Python
data.sort_values('Mark')
data.sort_values('Mark', ascending=False)
```


## Importing CSV, TSV
```python

data = pd.read_csv('students.tsv', sep='\t', names=['lastname', 'firstname', 'username', 'exam1', 'exam2', 'exam3']) 

data.sort_values('exam1', ascending=False) 

data[['exam1', 'exam2', 'exam3']].mean() 
data['average']= np.mean(data[['exam1', 'exam2', 'exam3']], axis=1) 
data.sort_values('average', ascending=False) 

data.to_csv('output.tsv', sep='\t', index=False, header=False)
```

## Other methods
```python
data.head()
data.head(2)

data.tail
data.tail(3)

data.shape
data.iloc[3] 
data.columns 
data.dtypes 
data.info()  
data.value_counts()
data.describe()  
```

## More data manipulation
```python
data[data['exam1'].between(75, 85)] 
data[data['exam1'].isin([75, 85, 95])]  
data['exam1'].unique() 
data['exam1'].nunique()
np.sort(data['exam1'].unique())
```

## Misc
- Iterate over the data frame
  - items: https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.items.html
  - iteritems: https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.iteritems.html
- Where: https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.where.html
- Plotting: https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.plot.html
- to_csv
- to_sql: https://datacarpentry.org/python-ecology-lesson/09-working-with-sql/index.html
## A Previous Example in Pandas
```python
import numpy as np
import pandas as pd


employees = {
    'EmployeeID': ['EN1-26', 'EN1-33', 'EN1-35', 'EN1-36', 'EN1-38', 'EN1-40'],
    'Last_Name': ["O'Brien", "Guya", "Baranco", "Roslyn", "Schaaf", "Wing"],
    'First_Name': ["Sean", "Amy", "Steven", "Elizabeth", "Carol", "Alexandra" ]
}

df_employees = pd.DataFrame(employees)

projects = {
    'ProjectNum': [
        "30-452-T3", 
        "30-457-T3", 
        "30-482-TC", 
        "31-124-T3", 
        "31-238-TC",
        "31-238-TC2",
        "35-152-TC",
        "36-272-TC"
    ],
    'ProjectTitle': [
        "STAR manual",
        "ISO procedures",
        "Web site",
        "Employee handbook",
        "STAR prototype",
        "New catalog",
        "STAR pricing",
        "Order system"
    ]
}


df_projects = pd.DataFrame(projects)

print(df_projects)

employees_projects = {
    'EmployeeID': [
        "EN1-26", 
        "EN1-26", 
        "EN1-26", 
        "EN1-33", 
        "EN1-33", 
        "EN1-33", 
        "EN1-35", 
        "EN1-35", 
        "EN1-36", 
        "EN1-38", 
        "EN1-40", 
        "EN1-40",
    ],
    'ProjectNum' : [
        "30-452-T3",
        "30-457-T3",
        "31-124-T3",
        "30-328-TC",
        "30-452-T3",
        "32-244-T3",
        "30-452-T3",
        "31-238-TC",
        "35-152-TC",
        "36-272-TC",
        "31-238-TC2",
        "31-241-TC",
    ]


}

df_employees_projects = pd.DataFrame(employees_projects)

data = pd.merge(pd.merge(df_employees_projects, df_employees, how='left', on='EmployeeID'), df_projects,  how='left', on='ProjectNum')
print(data)
```



## References
Ref: https://www.kaggle.com/shovitbhari/pandas-75-exercises-with-solutions
Ref: https://pythonspeed.com/memory/

