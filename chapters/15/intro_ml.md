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


# Introduction to Machine Learning

## General Machine Learning Concept
- Simplified: in machine learning, a computer is trained to classify new data. Think of it as an input-output device that takes in a number of inputs, and based on the pattern of these inputs, determine the most likely class associated with that data. There two main types of learning strategies. 1) Supervised learning where you train the machine using data for which the correct class is known. 2) Unsupervised learning where the classifier itself tries to find patterns within the input data itself. (Biosignal and Medical Image Processing John Semmlow) 
- Classification (determine `label`) vs Regression (predict a `numerical value`) 

## General Outline of Machine Learning

1. Loading Data
   - Load toy data included in sklearn
   - Download published/annotated data from online
   - Generate data with specific statistics to learn how algorithms work
2. Preprocessing Data
   - Make data zero mean
   - Make data unit variance
   - Fix range of values
   - Deal with missing values
   - Map text labels to integer labels (if applicable) -- ML algorithms require the data be numeric
3. Dimensionality Reduction of data
   - If you use too many features and do not have enough samples, you could over fit.
   - So you have to choose the most discriminating few features
4. Applying algorithms
   - Labeled Data - Supervised 
   - Non-labeled Data - Unsupervised 
5. Evaluation 
   - Receiver Operator Curve
     - Sensitivity
     - Specificity
   - Imbalanced Data
    - Example: 95 % one class, 5% another class

- REF: Scikit-learn Essentials: Mastering the scikit-learn Machine Learning Library for Python by Dhiraj Kumar

## Various Python Libraries: When to use what
  - ref:https://www.quora.com/What-is-the-relationship-among-NumPy-SciPy-Pandas-and-Scikit-learn-and-when-should-I-use-each-one-of-them
  - Numpy -- provides efficient array computation via vectorization and broadcasting
      - Vectorization -- no need for explicit looping -- example, vector multiplication or squaring
      - Broadcasting -- manipulate multiple values at once
  - Pandas - Uses Numpy arrays as the underlying structure. Good for analyzing tabular data
  - Scipy (scientific python)- provides libraries for scientific computing, including: integration, interpolation, signal processing, linear algebra, statistics. Also uses Numpy infrastructure
  - Scikit-learn - provides a collection of machine-learning algorithms that use Numy and Scipy 
    - Most used Python library for machine-learning
      - regression
      - classification
      - clustering

## Topics Covered
  - Introduction to Scikit-learn
  - Loading Dataset using Scikit-learn
  - Preprocessing data using scikit-learn
  - Train Test split using scikit-learn
  - Linear regression using scikit-learn
  - Naive Bays using Scikit learn
  - SVM using Scikit learn
  - k-Nearest neighbor using Scikit-learn