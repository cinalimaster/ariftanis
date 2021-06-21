# The Spotify recommendation system uses collaborative filtering to recommend songs and podcasts to users
# csv file location https://drive.google.com/file/d/1it3VAYze6nChmaxPHF3QLJcvoZhMsemQ/view?usp=sharing

# import libraries and load data

import warnings
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from tqdm import tqdm
sns.set()

data = pd.read_csv("spotify.csv")
data.head()

# explore data
data.info()

"""
 RangeIndex: 174389 entries, 0 to 174388
 Data columns (total 19 columns):
  #   Column            Non-Null Count   Dtype  
 ---  ------            --------------   -----  
  0   acousticness      174389 non-null  float64
  1   artists           174389 non-null  object 
  2   danceability      174389 non-null  float64
  3   duration_ms       174389 non-null  int64  
  4   energy            174389 non-null  float64
  5   explicit          174389 non-null  int64  
  6   id                174389 non-null  object 
  7   instrumentalness  174389 non-null  float64
  8   key               174389 non-null  int64  
  9   liveness          174389 non-null  float64
  10  loudness          174389 non-null  float64
  11  mode              174389 non-null  int64  
  12  name              174389 non-null  object 
  13  popularity        174389 non-null  int64  
  14  release_date      174389 non-null  object 
  15  speechiness       174389 non-null  float64
  16  tempo             174389 non-null  float64
  17  valence           174389 non-null  float64
  18  year              174389 non-null  int64  
 dtypes: float64(9), int64(6), object(4)
 memory usage: 25.3+ MB
 """

# check for null values
data.isnull().sum()
# there is no null

# drop columns wont be used in correlation matrix check correlation matrix
df = data.drop(columns=['id', 'name', 'artists', 'release_date', 'year'])
df.corr()

# normalize the dataset by using the MinMaxScaler (given in Scikit-learn)

from sklearn.preprocessing import MinMaxScaler
datatypes = ['int16', 'int32', 'int64', 'float16', 'float32', 'float64']
normarization = data.select_dtypes(include=datatypes)
for col in normarization.columns:
    MinMaxScaler(col)

# create a new feature here that will differentiate songs from different categories. For this task, I’ll use the K means clustering algorithm
from sklearn.cluster import KMeans
kmeans = KMeans(n_clusters=10)
features = kmeans.fit_predict(normarization)
data['features'] = features
MinMaxScaler(data['features'])


# use the features in the dataset to recommend songs to the users:

class Spotify_Recommendation():
    def __init__(self, dataset):
        self.dataset = dataset
    def recommend(self, songs, amount=1):
        distance = []
        song = self.dataset[(self.dataset.name.str.lower() == songs.lower())].head(1).values[0]
        rec = self.dataset[self.dataset.name.str.lower() != songs.lower()]
        for songs in tqdm(rec.values):
            d = 0
            for col in np.arange(len(rec.columns)):
                if not col in [1, 6, 12, 14, 18]:
                    d = d + np.absolute(float(song[col]) - float(songs[col]))
            distance.append(d)
        rec['distance'] = distance
        rec = rec.sort_values('distance')
        columns = ['artists', 'name']
        return rec[columns][:amount]

recommendations = Spotify_Recommendation(data)
recommendations.recommend("Lovers Rock", 10)


