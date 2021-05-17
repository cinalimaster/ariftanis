'''

                            Online Python Interpreter.
                Code, Compile, Run and Debug python program online.
Write your code in this editor and press "Run" button to execute it.

'''

# Exploratory Factor Analysis

#import required libraries

import pandas as import pd
import numpy as np
import seaborn as sns

#import data csv file

data = pd.read_csv("C:/Users/Username/Desktop/Datasets/Student.csv") #this sis a sample csv file in your computer

# understanding the Data

data.head()#check first 5 rows
data.tail()#check last 5 rows
data.shape#shows size of the data matrix
data.describe()#shows descriptive statistics about your csv data matrix
data.columns()#shows info about data columns names etc.
data.nunique()#shows unique values in your data usefull to check repeated and unique variables
data['gender'].unique() # shows unique values for only 'gender' column

#cleaning the data

data.isnull().sum() #check data if there is any null variables we will clean them
student = data.drop(['race/ethnicity', 'parental level of education'], axis=1) #check below

"""
with this command we remove/drop 'race/ethnicity', 'parental level of education' 
columns from the data axis=1 means from columns if we enter axis=0 it means from rows
"""

student.head() # after dropping some columns we check data again

#Correlation Analysis

correlation = student.corr()
sns.heatmap(correlation, xticklabels=correlation.rows, yticklables=correlation.columns, annot=True)
#with this command we create a heatmap give row and column names
sns.pairplot(student) #with this command we create pairplot for student data

sns.relplot(x='math score', y='reading score', hue='gender', data='student') #this is dot realation plot for gender
sns.relplot(x='math score', y='reading score', hue='launch', data='student') #this is dot realation plot for launch
#with this comand we change hue color for data dots for whether gender or launch status changes

sns.distplot(student['math score']) #distribution histogram plot chart
sns.distplot(student['writing score'], bins=10) #distribution histogram plot chart for writing score with 10blocks
sns.catplot(x='math score', kind='box', data=student) #this is box plot for math score

#___explore data phase complete now we will try to do Factor Analysis from start___

#import reqired libraries

import pandas as pd
import sklearn.datasets
from factor_analyzer import FactorAnalyzer
import matplotlib.pyplot as plt
import sys
sys.path.append('C:\Program Files\Python 3\Lib\Site_packages')

#import dataset

df = pd.read_csv('C:/Users/Username/Desktop/Datasets/Student.csv')

#checking/viewing dataset 
df.head()
df.columns
df.drop(['gender','education','age'], axis=1, inplace=True) #drop unwanted columns and push columns to left
df.info()#check df info
df.head()#check first 5 rows of df

df = df.iloc[0:,1:26] #first column (index 0) was empty with this command we removed it
df.head()#check first 5 rows of df

# Factor Analysis Phase
fa = FactorAnalyzer(n_factors=6, rotation='varimax') # we set number of factors 6 and rotation method as varimax
fa.fit(df) # we give commmand for model fit it won't if there is any null variable in matrix pay attention
df=df.dropna() #with this command we drop null values
fa.fit(df) # we try to model fit again

loadings = fa.loadings_ # we define a variable for factor loadings
ev, v = fa.get_eigenvalues() #we define 2 variable for eigenvectors and eigenvalues

#screeplot phase

xvals = range(1,df.shape[1]+1) # this command means from index 1 to last number of column + 1 defined as xvals
plt.scatter(xvals, ev) #scatter plot
plt.title('Scree Plot') #plot's name/title
plt.xlabel('Factors') #name/label of x axis
plt.ylabel('Eigen Values') #name/label of y axis
plt.grid() #enable grid for plot
plt.show()

pd.DataFrame.from_records(loadings)# This command will give factor loadings from factoranalysis results


