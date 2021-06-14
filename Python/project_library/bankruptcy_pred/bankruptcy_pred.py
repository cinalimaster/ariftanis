import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score

data = pd.read_csv("bank.csv")
data.head()

#check correlations
import matplotlib.pyplot as plt
import seaborn as sns
sns.set()
sns.heatmap(data.corr())
plt.show()

# As the “Bankrupt?” column is the target label so I will drop it from the training data:
X = data.drop(["Bankrupt?"], axis="columns")
y = data["Bankrupt?"]

# split dataset LOGISTIC REGRESSION

x_train, x_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
logreg = LogisticRegression()
logreg.fit(x_train, y_train)

# check accuracy score
logreg.score(x_test, y_test)
