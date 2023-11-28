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




# Feature Selection and Evaluation


## PCA
```{code-cell} ipython3
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = "all"
import numpy as np
from scipy import signal
import matplotlib.pyplot as plt
%matplotlib inline 
np.random.seed = 1
N = 1000
fs = 500
w = np.arange(1,N+1) * 2 * np.pi/fs
t = np.arange(1,N+1)/fs
x = 0.75 * np.sin(w*5)
y = signal.sawtooth(w*7, 0.5)
d1 = 0.5*y   + 0.5*x   + 0.1*np.random.rand(1,N)
d2 = 0.2*y   + 0.75*x  + 0.15*np.random.rand(1,N)
d3 = 0.7*y   + 0.25*x  + 0.1*np.random.rand(1,N)
d4 = -0.5*y  + 0.4*x   + 0.2*np.random.rand(1,N)
d5 = 0.6*np.random.rand(1,N)


d1 = d1 - d1.mean()
d2 = d2 - d2.mean()
d3 = d3 - d3.mean()
d4 = d4 - d4.mean()
d5 = d5 - d5.mean()
```

```{code-cell} ipython3
plt.plot(d1.transpose())
```

```{code-cell} ipython3
plt.plot(t, x)
```

```{code-cell} ipython3
plt.plot(t, y)
```


```{code-cell} ipython3
import numpy as np
X = np.array([d1[0], d2[0], d3[0], d4[0], d5[0]])
X
X.shape
```

```{code-cell} ipython3
U,S,V = np.linalg.svd(X)
S
```

```{code-cell} ipython3
for i in range(5):
    V[:,i] = V[:,i] * np.sqrt(eigen[i])
eigen = S**2
eigen
```

```{code-cell} ipython3
eigen = eigen/N
eigen = eigen/sum(eigen)
```


### Scree plot
Gives the measure of the associated principal component's importance with regards to how much of the total information it represents. 


```{code-cell} ipython3
plt.plot(range(1,6), eigen)
```

```{code-cell} ipython3
plt.plot(V[:,0])
plt.show()
```


```{code-cell} ipython3
plt.plot(V[:,1])
plt.show()
```


```{code-cell} ipython3
plt.plot(V[:,2])
plt.show()
```


### PCA on the IRIS Data

```{code-cell} ipython3
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from sklearn import datasets
from sklearn.decomposition import PCA

# import some data to play with
iris = datasets.load_iris()
X = iris.data[:, :2]  # we only take the first two features.
y = iris.target

x_min, x_max = X[:, 0].min() - .5, X[:, 0].max() + .5
y_min, y_max = X[:, 1].min() - .5, X[:, 1].max() + .5

plt.figure(2, figsize=(8, 6))
plt.clf()

# Plot the training points
plt.scatter(X[:, 0], X[:, 1], c=y, cmap=plt.cm.Set1,
            edgecolor='k')
plt.xlabel('Sepal length')
plt.ylabel('Sepal width')

plt.xlim(x_min, x_max)
plt.ylim(y_min, y_max)
plt.xticks(())
plt.yticks(())

# To getter a better understanding of interaction of the dimensions
# plot the first three PCA dimensions
fig = plt.figure(1, figsize=(8, 6))
ax = Axes3D(fig, elev=-150, azim=110)
X_reduced = PCA(n_components=3).fit_transform(iris.data)
ax.scatter(X_reduced[:, 0], X_reduced[:, 1], X_reduced[:, 2], c=y,
           cmap=plt.cm.Set1, edgecolor='k', s=40)
ax.set_title("First three PCA directions")
ax.set_xlabel("1st eigenvector")
ax.w_xaxis.set_ticklabels([])
ax.set_ylabel("2nd eigenvector")
ax.w_yaxis.set_ticklabels([])
ax.set_zlabel("3rd eigenvector")
ax.w_zaxis.set_ticklabels([])

plt.show()
```

```{code-cell} ipython3
iris = datasets.load_iris()
X = iris.data[:50,:] 
X2 = X +0.05*np.random.rand(50,4)
X_combined = np.zeros((50,8))
X_combined[:,0:4] = X
X_combined[:,4:] = X2
```

```{code-cell} ipython3
X_combined.mean(axis=0)
```

```{code-cell} ipython3
from sklearn import preprocessing
X_scaled = preprocessing.scale(X_combined)
X_combined.mean(axis=0)  
```


```{code-cell} ipython3
U,S,V = np.linalg.svd(X_scaled)
S
```

```{code-cell} ipython3
eigen = S**2
eigen = eigen/50
eigen = eigen/sum(eigen)
eigen = np.round(eigen*100)/100
print(eigen)
```

```{code-cell} ipython3
sum([0.51, 0.26, 0.17, 0.06])
```

```{code-cell} ipython3
plt.plot(range(1, 9), eigen)
```

```{code-cell} ipython3
X_reduced = PCA(n_components=3).fit_transform(X_scaled)
```


## K-Means Clustering

```{code-cell} ipython3
# https://towardsdatascience.com/machine-learning-algorithms-part-9-k-means-example-in-python-f2ad05ed5203
# https://blog.floydhub.com/introduction-to-k-means-clustering-in-python-with-scikit-learn/
from sklearn.datasets import make_blobs
plt.title("Three blobs", fontsize='small')
X1, Y1 = make_blobs(n_features=2, centers=3, random_state=10)
plt.scatter(X1[:, 0], X1[:, 1], marker='o', c=Y1,
            s=25, edgecolor='k')
```


## Using scikit-learn to perform K-Means clustering

```{code-cell} ipython3
from sklearn.cluster import KMeans
    
# Specify the number of clusters (3) and fit the data X
kmeans = KMeans(n_clusters=3, random_state=0).fit(X1)
# Get the cluster centroids

# Plotting the cluster centers and the data points on a 2D plane
plt.scatter(X1[:, 0], X1[:, 1], marker='o', c=Y1,
            s=25, edgecolor='k')
    
plt.scatter(kmeans.cluster_centers_[:, 0], kmeans.cluster_centers_[:, 1], c='red', marker='x')
    
plt.title('Data points and cluster centroids')
plt.show()
```


### Some links
https://jakevdp.github.io/PythonDataScienceHandbook/05.07-support-vector-machines.html
https://scikit-learn.org/stable/auto_examples/linear_model/plot_ransac.html
http://www.cse.psu.edu/~rtc12/CSE486/lecture15.pdf
https://towardsdatascience.com/accuracy-precision-recall-or-f1-331fb37c5cb9


## Evaluating Algorithms

```{code-cell} ipython3
from sklearn.datasets import load_breast_cancer
data = load_breast_cancer()
X = data.data
Y = data.target

from sklearn.metrics import accuracy_score
from sklearn.metrics import confusion_matrix
from sklearn.metrics import classification_report
```

```{code-cell} ipython3
from sklearn.model_selection import train_test_split
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.25, random_state = 0)
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)

from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression(random_state = 0)
classifier.fit(X_train, Y_train)
Y_pred = classifier.predict(X_test)

accuracy = accuracy_score(Y_test, Y_pred)
accuracy
```



```{code-cell} ipython3
cm = confusion_matrix(Y_test, Y_pred)
cm
# tn, fp, fn, tp = confusion_matrix(Y_test, Y_pred).ravel()
#TN, FP, FN, TP
# 

- Sensitivity refers to a test's ability to designate an individual with disease as positive. A highly sensitive test means that there are few false negative results, and thus fewer cases of disease are missed. 
- The specificity of a test is its ability to designate an individual who does not have a disease as negative.
- https://en.wikipedia.org/wiki/Confusion_matrix

```

```
tn, fp, fn, tp = confusion_matrix(Y_test, Y_pred).ravel()
tn
fp
fn
tp
```

```
# 380 b
# 20 m

TN = 380
TP = 0
```

```
TN, FP, FN, TP

https://stackoverflow.com/questions/56078203/why-scikit-learn-confusion-matrix-is-reversed

[[True Negative, False Positive] 
[False Negative, True Positive]]
```


```{code-cell} ipython3
results = classification_report(Y_test, Y_pred)
print(results)
```

```
# precision measures how accurate our positive predictions were
# precision = tp / (tp+fp)

# recall measures what fraction of the positives our model identified
# recall = tp / (tp+fn) -- same as sensitivity
```


### Lots of Classifiers

```{code-cell} ipython3
from sklearn.svm import SVC
classifier = SVC(kernel = 'rbf', random_state = 0)
classifier.fit(X_train, Y_train)
Y_pred = classifier.predict(X_test)
accuracy = accuracy_score(Y_test, Y_pred)
accuracy
cm = confusion_matrix(Y_test, Y_pred)
cm
```

```{code-cell} ipython3
results = classification_report(Y_test, Y_pred)
print(results)
```

```{code-cell} ipython3
from sklearn.naive_bayes import GaussianNB
classifier = GaussianNB()
classifier.fit(X_train, Y_train)
Y_pred = classifier.predict(X_test)
accuracy = accuracy_score(Y_test, Y_pred)
accuracy
cm = confusion_matrix(Y_test, Y_pred)
cm
```

```{code-cell} ipython3
results = classification_report(Y_test, Y_pred)
print(results)
```

```{code-cell} ipython3
from sklearn.tree import DecisionTreeClassifier
classifier = DecisionTreeClassifier(criterion = 'entropy', random_state = 0)
classifier.fit(X_train, Y_train)
Y_pred = classifier.predict(X_test)
accuracy = accuracy_score(Y_test, Y_pred)
accuracy
cm = confusion_matrix(Y_test, Y_pred)
cm
```


```{code-cell} ipython3
results = classification_report(Y_test, Y_pred)
print(results)
```

```{code-cell} ipython3
from sklearn.ensemble import RandomForestClassifier
classifier = RandomForestClassifier(n_estimators = 10, criterion = 'entropy', random_state = 0)
classifier.fit(X_train, Y_train)
Y_pred = classifier.predict(X_test)
accuracy = accuracy_score(Y_test, Y_pred)
accuracy
cm = confusion_matrix(Y_test, Y_pred)
cm

from sklearn.metrics import fbeta_score
output = fbeta_score(Y_test, Y_pred, average='macro', beta=0.5)
output
```

#### Feature Importance 
```{code-cell} ipython3
for score, name in sorted(zip(classifier.feature_importances_, data.feature_names), reverse=True):
    print(round(score, 2), name)
```

```
results = classification_report(Y_test, Y_pred)
print(results)
```


```{code-cell} ipython3
X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2, random_state = 0)
sc = StandardScaler()
X_train = sc.fit_transform(X_train)
X_test = sc.transform(X_test)
classifier = LogisticRegression(random_state = 0)
classifier.fit(X_train, Y_train)
Y_pred = classifier.predict(X_test)

accuracy = accuracy_score(Y_test, Y_pred)
accuracy
cm = confusion_matrix(Y_test, Y_pred)
cm
```

```{code-cell} ipython3
from sklearn.metrics import classification_report
results = classification_report(Y_test, Y_pred)
print(results)
```


```{code-cell} ipython3
from sklearn.metrics import roc_auc_score

roc_auc = roc_auc_score(Y_test, Y_pred)


from sklearn import metrics

fpr, tpr, thresholds = metrics.roc_curve(Y_test, Y_pred)
```

```{code-cell} ipython3
plt.figure()
lw = 2
plt.plot(
    fpr,
    tpr,
    color="darkorange",
    lw=lw,
    label="ROC curve (area = %0.2f)" % roc_auc,
)
plt.plot([0, 1], [0, 1], color="navy", lw=lw, linestyle="--")
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel("False Positive Rate")
plt.ylabel("True Positive Rate")
plt.title("Receiver operating characteristic example")
plt.legend(loc="lower right")
plt.show()
```



## Imbalanced Data sets
- For imbalanced data sets, the AUC of precision/recall curve is more informative than the AUC for sensitivity/specificity curve. 

- https://www.kaggle.com/code/vedbharti/classification-precision-recall-vs-roc-plot

## Stratify 

stratify


## Vocabulary
- Supervised Learning
- Unsupervised Learning
- Classification
- Prediction
- Clustering
- Cross-Validation
- Dimensionality Reduction (curse of dimensionality)
- Feature Selection
- Accuracy
- True Positive
- True Negative
- False Positive
- False Negative
- Confusion Matrix
- Sensitivity
- Specificity
- Recall
- Precision
- F1-Score
- Imbalanced Data
- Area Under the Curve (Sensitivity/Specificity and Precision/Recall)
- Underfitting
- Overfitting -- reduced via regularization (reduce degrees of freedom), early stopping (stop when validation error reaches minimum)
- Bias -- Error due to wrong assumptions, e.g., linear, when non linear; high-bias results in under fit training data
- Variance -- Excessive sensitivity to small variations in the training data; high results in over fitting. 
- Bias/Variance Trade-Off
- Stratified Sampling

