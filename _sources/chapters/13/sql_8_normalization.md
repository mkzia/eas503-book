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
# Database Normalization

## What is database normalization?

Normalization is the process of structuring a relational database to reduce redundancy and improve data integrity.

- Goals:
  - Eliminate redundant data
  - Reduce anomalies during insert, update, and delete
  - Ensure attributes depend on the key, the whole key, and nothing but the key
- How is normalization achieved?
  - By applying a series of normal forms. Each normal form imposes stricter rules; in practice, achieving 1NF, 2NF, and 3NF is usually sufficient for OLTP systems.

References:
- [ComplexSQL: Database Normalization](https://www.complexsql.com/database-normalization/)
- [DatabaseDev: First Normal Form](http://www.databasedev.co.uk/1norm_form.html)
- [1KeyData: Normal Forms](https://www.1keydata.com/database-normalization/first-normal-form-1nf.php)
- [Arctype: 2NF vs 3NF Example](https://arctype.com/blog/2nf-3nf-normalization-example/)

## Normal Forms (concise)

- First Normal Form (1NF)
  1. No repeating groups or arrays
  2. All values are atomic (single, indivisible values)
- Second Normal Form (2NF)
  1. The table is in 1NF
  2. No partial dependency: each non-key attribute depends on the entire primary key (relevant when the key is composite)
- Third Normal Form (3NF)
  1. The table is in 2NF
  2. No transitive dependencies: no non-key attribute depends on another non-key attribute

## Summary

1. All values must be atomic (1NF) 
2. No partial dependency on part of a composite key (2NF)
3. No transitive dependency among non-key attributes (3NF)

## Bad Design Examples

### Example 1

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
import sqlite3
import pandas as pd

conn = sqlite3.connect('example1.db')
sql_statement = "SELECT * FROM EMPLOYEES_PROJECTS_TIME"
df = pd.read_sql_query(sql_statement, conn)
df.style.set_table_attributes('style="font-size: 12px"')
```

- Problems with Example 1
  - Repeating groups of fields (e.g., `project1`, `project2`, …)
  - Project and time fields are not atomic
  - Can’t sort by last name (e.g., if stored together as full name without split)
  - Can’t sort by time because the field is stored as text; store durations as numeric (e.g., minutes) or a standard format
  - Implicit pairing between project and time (not explicitly modeled)

### Example 2

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
import sqlite3
import pandas as pd

conn = sqlite3.connect('example2.db')
sql_statement = "SELECT * FROM EMPLOYEES_PROJECTS_TIME"
df = pd.read_sql_query(sql_statement, conn)
df.style.set_table_attributes('style="font-size: 12px"')
```

- Analysis of Example 2
  - Sorting is possible if data types are corrected
  - Not scalable: how do you add another project without altering the schema?

### Example 3 (Move to 1NF)

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
import sqlite3
import pandas as pd

conn = sqlite3.connect('example3.db')

sql_statement = "SELECT * FROM EMPLOYEES"
df = pd.read_sql_query(sql_statement, conn)
display(df.style.set_table_attributes('style="font-size: 12px"'))

sql_statement = "SELECT * FROM PROJECTS_EMPLOYEES_TIME"
df = pd.read_sql_query(sql_statement, conn)
df.style.set_table_attributes('style="font-size: 12px"')
```

- Analysis of Example 3 — First Normal Form
  - One row per (employee, project, time) → atomic values
  - Can group by `employee_id` or `project_id`
  - Can sort by time and by name

### Example 4 (Pre-2NF anti-pattern)

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
import sqlite3
import pandas as pd

conn = sqlite3.connect('example4.db')
sql_statement = "SELECT * FROM EMPLOYEES_PROJECTS"
df = pd.read_sql_query(sql_statement, conn)
df.style.set_table_attributes('style="font-size: 12px"')
```

- Analysis of Example 4
  - How would you update a project title? You’d have to edit many rows (update anomaly)
  - Can you add a project without an `employee_id`? Not cleanly
  - How can you delete a project without losing its details? Risk of delete anomaly

### Example 5 (2NF achieved)

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
import sqlite3
import pandas as pd

conn = sqlite3.connect('example5.db')

sql_statement = "SELECT * FROM EMPLOYEES"
df = pd.read_sql_query(sql_statement, conn)
display(df.style.set_table_attributes('style="font-size: 12px"'))

sql_statement = "SELECT * FROM EMPLOYEES_PROJECTS"
df = pd.read_sql_query(sql_statement, conn)
display(df.style.set_table_attributes('style="font-size: 12px"'))

sql_statement = "SELECT * FROM PROJECTS"
df = pd.read_sql_query(sql_statement, conn)
df.style.set_table_attributes('style="font-size: 12px"')
```

- Analysis of Example 5
  - Project attributes live in `PROJECTS` (no duplication in the junction table)
  - Junction table holds only FKs and relationship-specific attributes
  - No partial dependencies

### Example 6 (3NF problem: transitive dependency)

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
import sqlite3
import pandas as pd

conn = sqlite3.connect('example6.db')
sql_statement = "SELECT * FROM PROJECTS"
df = pd.read_sql_query(sql_statement, conn)
df.style.set_table_attributes('style="font-size: 12px"')
```

- Analysis of Example 6
  - Example: `PROJECTS(project_id PK, manager_name, manager_phone, ...)`
  - `manager_phone` depends on `manager_name` (non-key), not directly on `project_id`
  - This is a transitive dependency: `project_id → manager_name → manager_phone`

### Example 7 (3NF achieved: remove transitive dependency)

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
import sqlite3
import pandas as pd

conn = sqlite3.connect('example7.db')
sql_statement = "SELECT * FROM MANAGERS"
df = pd.read_sql_query(sql_statement, conn)
display(df.style.set_table_attributes('style="font-size: 12px"'))

sql_statement = "SELECT * FROM PROJECTS"
df = pd.read_sql_query(sql_statement, conn)
df.style.set_table_attributes('style="font-size: 12px"')
```

- Analysis of Example 7
  - `MANAGERS(manager_id PK, manager_name, manager_phone, ...)`
  - `PROJECTS` references `manager_id` (FK); manager details live in `MANAGERS`
  - Removes the transitive dependency and update anomalies