# csv datafile download https://www.kaggle.com/saurav9786/amazon-product-reviews/download

# import libraries and load datafile
import numpy as np
import pandas as pd

data = pd.read_csv("amazon.csv")
print(data.head())

"""
    AKM1MP6P0OYPR  0132793040  5.0  1365811200
0  A2CX7LUOHB2NDG  0321732944  5.0  1341100800
1  A2NWSAGRHCP8N5  0439886341  1.0  1367193600
2  A2WNBOD3WNDNKT  0439886341  3.0  1374451200
3  A1GI0U4ZRJA8WN  0439886341  1.0  1334707200
4  A1QGNMC6O1VW39  0511189877  5.0  1397433600
"""

# give column names
data.columns = ['user_id', 'product_id','ratings','timestamp']

# very large dataset so ve take a sample %10
df = data[:int(len(data) * .1)]

# prepare the dataset for creating a recommendation system
counts = df['user_id'].value_counts()
data = df[df['user_id'].isin(counts[counts >= 50].index)]
data.groupby('product_id')['ratings'].mean().sort_values(ascending=False) 
final_ratings = data.pivot(index = 'user_id', columns ='product_id', values = 'ratings').fillna(0)

num_of_ratings = np.count_nonzero(final_ratings)
possible_ratings = final_ratings.shape[0] * final_ratings.shape[1]
density = (num_of_ratings/possible_ratings)
density *= 100
final_ratings_T = final_ratings.transpose()

grouped = data.groupby('product_id').agg({'user_id': 'count'}).reset_index()
grouped.rename(columns = {'user_id': 'score'},inplace=True)
training_data = grouped.sort_values(['score', 'product_id'], ascending = [0,1]) 
training_data['Rank'] = training_data['score'].rank(ascending=0, method='first') 
recommendations = training_data.head()

# Python function to generate recommendations based on the score of the product reviews
def recommend(id):     
    recommend_products = recommendations 
    recommend_products['user_id'] = id 
    column = recommend_products.columns.tolist() 
    column = column[-1:] + column[:-1] 
    recommend_products = recommend_products[column] 
    return recommend_products 

print(recommend(11))

"""
      user_id  product_id  score  Rank
113        11  B00004SB92      6   1.0
1099       11  B00008OE6I      5   2.0
368        11  B00005AW1H      4   3.0
612        11  B0000645C9      4   4.0
976        11  B00007KDVI      4   5.0

"""
