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

## Introduction

```{code-cell} ipython3
:tags: ["remove-input"]
from jupyterquiz import display_quiz
display_quiz("questions/"+'intro.json', shuffle_answers=True, colors='fdsp')
```

## Built-in

```{code-cell} ipython3
:tags: ["remove-input"]
from jupyterquiz import display_quiz
display_quiz("questions/"+'built_in.json', shuffle_answers=True, colors='fdsp')
```

## User Defined

```{code-cell} ipython3
:tags: ["remove-input"]
from jupyterquiz import display_quiz
display_quiz("questions/"+'user_defined.json', shuffle_answers=True, colors='fdsp')
```

