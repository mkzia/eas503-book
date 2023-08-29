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

# Quizzes

## Getting Started Review

```{code-cell} ipython3
:tags: ["remove-input"]
from jupyterquiz import display_quiz
display_quiz("questions/"+'getting_started.json', shuffle_answers=False, colors='fdsp')
```

## Definitions

```{code-cell} ipython3
:tags: ["remove-input"]
from jupyterquiz import display_quiz
display_quiz("questions/"+'definitions.json', shuffle_answers=False, colors='fdsp')
```

## Arithmetic

```{code-cell} ipython3
:tags: ["remove-input"]
from jupyterquiz import display_quiz
display_quiz("questions/"+'arithmetic.json', shuffle_answers=False, colors='fdsp')
```
