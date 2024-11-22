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

# Cross-referenced Exercises

## Query Primer

### Basic query

SQL cross-reference: {ref}`sql:primer:basic`

```{code-cell} ipython3
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
df
```

### Limit rows

SQL cross-reference: {ref}`sql:primer:limit_rows`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')

# Get first 10 rows
display(df.head(10))

# Get last 10 row
display(df.tail(10))

# Get rows between range
display(df[50:60])
```

### Select some columns

SQL cross-reference: {ref}`sql:primer:select_some_columns`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')

df[['PatientID', 'PatientDateOfBirth']].head(10)
```

### Using column alias

SQL cross-reference: {ref}`sql:primer:using_column_alias`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')

df[['PatientID', 'PatientDateOfBirth']].rename(columns={'PatientDateOfBirth': 'Date of Birth'}).head(10)
```

### Adding columns not from the table

SQL cross-reference: {ref}`sql:primer:adding_column`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
df_new = df[['PatientID', 'PatientPopulationPercentageBelowPoverty']].copy()
df_new.rename(
    columns={
        'PatientID': 'PTID',
        'PatientPopulationPercentageBelowPoverty': 'Poverty Level'
    },
    inplace=True
)
df_new.insert(loc=1, column='Hospital', value='Buffalo Hospital')
df_new['Poverty Level'] = df_new['Poverty Level'] * 10
df_new.head(10)
```

### Removing duplicates

SQL cross-reference: {ref}`sql:primer:removing_duplicates`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
pd.DataFrame(df['PatientMaritalStatus'].unique(), columns=['PatientMaritalStatus'])
```

### Removing duplicates with multiple columns

SQL cross-reference: {ref}`sql:primer:removing_duplicates_2`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
df[['PatientRace', 'PatientMaritalStatus']].drop_duplicates().sort_values(['PatientRace', 'PatientMaritalStatus']).reset_index(drop=True)
```

### Derived table

SQL cross-reference: {ref}`sql:primer:derived_table`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'AdmissionsDiagnosesCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
pd.DataFrame(df[['PrimaryDiagnosisCode', 'PrimaryDiagnosisDescription']].apply(lambda row: f'({row[0]}) {row[1]}', axis=1), columns=['CodeWDescription'])

```

### Filtering Data

SQL cross-reference: {ref}`sql:primer:where_clause`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
mask = (
    (((df['PatientRace'] == 'White') & (df['PatientMaritalStatus'] == 'Married')) |
    ((df['PatientRace'] == 'African American') & (df['PatientMaritalStatus'] == 'Married'))) &
    (df['PatientPopulationPercentageBelowPoverty'] > 15)
)
df_new = df[mask][['PatientID', 'PatientRace', 'PatientMaritalStatus', 'PatientPopulationPercentageBelowPoverty']].reset_index(drop=True)
df_new
```

```python
df.query("((PatientRace == 'White' & PatientMaritalStatus == 'Married') | (PatientRace == 'African American' & PatientMaritalStatus == 'Married')) & PatientPopulationPercentageBelowPoverty > 15")
```

### Sort Values

SQL cross-reference: {ref}`sql:primer:order_by_clause`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
df_new = df[
    ['PatientMaritalStatus', 'PatientPopulationPercentageBelowPoverty']
].sort_values(['PatientPopulationPercentageBelowPoverty']).reset_index(drop=True)
display(df_new)
```

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
df_new = df[
    ['PatientMaritalStatus', 'PatientPopulationPercentageBelowPoverty']
].sort_values(['PatientMaritalStatus', 'PatientPopulationPercentageBelowPoverty'], ascending=[True, False]).reset_index(drop=True)
display(df_new)
```

## Filtering

### Conditional Evaluation

SQL cross-reference: {ref}`sql:filtering:basic`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
cond = (df['PatientGender'] == 'Male') & (df['PatientDateOfBirth'] < '1950-01-01')
df_new = df[cond].reset_index(drop=True).sort_values('PatientDateOfBirth')
display(df_new)
```

### Using Parenthesis

SQL cross-reference: {ref}`sql:filtering:parenthesis`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
cond = ((df['PatientGender'] == 'Male') | (df['PatientRace'] == 'White')) & (df['PatientDateOfBirth'] < '1950-01-01')
df_new = df[cond].reset_index(drop=True).sort_values('PatientDateOfBirth')
display(df_new)
```

### Range condition

SQL cross-reference: {ref}`sql:filtering:range`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
cond = (df['PatientDateOfBirth'] > '1920-01-01') & (df['PatientDateOfBirth'] < '1950-01-01')
df_new = df[cond].reset_index(drop=True).sort_values('PatientDateOfBirth')
display(df_new)
```

### String condition

SQL cross-reference: {ref}`sql:filtering:string`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'PatientCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')
cond = (df['PatientID'] > '2A') & (df['PatientID'] < '53')
df_new = df[cond].reset_index(drop=True).sort_values('PatientID')
display(df_new)
```

### Wildcard Matches

SQL cross-reference: {ref}`sql:filtering:startswith`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'AdmissionsDiagnosesCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')

cond = (df['PrimaryDiagnosisCode'].str.startswith('M'))
df_new = df[cond].reset_index(drop=True).sort_values('PrimaryDiagnosisCode')
display(df_new)
```

SQL cross-reference: {ref}`sql:filtering:endswith`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'AdmissionsDiagnosesCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')

cond = (df['PrimaryDiagnosisCode'].str.endswith('4'))
df_new = df[cond].reset_index(drop=True).sort_values('PrimaryDiagnosisCode')
display(df_new)
```

SQL cross-reference: {ref}`sql:filtering:contains`

```{code-cell} ipython3
from IPython.display import display
import pandas as pd
import numpy as np
filename = 'AdmissionsDiagnosesCorePopulatedTable.txt'

df = pd.read_csv(filename, delimiter='\t')

cond = (df['PrimaryDiagnosisCode'].str.contains('5.'))
df_new = df[cond].reset_index(drop=True).sort_values('PrimaryDiagnosisCode')
display(df_new)
```

### 13.5.1. A Simple Grouping Examples

```python
import pandas as pd

filename = "LabsCorePopulatedTable.txt"

df = pd.read_csv(filename, delimiter="\t")
# df.set_index("PatientID", inplace=True)
count = df.groupby("PatientID")["LabName"].count().sort_values(ascending=False)
display(count)
count[count>2000]
```

```python
import pandas as pd
import numpy as np

filename = "LabsCorePopulatedTable.txt"

df = pd.read_csv(filename, delimiter="\t")
df.set_index("PatientID", inplace=True)
df = df[df["LabName"] == "URINALYSIS: RED BLOOD CELLS"]
df.select_dtypes(include=[np.number])
count = df.groupby("PatientID").agg((
    {
        "LabValue": ["count", "max", "min", "sum", "mean"]
    }
))
count[('LabValue', 'mean')] = count[('LabValue', 'mean')].round(2)
count.sort_values(('LabValue', 'mean'), ascending=False)
```

```python
import pandas as pd
import numpy as np

filename = "LabsCorePopulatedTable.txt"

df = pd.read_csv(filename, delimiter="\t")
df.set_index("PatientID", inplace=True)
count = df.groupby(["PatientID", "LabName"]).agg((
    {
        "LabValue": ["count", "max", "min", "sum", "mean"]
    }
))
count[('LabValue', 'mean')] = count[('LabValue', 'mean')].round(2)
count.sort_values(["PatientID", "LabName", ('LabValue', 'count')], ascending=(False, True, False))
# count.loc["9E18822E-7D13-45C7-B50E-F95CFF92BC3E"].sort_values(('LabValue', 'count'), ascending=False)
```

```python
import pandas as pd
import numpy as np

filename = "AdmissionsCorePopulatedTable.txt"

df = pd.read_csv(filename, delimiter="\t")
df.set_index("PatientID", inplace=True)
df['AdmissionStartDate'] = pd.to_datetime(df['AdmissionStartDate'])
df['AdmissionEndDate'] = pd.to_datetime(df['AdmissionEndDate'])
df["StayDuration"] = (df['AdmissionEndDate'] - df['AdmissionStartDate']).dt.days
df.groupby("PatientID").max().sort_values('StayDuration', ascending=False)
# df[df["StayDuration"] > 20]
```

### 13.6.1. Using value from a subquery

```python
import pandas as pd
import numpy as np

filename = "AdmissionsCorePopulatedTable.txt"

df_adm = pd.read_csv(filename, delimiter="\t")
df_adm.set_index("PatientID", inplace=True)
df_adm['AdmissionStartDate'] = pd.to_datetime(df_adm['AdmissionStartDate'])
df_adm['AdmissionEndDate'] = pd.to_datetime(df_adm['AdmissionEndDate'])
df_adm["StayDuration"] = (df_adm['AdmissionEndDate'] - df_adm['AdmissionStartDate']).dt.days
df_adm = df_adm.groupby("PatientID").max().sort_values('StayDuration', ascending=False)
df_adm = df_adm[df_adm["StayDuration"] >= 19]["StayDuration"]
df_adm

filename = "PatientCorePopulatedTable.txt"

df = pd.read_csv(filename, delimiter="\t")
df.set_index("PatientID", inplace=True)
new_df = df.join(df_adm)
new_df[new_df["StayDuration"].notna()]
```

### 13.6.2. IN and NOT IN examples

```python
filename = "LabsCorePopulatedTable.txt"

labs = pd.read_csv(filename, delimiter="\t")
labs.set_index("PatientID", inplace=True)

filename = "PatientCorePopulatedTable.txt"
pt = pd.read_csv(filename, delimiter="\t")
pt.set_index("PatientID", inplace=True)
pt
labs.loc[pt[pt["PatientLanguage"].isin(('Icelandic', 'Spanish'))].index].loc["81C5B13B-F6B2-4E57-9593-6E7E4C13B2CE"]
```

```python
filename = "LabsCorePopulatedTable.txt"

labs = pd.read_csv(filename, delimiter="\t")
labs.set_index("PatientID", inplace=True)

filename = "PatientCorePopulatedTable.txt"
pt = pd.read_csv(filename, delimiter="\t")
pt.set_index("PatientID", inplace=True)
pt
labs.loc[pt[~pt["PatientLanguage"].isin(('Icelandic', 'Spanish'))].index][:10]
```

### 13.7. Conditionals

```python
import pandas as pd
import numpy as np

filename = "AdmissionsCorePopulatedTable.txt"

df_adm = pd.read_csv(filename, delimiter="\t", usecols =["AdmissionStartDate"])
df_adm['AdmissionMonth'] = pd.to_datetime(df_adm['AdmissionStartDate']).dt.month_name()
df_adm
df_adm = df_adm.groupby("AdmissionMonth").count()
df_adm.columns = ["AdmissionStartCount"]
df_adm.sort_values("AdmissionStartCount", ascending=False)
```

```python
from datetime import datetime
filename = "PatientCorePopulatedTable.txt"
pt = pd.read_csv(filename, delimiter="\t")
pt.set_index("PatientID", inplace=True)
pt['PatientDateOfBirth'] = pd.to_datetime(pt['PatientDateOfBirth'])
pt["Age"] = ((datetime.now() - pt['PatientDateOfBirth']).dt.days / 365.25).astype(int)
pt["AgeCategory"] = pd.cut(pt["Age"], bins=[-np.inf, 17, 35, 55, np.inf], labels=['YOUTH', 'YOUNG ADULT', 'ADULT', 'SENIOR'])
new_pt = pt[["Age", "AgeCategory"]].sort_values("Age")
new_pt.groupby("AgeCategory", observed=True).count()
```

```python
import pandas as pd
filename = "PatientCorePopulatedTable.txt"
pt = pd.read_csv(filename, delimiter="\t")
pt.set_index("PatientID", inplace=True)

(
    len(pt.query("PatientGender == 'Male' & PatientMaritalStatus == 'Married'")) /
    len(pt.query("PatientGender == 'Female' & PatientMaritalStatus == 'Married'"))
)
```

```python
import pandas as pd
filename = "LabsCorePopulatedTable.txt"
df = pd.read_csv(filename, delimiter="\t")

urinalysis_exams = [
  'URINALYSIS: SPECIFIC GRAVITY',
  'URINALYSIS: PH',
  'URINALYSIS: RED BLOOD CELLS',
  'URINALYSIS: WHITE BLOOD CELLS'
]

exam_check = pd.crosstab(
  df['PatientID'],
  df['LabName']
)[urinalysis_exams].astype(bool)
```

```python
import pandas as pd

# Sample DataFrame
df = pd.DataFrame({
  'Gender': ['M', 'F', 'M', 'F', 'M'],
  'Category': ['A', 'B', 'A', 'A', 'B']
})

# Create a cross-tabulation
result = pd.crosstab(df['Gender'], df['Category'])
print(result)
```

```python
result = pd.crosstab(
  df['PatientID'],
  df['LabName'],
  values=df['LabValue'],
  aggfunc='mean'  # or 'sum', 'min', 'max', etc.
)
result
```

```python
import pandas as pd
filename = "LabsCorePopulatedTable.txt"
lab = pd.read_csv(filename, delimiter="\t")
lab.set_index("PatientID", inplace=True)
lab = lab[lab['LabName']=='METABOLIC: CREATININE'][['LabName', 'LabValue', 'LabUnits']]


filename = "PatientCorePopulatedTable.txt"
pt = pd.read_csv(filename, delimiter="\t")
pt.set_index("PatientID", inplace=True)
pt = pt[['PatientGender']]
lab = lab.join(pt)

def interpret_creatinine_result(row):
    if row['PatientGender'] == 'Male' and 0.7 <= row['LabValue'] <= 1.3:
        return 'Normal'
    elif row['PatientGender'] == 'Female' and 0.6 <= row['LabValue'] <= 1.1:
        return 'Normal'
    else:
        return 'Out of Range'

lab['Interpretation'] = lab.apply(lambda row: interpret_creatinine_result(row), axis=1)
lab = lab[['PatientGender', 'LabName', 'LabValue', 'LabUnits', 'Interpretation']]
lab.sort_values('LabValue', ascending=False)
lab.loc['81C5B13B-F6B2-4E57-9593-6E7E4C13B2CE']['Interpretation'].value_counts()
```

## Analytic Functions

```
import pandas as pd
df = pd.read_csv('bakery_sales.csv')
df['sale_date'] = pd.to_datetime(df['sale_date'])

new_df = df.copy()
new_df['Quarter'] = new_df['sale_date'].dt.quarter

new_df['Month'] = new_df['sale_date'].dt.month_name()
new_df = new_df[['Quarter', 'Month', 'total']]
result = new_df.groupby(['Quarter', 'Month']).sum()

def month_sort(x):
    month_order = {
        'January': 1,
        'February': 2,
        'March': 3,
        'April': 4,
        'May': 5,
        'June': 6,
        'July': 7,
        'August': 8,
        'September': 9,
        'October': 10,
        'November': 11,
        'December': 12
    }
    return x.map(month_order)

result.sort_values('Month', key=lambda x: month_sort(x))
```

### More Exmaples

```python
import pandas as pd
import numpy as np

# Create the sample DataFrame
data = {
  'Quarter': ['Q1', 'Q1', 'Q1', 'Q2', 'Q2', 'Q3', 'Q3', 'Q3', 'Q4', 'Q4', 'Q4'],
  'Month': ['January', 'February', 'March', 'April', 'May', 'July', 'August',
            'September', 'October', 'November', 'December'],
  'Monthly_Sales': [4582500, 6423700, 6445100, 4893700, 308400, 4076500,
                   6100500, 4895500, 3959100, 4543000, 5009500]
}

df = pd.DataFrame(data)

```

#### 1. Basic Window Operations

```python
# Running total of sales
df['Cumulative_Sales'] = df['Monthly_Sales'].cumsum()

# Average sales by quarter
df['Avg_Quarter_Sales'] = df.groupby('Quarter')['Monthly_Sales'].transform('mean')

# Sales rank within quarter
df['Quarter_Sales_Rank'] = df.groupby('Quarter')['Monthly_Sales'].rank(method='dense')

print("\nBasic Window Operations:")
df
```

#### 2. Advanced Window Calculations

```python
# Rolling 3-month sales average
df['Rolling_3Month_Avg'] = df['Monthly_Sales'].rolling(window=3, min_periods=1).mean()

# Cumulative sum within quarter
df['Quarter_Cumulative'] = df.groupby('Quarter')['Monthly_Sales'].transform('cumsum')

# Percentage of quarterly total
df['Pct_of_Quarter'] = df.groupby('Quarter')['Monthly_Sales'].transform(
  lambda x: x / x.sum() * 100
)

print("\nAdvanced Window Calculations:")
df
```

#### 3. Ranking Functions

```python
# Different ranking methods within quarter
df['Dense_Rank'] = df.groupby('Quarter')['Monthly_Sales'].rank(method='dense') #ascending=False
df['Regular_Rank'] = df.groupby('Quarter')['Monthly_Sales'].rank(method='min')
df['Percent_Rank'] = df.groupby('Quarter')['Monthly_Sales'].rank(pct=True)

print("\nRanking Functions:")
print(df[['Quarter', 'Month', 'Monthly_Sales', 'Dense_Rank', 'Regular_Rank', 'Percent_Rank']])
```

#### 4. Lead/Lag Analysis

```python
# Next month's sales
df['Next_Month_Sales'] = df['Monthly_Sales'].shift(-1)

# Previous month's sales
df['Prev_Month_Sales'] = df['Monthly_Sales'].shift(1)

# Sales difference from previous month
df['Month_Over_Month_Change'] = df['Monthly_Sales'] - df['Prev_Month_Sales']

print("\nLead/Lag Analysis:")
df[['Month', 'Monthly_Sales', 'Next_Month_Sales', 'Prev_Month_Sales', 'Month_Over_Month_Change']]
```

#### 5. Complex Analysis

```python
# Comprehensive analysis
df_analyzed = df.assign(
  # Quarter total
  Quarter_Total=lambda x: x.groupby('Quarter')['Monthly_Sales'].transform('sum'),

  # Percentage of annual sales
  Pct_of_Annual=lambda x: x['Monthly_Sales'] / x['Monthly_Sales'].sum() * 100,

  # Quarter-over-Quarter growth
  QoQ_Growth=lambda x: x.groupby('Quarter')['Monthly_Sales'].transform('sum').pct_change() * 100,

  # Running total within quarter
  Quarter_Running_Total=lambda x: x.groupby('Quarter')['Monthly_Sales'].transform('cumsum'),

  # Difference from quarter average
  Diff_From_Quarter_Avg=lambda x: x['Monthly_Sales'] -
      x.groupby('Quarter')['Monthly_Sales'].transform('mean')
)

print("\nComprehensive Analysis:")
df_analyzed
```

#### 6. Summary Statistics

```python

# Summary by quarter
quarterly_summary = df.groupby('Quarter').agg({
  'Monthly_Sales': ['count', 'sum', 'mean', 'min', 'max', 'std']
}).round(2)

print("\nQuarterly Summary:")
display(quarterly_summary)

# Year-to-date calculations
df['YTD_Sales'] = df['Monthly_Sales'].cumsum()
df['YTD_Avg'] = df['Monthly_Sales'].expanding().mean()

print("\nYear-to-Date Analysis:")
df[['Month', 'Monthly_Sales', 'YTD_Sales', 'YTD_Avg']]
```

#### 7. Performance Metrics

```python
# Calculate various performance metrics
performance_metrics = pd.DataFrame({
  'Month': df['Month'],
  'Sales': df['Monthly_Sales'],
  'Pct_of_Year': df['Monthly_Sales'] / df['Monthly_Sales'].sum() * 100,
  'Cumulative_Pct': (df['Monthly_Sales'].cumsum() / df['Monthly_Sales'].sum() * 100),
  'Rolling_3M_Avg': df['Monthly_Sales'].rolling(3, min_periods=1).mean(),
  'Rolling_3M_Std': df['Monthly_Sales'].rolling(3, min_periods=1).std()
}).round(2)

print("\nPerformance Metrics:")
performance_metrics
```

#### 8. Change

```python
import pandas as pd

# Create the sample DataFrame
data = {
  'Quarter': ['Q1', 'Q1', 'Q1', 'Q2', 'Q2', 'Q3', 'Q3', 'Q3', 'Q4', 'Q4', 'Q4'],
  'Month': ['January', 'February', 'March', 'April', 'May', 'July', 'August',
            'September', 'October', 'November', 'December'],
  'Monthly_Sales': [4582500, 6423700, 6445100, 4893700, 308400, 4076500,
                   6100500, 4895500, 3959100, 4543000, 5009500]
}

df = pd.DataFrame(data)

# Calculate change from previous month
df['Change_From_Previous'] = df['Monthly_Sales'].diff()

# Add percentage change
df['Pct_Change'] = df['Monthly_Sales'].pct_change() * 100

# Format the results
result = df.copy()
result['Change_From_Previous'] = result['Change_From_Previous'].round(2)
result['Pct_Change'] = result['Pct_Change'].round(2)

# Add trend indicator
result['Trend'] = result['Change_From_Previous'].apply(
    # lambda x: '↑' if x > 0 else '↓' if x < 0 else '→'
    lambda x: "\U0001F600" if x > 0 else "\U0001F61E" if x < 0 else "\U0001F610"
)

print("Sales Analysis with Month-over-Month Changes:")
result
```

### 9. Various Rankings

- `rank`: returns the same ranking in case of a tie, with gaps in the rankings
- `dense_rank`: returns the same ranking in the case of a tie, with no gaps in the rankings
- `row_number`: returns a unique number for each row, with rankings arbitrarily assigned in case of a tie
- Panda offer other types of ranking also.


```python
import pandas as pd
import numpy as np

# Create sample data
data = {
  'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank'],
  'Score': [85, 92, 92, 78, 85, 95]
}

# Create DataFrame
df = pd.DataFrame(data)

# Sort by Score in descending order first
df_sorted = df.sort_values('Score', ascending=False)

# Add different types of ranks
df_sorted['Rank'] = df_sorted['Score'].rank(method='min', ascending=False)
df_sorted['DenseRank'] = df_sorted['Score'].rank(method='dense', ascending=False)
df_sorted['RowNumber'] = range(1, len(df_sorted) + 1)  # Add row numbers after sorting

print("\nDataFrame sorted by Score (descending):")
df_sorted
```

## Pivot Tables

### Basic Example

```python
import pandas as pd

# Create sample data
data = {
  'Date': ['2024-01-01', '2024-01-01', '2024-01-02', '2024-01-02', '2024-01-03'],
  'Product': ['Laptop', 'Phone', 'Laptop', 'Phone', 'Laptop'],
  'Region': ['North', 'South', 'North', 'North', 'South'],
  'Sales': [1000, 500, 1200, 600, 900]
}

# Create DataFrame
df = pd.DataFrame(data)

# Create a pivot table
pivot_table = pd.pivot_table(
  df,
  values='Sales',
  index='Product',
  columns='Region',
  aggfunc='sum', #  'mean', 'count', 'max'
  fill_value=0 # fill_value=0 replaces any NaN values with 0
)

print("\nOriginal Data:")
display(df)
print("\nPivot Table:")
display(pivot_table)
```

### Multiindices

```python
import pandas as pd

# Create sample data
data = {
  'Date': ['2024-01-01', '2024-01-01', '2024-01-01', '2024-01-02', '2024-01-02',
           '2024-01-02', '2024-01-03', '2024-01-03', '2024-01-03'],
  'Product': ['Laptop', 'Phone', 'Tablet', 'Laptop', 'Phone',
              'Tablet', 'Laptop', 'Phone', 'Tablet'],
  'Category': ['Electronics', 'Electronics', 'Electronics', 'Electronics', 'Electronics',
               'Electronics', 'Electronics', 'Electronics', 'Electronics'],
  'Region': ['North', 'South', 'North', 'North', 'South',
             'South', 'North', 'North', 'South'],
  'Sales': [1000, 500, 300, 1200, 600, 400, 900, 700, 350],
  'Units': [5, 10, 6, 6, 12, 8, 4, 14, 7]
}

# Create DataFrame
df = pd.DataFrame(data)

# Create a pivot table with multiple indices
pivot_table = pd.pivot_table(
  df,
  values=['Sales', 'Units'],  # Multiple values
  index=['Category', 'Product'],  # Multiple indices
  columns=['Region'],
  aggfunc={'Sales': 'sum', 'Units': 'mean'},  # Different aggregations for different values
  fill_value=0,
  margins=True  # Add totals
)

print("\nOriginal Data:")
display(df)
print("\nPivot Table with Multiple Indices:")
display(pivot_table)

# To make it more readable, we can also flatten the column headers
pivot_table.columns = [f'{col[0]}_{col[1]}' for col in pivot_table.columns]
print("\nPivot Table with Flattened Headers:")
display(pivot_table)
```

### Multiple Aggregations

```python
pivot_table = pd.pivot_table(
  df,
  values=['Sales', 'Units'],
  index=['Category', 'Product'],
  columns=['Region'],
  aggfunc={
      'Sales': ['sum', 'mean'],  # Multiple aggregations for Sales
      'Units': ['mean', 'max']   # Multiple aggregations for Units
  },
  fill_value=0
)
pivot_table
```
