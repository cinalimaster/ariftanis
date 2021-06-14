# INSTAL REQUIRED LIBRARY USING PIP COMMAND "pip install pytrends"

import pandas as pd
from pytrends.request import TrendReq
import matplotlib.pyplot as plt
trends = TrendReq()

"""Keyword Interest By Region
Let’s see the terms that are popular in the region around the world. 
I will choose the term to search for as “Data Science”:"""

trends.build_payload(kw_list=["Data Science"])
data = trends.interest_by_region()
print(data.sample(10))

# Values calculated on a scale of 0 to 100
df = data.sample(15)
df.reset_index().plot(x="geoName", y="Data Science", figsize=(120,16), kind="bar")
plt.show()
# create a chart

# top daily search trends around the world.

data = trends.trending_searches(pn="india")
print(data.head(10))

# Google Keyword Suggestion
keyword = trends.suggestions(keyword="Programming")
data = pd.DataFrame(keyword)
print(data.head())


