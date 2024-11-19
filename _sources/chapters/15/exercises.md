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