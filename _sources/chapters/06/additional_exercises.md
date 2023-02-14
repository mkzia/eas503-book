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

- [Video Recording (24 minutes)](https://ub.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=246c171f-a4a9-4631-8edc-afa900cf763f)
- [Jupyter Notebook](https://github.com/mkzia/eas503-book-notes/blob/main/06/additional_exercises.ipynb)

# Additional Exercises


## Exercise 1
Write a function called `get_unique_nationalities()` that finds the unique nationalities from 'soccer_players_statistics.csv'.

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def sum_list(input_list):
    summed_values = 0
    for value in input_list:
        summed_values += value

    return summed_values


def get_unique_nationalities():
    header = None
    unique_nationalities = []
    with open('soccer_players_statistics.csv', encoding="utf-8") as file:
        for line in file:

            if not line.strip():
                continue

            if not header:
                header = line.strip().split(',')
                continue

            line = line.strip().split(',')

            nationality = line[1]
            if nationality not in unique_nationalities:
                unique_nationalities.append(nationality)
                
    
    unique_nationalities.sort()
    
    return unique_nationalities
        
print(get_unique_nationalities())
```



## Exercise 2
Write a function called `get_unique_values_by_column_name(column_name)` that finds the unique values for any column in 'soccer_players_statistics.csv'.

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
def get_unique_values_by_column_name(column_name):
    header = None
    unique_values = []
    with open('soccer_players_statistics.csv', encoding="utf-8") as file:
        for line in file:

            if not line.strip():
                continue

            if not header:
                header = line.strip().split(',')
                try:
                    column_index = header.index(column_name)
                except:
                    print(f'Column Name {column_name} not found!')
                    return False
                continue

            line = line.strip().split(',')

            value = line[column_index]
            if value and value not in unique_values:
                unique_values.append(value)
                
    
    unique_values.sort()
    
    return unique_values
        
get_unique_values_by_column_name('Rating')
```

## Exercise 4
Write a function called `stats(column_name)` that finds the min, max, and mean for a given column name.

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]

def mean(number_sequence):
    return round(sum(number_sequence)/len(number_sequence), 2)

def stats(column_name):
    values = get_unique_values_by_column_name(column_name)
    values = [float(value) for value in values]
    return (min(values), max(values), mean(values))
    
stats('Rating')
```


## Exercise 5
Write a function called `extract_columns(column_names)` that extracts columns by name.

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]

def extract_columns(column_names):
    header = None
    values = []
    with open('soccer_players_statistics.csv', encoding="utf-8") as file:
        for line in file:

            if not line.strip():
                continue

            if not header:
                header = line.strip().split(',')
                try:
                    column_indicies = []
                    for column_name in column_names:
                        column_index = header.index(column_name)
                        column_indicies.append(column_index)
                except:
                    print(f'Column Name {column_name} not found!')
                    return False
                continue

            line = line.strip().split(',')
            column_data = []
            for column_index in column_indicies:
                column_data.append(line[column_index])
                
            values.append(column_data)
            
    return values

column_data = extract_columns(['Club_Joining', 'Contract_Expiry'])
```

## Exercise 6
Write code to find the minimum and maximum difference between 'Club_Joining' and 'Contract_Expiry'. 

```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]

def extract_columns(column_names):
    header = None
    values = []
    with open('soccer_players_statistics.csv', encoding="utf-8") as file:
        for line in file:

            if not line.strip():
                continue

            if not header:
                header = line.strip().split(',')
                try:
                    column_indicies = []
                    for column_name in column_names:
                        column_index = header.index(column_name)
                        column_indicies.append(column_index)
                except:
                    print(f'Column Name {column_name} not found!')
                    return False
                continue

            line = line.strip().split(',')
            column_data = []
            for column_index in column_indicies:
                column_data.append(line[column_index])
                
            values.append(column_data)
            
    return values

column_data = extract_columns(['Club_Joining', 'Contract_Expiry'])


min_val = float('inf')
max_val = float('-inf')
for join_date, expiry_year in column_data:
    if not expiry_year.strip():
        continue
    if not join_date.strip():
        continue
    
    expiry_year = int(float(expiry_year))
    month, day, year = join_date.split('/')
    join_year = int(year)
    difference = abs(join_year-expiry_year)
    if difference < min_val:
        min_val = difference
        
    if difference > max_val:
        max_val = difference
print(min_val, max_val)
```

## Exercise 7
Write code to extract the individual columns or key/value pairs and print them. 

```
large_string = "Cristiano Ronaldo	Nationality=Portugal;National_Position=LS;National_Kit=7.0;Club=Real Madrid;Club_Position=LW;Club_Kit=7.0;Club_Joining=07/01/2009;Contract_Expiry=2021.0;Rating=94;Height=185 cm;Weight=80 kg;Preferred_Foot=Right;Birth_Date=02/05/1985;Age=32;Preferred_Position=LW/ST;Work_Rate=High / Low;Weak_foot=4;Skill_Moves=5;Ball_Control=93;Dribbling=92;Marking=22;Sliding_Tackle=23;Standing_Tackle=31;Aggression=63;Reactions=96;Attacking_Position=94;Interceptions=29;Vision=85;Composure=86;Crossing=84;Short_Pass=83;Long_Pass=77;Acceleration=91;Speed=92;Stamina=92;Strength=80;Balance=63;Agility=90;Jumping=95;Heading=85;Shot_Power=92;Finishing=93;Long_Shots=90;Curve=81;Freekick_Accuracy=76;Penalties=85;Volleys=88;GK_Positioning=14;GK_Diving=7;GK_Kicking=15;GK_Handling=11;GK_Reflexes=11"
```


```{code-cell} ipython3
:tags: ["hide-input", "output_scroll"]
large_string = "Cristiano Ronaldo	Nationality=Portugal;National_Position=LS;National_Kit=7.0;Club=Real Madrid;Club_Position=LW;Club_Kit=7.0;Club_Joining=07/01/2009;Contract_Expiry=2021.0;Rating=94;Height=185 cm;Weight=80 kg;Preferred_Foot=Right;Birth_Date=02/05/1985;Age=32;Preferred_Position=LW/ST;Work_Rate=High / Low;Weak_foot=4;Skill_Moves=5;Ball_Control=93;Dribbling=92;Marking=22;Sliding_Tackle=23;Standing_Tackle=31;Aggression=63;Reactions=96;Attacking_Position=94;Interceptions=29;Vision=85;Composure=86;Crossing=84;Short_Pass=83;Long_Pass=77;Acceleration=91;Speed=92;Stamina=92;Strength=80;Balance=63;Agility=90;Jumping=95;Heading=85;Shot_Power=92;Finishing=93;Long_Shots=90;Curve=81;Freekick_Accuracy=76;Penalties=85;Volleys=88;GK_Positioning=14;GK_Diving=7;GK_Kicking=15;GK_Handling=11;GK_Reflexes=11"
name, string = large_string.split('\t')
for key_value in string.split(';'):
    key, value = key_value.split('=')
    print(name, key, value)

```
        