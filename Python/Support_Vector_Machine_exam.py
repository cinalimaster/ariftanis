## SVM support vector machine example


from sklearn import datasets
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn import svm
from sklearn.metrics import accuracy_score
#youcan download irisdataset achive.ics.edu/ml/datasets/iris


iris = datasets.load_iris()


# split it in features and labels
X = iris.data
y = iris.target


classes = ['Iris Satosa', 'Iris Versicolour', 'Irıs Virginica']
print(X.shape)
print(y.shape)


# hours of study vs good/bad grades
# 10 different studies train with 8 students predict with remaining 2
# level of accuracy


X_train, X_test, y_train, y_test = train_test_split(X, y, test_size= 0.2)


model = svm.SVC()
model.fit(X_train, y_train)


print(model)


predictions = model.predict(X_test)
acc = accuracy_score(y_test, predictions)


print("predictions: ", predictions)
print("actual:      ", y_test)
print("accuracy: ", acc)


for i in range(len(predictions)):
  print(classes[predictions[i]])
#with this command program prints prediction named for each class 0,1,2 etc


print(X_train.shape)
print(X_test.shape)
print(y_train.shape)
print(y_test.shape)

