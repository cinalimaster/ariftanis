""" 
Google Trends provides an API that can be used to analyze the daily searches on Google. 
This API is known as pytrends, you can easily install it in your systems by using the 
pip command; pip install pytrends.
"""
# import libraries
import pandas as pd
from pytrends.request import TrendReq
import matplotlib.pyplot as plt
trends = TrendReq()

# create a DataFrame of the top 10 countries which search for “Machine Learning” on Google:
trends.build_payload(kw_list=["Machine Learning"])
data = trends.interest_by_region()
data = data.sort_values(by="Machine Learning", ascending=False)
data = data.head(10)
print(data)

# visualise data and create a plot
ata.reset_index().plot(x="geoName", y="Machine Learning", 
                        figsize=(20,15), kind="bar")
plt.style.use('fivethirtyeight')
plt.show()

# see how the total search queries based on “Machine Learning” increased or decreased on Google:
data = TrendReq(hl='en-US', tz=360)
data.build_payload(kw_list=['Machine Learning'])
data = data.interest_over_time()
fig, ax = plt.subplots(figsize=(20, 15))
data['Machine Learning'].plot()
plt.style.use('fivethirtyeight')
plt.title('Total Google Searches for Machine Learning', fontweight='bold')
plt.xlabel('Year')
plt.ylabel('Total Count')
plt.show()
