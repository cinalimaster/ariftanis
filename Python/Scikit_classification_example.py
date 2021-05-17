Scikit learn classification example ________________________

from sklearn import datasets
from sklearn.neural_network import MLPClassifier
from sklearn.model_selection import train_test_split
from sklearn.preprocesssing import StandardScalar
from matpotlib import pyplot as plt
import numpy as np
from PIL import Image
import pandas as pd
import os
from sklearn.externals import joblib
X = []
y = []
scaler = StandardScaler()
dir_counter = 0
 
for j in range(9):
  files = os.listdir('C://Users/Ryan/PycharmProjects/nn/hand_digits/{}'.format(j))
  len_f = len(files)
  for i in range(len_f):
    img = Image.open('hand_digits/{}/{}'.format(j,files[i]))
    data = np.array(list(img.getdata()))/256
    x = slice(1958, 8042) #image 78x78
    data = dat[x].tolist()
    print(data)
    print("len: ", len(data))
    X.append(data)
    y.append(j)
print('final X: ', X) 
print(X[1])
print(len(X))
print('final y: ', y)
print(len(y))
 
#neural network
clf = MLPClassifier(solver='adam', activation='relu', alpha=1e-5, hidden_layer_sizes=(400,2400) random) #this line is missing
 
"""--- this is default state of this code----
MLPClassifier(hidden_layer_sizes=100, activation='relu', *, solver='adam', alpha=0.00001, 
              batch_size='auto', learning_rate='constant', learning_rate_init=0.001, 
              power_t=0.5, max_iter=200, shuffle=True, random_state=None, tol=0.0001, 
              verbose=False, warm_start=False, momentum=0.9, nesterovs_momentum=True, 
              early_stopping=False, validation_fraction=0.1, beta_1=0.9, beta_2=0.999, 
              epsilon=1e-08, n_iter_no_change=10, max_fun=15000)
"""
print(clf)
#splitting data
X_train, X_test, y_train, y_test = train_test_split(X,y,test_size=0.15)
 
train model
print("training model...")
clf.fit(X_train, y_train)
 
#saving
filename = 'model.sav'
joblib.dump(clf, filename)
 
#open
clf = joblib.load(filename)
print("predictions: ", predictions)
print('actual: ', y_test)
print("testing")
print(y_test[0])
print(np.argmax(predictions[0]))
results = clf.score(X_test, y_test)
print("results: ", results)
 
 
 
#______________________ ırıs example______________
 
from sklearn import datasets
import numpy as np
 
iris = datasets.load_iris()
 
#split it in features and labels
X = iris.data
y = iris.target
 
print (X, y) # take a look on datamatrix feature inputs and labels [][]
print (X.shape)
print (y.shape) # get shape size info about data
 
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
 
print(X_train.shape)
print(X_test.shape)
print(y_train.shape)
print(y_test.shape) # on this example train_test_split function divided our data as 8/2 (120/30 of total 150 instances)
 
 
#in machine learning we need to split data into 2 parts a for train b for test generally this ratio is 7/3 or 8/2 we train on 7-8 and we test accuracy on 3-2 parts
# sklearn has a built in function  called "train_test_split"
 
# ----- KNN : K nearest neighbors ---- example
 
import numpy as np
import pandas as pd
from sklearn imoprt neighbors, metrics
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
 
#go search google machine learning depository Car Evaluation Data Set copy car.data file into same directory with main.py
 
data = pd.read_csv('car.data')
print(data.head) # checl head pf data
 
#car head labels are missing we should add buying, maint, doors, persons, lug_boot, safety, class # now we add column labels
 
X = data[[
          'buying',
          'maint',
          'safety'
]].values
y = data[['class']]
 
# we define variables and labels
print(X, y) # check data structure
 
#converting the data
 
Le = LabelEncoder()
for i in range(leng(X[0])):
  X[:, i] = Le.fit_transform(X[:, i])
 
print(X) # now data converted veryhigh -> 3 low ->1  
 
 
#another type of conversion label mapping
 
label_maping = {
    'unacc' :0,
    'acc' :1,
    'good' :2,
    'vgood' : 3
}
 
y['class'] = y['class'].map(label_mapping)
 
y= np.array(y)
print(y)
 
#create model
 
knn = neighbors.KNeighborsClassifier(n_neighbors=25, weights='uniform')
 
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)
 
knn.fit(X_train, y_train)
 
predictions = knn.predict(X_test)
 
accuracy = metrics.accuracy_score (y_test, prediction)
 
print("predictions: ", prediction)
 
print("accuracy: ", accuracy)
 
#after this you can remove unnecessary printings and run program
 
# lets test our model
 
a_val= 19  # we check 19th actual and predicted value
print("actual value :", y[a_val])
print("predicted value :", knn.predict(X)[a_val])
 
44 dakika 04 saniye support vector machine konusunda kaldım

_____
