# Linear Regression Model Example


from sklearn import datasets
from sklearn import linear_models
from sklearn.model_selection import train_test_split
from matplotlib import pyplot as plt


#get boston dataset
boston datasets.load_boston()


X = boston.data
y = boston.target


print("X: ", X)
print("X.shape: ", X.shape)
print("y: ", y)
print("y.shape: ", y.shape)


#algorithm
l_reg = linear_model.LinearRegression()


# we create a simple changable variable to select and check 15 different features
#we do a matrix transpose to see chart for 506 instances
F_num = 0 #you can change this number to 0->15 to change feature 
plt.scatter(X.T[F_num], y)
plt.show()


# seperate training and testing data
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)


# model train


model = l_reg.fit(X_train, y_train)


predictions = model.predict(X_test)
print("Predictions", predictions)
print("R^2 value: ", l_reg.score(X, y))
print("coedd: ", l_reg.coef) #this is slope value
print("intercept: ", lereg.intercept) #this is intercept value
py
