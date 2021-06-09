# importing the necessary Python libraries and the dataset:

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
data = pd.read_csv("country_vaccinations.csv")
data.head()

# explore this data

data.describe()
pd.to_datetime(data.date)
data.country.value_counts()

# the United Kingdom is made up of England, Scotland, Wales and and Northern Ireland we tune a bit to make it One country
data = data[data.country.apply(lambda x: x not in ["England", "Scotland", "Wales", "Northern Ireland"])]
data.country.value_counts()

# explore the vaccines available in this dataset:
data.vaccines.value_counts()

""" create a new DataFrame by only selecting the vaccine and the country 
columns to explore which vaccine is taken by which country:"""

df = data[["vaccines", "country"]]
df.head()

# how many countries are taking each of the vaccines mentioned in this data:
dict_ = {}
for i in df.vaccines.unique():
  dict_[i] = [df["country"][j] for j in df[df["vaccines"]==i].index]

vaccines = {}
for key, value in dict_.items():
  vaccines[key] = set(value)
for i, j in vaccines.items():
  print(f"{i}:>>{j}")
  
# visualize this data to have a look at what combination of vaccines every country is using:
import plotly.express as px
import plotly.offline as py

vaccine_map = px.choropleth(data, locations = 'iso_code', color = 'vaccines')
vaccine_map.update_layout(height=300, margin={"r":0,"t":0,"l":0,"b":0})
vaccine_map.show()
