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
# Comprehension

## List Comprehension

- Unique to Python
- Three variations

```python
[ f(ele) for ele in sequence ]

[ f(ele) for ele in sequence if condition ]

[ f(ele) if condition else g(ele) for ele in sequence ]

```


## Tuple Comprehension
- Tuple Comprehension returns a generator
- Generators generate one-time use values

```python
( f(ele) for ele in sequence )

( f(ele) for ele in sequence if condition )

( f(ele) if condition else g(ele) for ele in sequence )

```