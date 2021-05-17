#Load dependencies
import pandas as pd
import numpy as np
from sklearn.precprocessing inport StandardScaler
from matplotlib import*
import matplotlib.pyplot as plt
from matplotlib.cm import register_cmap
from scipy import state
from sklearn.decomposition import PCA as sklearnPCA
import seaborn

#Load movie names and movie ratings
movies = pd.read_csv('C:\\Users\\Username\\Desktop\\movies.csv')
ratings = pd.read_csv('C:\\Users\\Username\\Desktop\\ratings.csv')
ratings.drop(['timestamp'], axis=1, inplace=True)

#here data converted into numerical format
def replace_name(x):
    return movies[movies['movieId']==x].title.values[0]
ratings.movieId = ratings.movieId.map(replace_name)
M = ratings.pivot_table(index=['userId'], columns=['muvieId'], values='rating')
m= M.shape

#convert null values into zero
df1 = M.replace(np.nan, 0, regex=True)

#performing standardization define a variable
X_std = StandardScaler().fit_transform(df1)

mean_vec = np.mean(X_std, axis=0)
cov_mat = (X_std - mean_vec).T.dot((X_std - mean_vec)) / (X_std.shape[0]-1)
print('Covariance matrix \n%s' %cov_mat)

#Perform eigendecompositon on covariance matrix
cov_mat = np.cov(X_std.T)
eig_vals, eig_vecs = np.linalg.eig(cov_mat)
print('Eigenvectors \n%s' %eig_vecs)
print('\nEigenvalues \n%s' %eig_vals)

# Visually confirm that the list is correctly sorted by decreasing eigenvalues
eig_pairs = [(np.abs(eig_vals[i]), eig_vecs[:,i])] for i in range(len(eig_vals))]
print('Eigenvalues in descending order:')
for i in eig_pairs:
    print(i[0])

#now we have prepared enough data for PCA function from sklearn library to process

from sklearn.decomposition import PCA

pca= PCA(n_components=2)
pca.fit_transform(df1)
print(pca.explained_variance_ratio_)

#Explained variance calculated and showed in scree a plot
pca = PCA().fit(X_std)
plt.plot(np.cumsum(pca.explained_variance_ratio_))
plt.xlabel('number of components')
plt.ylabel('cumulative explained variance')
plst.show()

# at these stage you try to capture enough data vectors to explain variance
# and cut of other vectors which are not significant to explain variance


