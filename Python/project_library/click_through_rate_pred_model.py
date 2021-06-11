# in this model predicting where click on advertisements come from it's important for advertisement placement
# salary, age, location, interest groups etc..

# download data set https://www.kaggle.com/fayomi/advertising/download

import pandas as pd
data = pd.read_csv('advertising.csv')
print(data.head())

# check is there any null value in dataset
print(data.isnull().sum())

# names of columns
print(data.columns)

# drop some unnecessary columns
x=data.iloc[:,0:7]
x=x.drop(['Ad Topic Line','City'],axis=1)
x

y=data.iloc[:,9]
y

# split the data into training and test sets
from sklearn.model_selection import train_test_split
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.3,random_state=4)
print(x_train.shape)
print(y_train.shape)
print(x_test.shape)
print(y_test.shape)

# we create logistic regression model here
from sklearn.linear_model import LogisticRegression
Lr=LogisticRegression(C=0.01,random_state=0)
Lr.fit(x_train,y_train)
y_pred=Lr.predict(x_test)
print(y_pred)

# print prediction value results
y_pred_proba=Lr.predict_proba(x_test)
print(y_pred_proba)

# accuracy of the model
from sklearn.metrics import accuracy_score
print(accuracy_score(y_test,y_pred))

# let’s have a look at the f1 score
from sklearn.metrics import f1_score
print(f1_score(y_test,y_pred))

