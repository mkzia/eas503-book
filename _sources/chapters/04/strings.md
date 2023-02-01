# String Comparisons

- When strings are compared, they are compared lexicographic, meaning strings are put into alphabetical order and uppercase comes before lowercase.
- ASCII Table: https://www.rapidtables.com/code/text/ascii-table.html
- **Memorize**:
  - 0-9 -- 48-57
  - A-Z -- 65-90
  - a-z -- 97-122
  
```python
'A' < 'a'
'A' > 'Z'
'abc' < 'abd'
'abc' < 'abcd' # shorter is less
```
- Convert a single character to its unicode number: `ord()`
- Convert a unicode number to its unicode character: `chr()`


- Python provides a way to check if one string appears inside another one:

```python
'Jan' in '01 Jan 1838'

'Feb' in '01 Jan 1838'

'a' in 'abc'

'A' in 'abc'
```

- How does this differ from `find` or `index`?