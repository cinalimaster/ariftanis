# csv file link https://github.com/amankharwal/Website-data/blob/master/bank.csv?raw=true
# import libraries and load datafile
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

data = pd.read_csv("bank.csv")
data.head()

# check correlation
import matplotlib.pyplot as plt
import seaborn as sns
sns.set()
sns.heatmap(data.corr())
plt.show()

# drop bankrupt column
X = data.drop(["Bankrupt?"], axis="columns")
y = data["Bankrupt?"]

# logistic regression split data 
x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
logreg = LogisticRegression()
logreg.fit(x_train, y_train)

# run model
LogisticRegression(C=1.0, class_weight=None, dual=False, fit_intercept=True,
                   intercept_scaling=1, l1_ratio=None, max_iter=100,
                   multi_class='auto', n_jobs=None, penalty='l2',
                   random_state=None, solver='lbfgs', tol=0.0001, verbose=0,
                   warm_start=False)

# check accuracy score
logreg.score(x_test, y_test)

"""
0.9596774193548387
"""
