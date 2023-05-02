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


# Methods for Selecting Data

## Method 1 -- Square brackets

### Method 1.1 -- index/text -- #column wise
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df['StudentName'])  
```

### Method 1.2 -- list, NOT TUPLE # row wise
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df[['StudentName', 'E1']]) 
```


### Method 1.3 -- a slice  # row wise
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df[1:5])
```

### Method 1.4?? -- slice and list?
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df[1:5, ['E1', 'E2']])
```


### Method 1.5?? -- slice and slice?
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df[1:5, 1:5])
```

## Method 2 -- .iloc
- It uses square braces [] and not () 
- It uses numerical index

### Method 2.1 -- index only!!! Cannot index by location index with a non-integer key
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df.iloc[0])
```


### Method 2.2 -- list
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df.iloc[[0, 1, 2]])
```

### Method 2.3 -- list and slice
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df.iloc[[0, 1, 2], :])
```


### Method 2.4 -- list and list
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df.iloc[[0, 1, 2], [0, 1]])
```


### Method 2.5 -- slice
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df.iloc[0:3])
```


### Method 2.6 -- slice and list
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df.iloc[:, [1, 2]])
```


### Method 2.7 -- sliceS
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df.iloc[0:3, 1:3])
```


## Method 3 -- .loc 
- If you didnot specify the index, then numbers are used!

### Method 3.1 -- index # row-wise
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
display(df.loc[3])
```


### Method 3.2 -- txt # row-wise
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
df.set_index(df['StudentName'], inplace=True) 
display(df.loc['student4'])
```


### Method 3.3 -- list
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
df.set_index(df['StudentName'], inplace=True) 
display(df.loc[['student4', 'student1']])
```


### Method 3.4 -- listS
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
df.set_index(df['StudentName'], inplace=True) 
display(df.loc[['student4', 'student1'], ['E1', 'E2']])
```


### Method 3.5 -- slice and list
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
df.set_index(df['StudentName'], inplace=True) 
display(df.loc[:, ['E1', 'E2']])
```

### Method 3.6 -- list and Slice
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
df.set_index(df['StudentName'], inplace=True) 
display(df.loc[['student1', 'student2'], :])
```


### Method 3.7 -- slice and Slice
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
df.set_index(df['StudentName'], inplace=True) 
display(df.loc['student1':'student5', :])
```

### Method 3.8 -- slice
```{code-cell} ipython3
import pandas as pd
columns = ('StudentName', 'E1', 'E2', 'E3', 'E4','E5')
df = pd.DataFrame(data=[ele.strip().split(',') for ele in open('testdata_1.txt')], columns=columns)
df.set_index(df['StudentName'], inplace=True) 
display(df.loc['student1':'student5'])
```

