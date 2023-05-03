# Introduction
:::{note}
What is the difference between supervised and unsupervised learning?
:::

- There are three main paradigms for machine learning: supervised learning, unsupervised learning, and reinforcement learning. We will cover the first two learning paradigms. 
- In **supervised learning**, you are training a machine to predict categories of new data, called **classification**, or to predict numerical values of a new data, called **regression**. 
    - Example of classification: You have a dataset that has sepal and petal measurements for three different types of Iris flowers. For each of flower type, the correct **label** or sub-species is given. You encounter a new set of flower measurements, but this time you only know the measurements of the sepal and petal. You can train classification algorithms to use knowledge of the labeled dataset to predict the label of the new set of flower measurements, namely, predict the flower sub-specie. 
    - Example of regression: You have a dataset with years of experience and associated salary. Someone asks you what the salary should be for a year not in the original dataset. You can fit the original data in a model to predict values that are not in the original dataset. 
- In **unsupervised learning**, the dataset has no labels. Instead, you can use an algorithm to find patterns or structures in the dataset, effectively, generate labels for the dataset. Usually clustering algorithms are used for unsupervised learning. The idea is to to cluster similar data points and label them as one. 
    - Example of clustering: You have a dataset that has sepal and petal measurements for three different types of Iris flowers, but you do not know which sub-species each measurement belongs to. You can use a clustering algorithm to find three centroids based on the measurements for each of the three sub-species, effectively generating labels for your unlabeled data. 

## Main Challenges of Machine Learning
- Insufficient quantity of training data
- Nonrepresentative training data
- Poor quality data
- Irrelevant features
- Overfitting the training data
- Underfitting the training data
- Testing and validation
- Hyperparameter tuning and model selection
- Data mismatch


## Outline of an End-to-End Machine Learning Project
1. What problem are you solving and why does it matter?
    1. The purpose is to motivate why you are doing machine learning. Machine learning models themselves are not the end goal. Rather, what benefit can you get from applying that model? So you must be able to motivate the what and why of your problem. Finally, you should know how whatever you are doing is currently done. 
    1. Example from the housing data set: we want to build a model to predict median house pricing, which will then be combined with other data to determine if it is worth investing in a given area. Currently, this analysis is done manually by experts. 
    1. Example of medical diagnosis: We want to build an image classification model that can predict if a given image is cancerous or not. Currently, a radiologist has to swift through 100s of image to determine if a given is cancerous. 
2. Getting/Loading the data 
    1. Data might have to parsed from some unstructured or semi-structured file and then loaded into a database
3. Explore and Visualize the data to gain insight 
    1. Visualize the geographical data
    1. Look for correlations
    1. Experiment with attribute combination
4. Prepare the data for machine learning algorithms
    1. Clean the data
    1. Handle text and categorical attributes
    1. Perform feature scaling and transformation 
    1. Apply custom transformation, if needed
    1. Create transformation pipeline

5. Select and train a model
    1. Feature selection
    1. Train and evaluate on the training set
    1. Better evaluation using cross-validation
6. Fine-Tune your model
    1. Grid search
    1. Randomized search
    1. Ensemble methods
    1. Analyze the best models and their errors
    1. Evaluate your system on the test set
7. Launch, monitor, and maintain your system 



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