# data bicycle counts on Seattle’s Fremont Bridge

# https://data.seattle.gov/Transportation/Fremont-Bridge-Hourly-Bicycle-Counts-by-Month-Octo/65db-xm6k

# !curl -o FremontBridge.csv https://data.seattle.gov/api/views/65db-xm6k/rows.csv?accessType=DOWNLOAD

import pandas as pd
data = pd.read_csv("fremont-bridge.csv", index_col= 'Date', parse_dates=<strong>True</strong>)
data.head()

# dataset by shortening the column names and adding a “Total” column
data.columns = ["West", "East"]
data["Total"] = data["West"] + data["East"] 
data.head()

# data summary
data.dropna().describe()

#visualise
import matplotlib.pyplot as plt
import seaborn
seaborn.set()
data.plot()
plt.ylabel("Hourly Bicycle count")
plt.show()

# resample by week
weekly = data.resample("W").sum()
weekly.plot(style=[':', '--', '-'])
plt.ylabel('Weekly bicycle count')
plt.show()

# Here we’ll do a 30-day rolling mean of our data, making sure to center the window:
daily = data.resample('D').sum()
daily.rolling(30, center=True).sum().plot(style=[':', '--', '-'])
plt.ylabel('mean hourly count')
plt.show()

# eliminate jagged chart by using gaussian function
daily.rolling(50, center=True,
              win_type='gaussian').sum(std=10).plot(style=[':','--', '-'])
plt.show()

# hourly traffic distribution
import numpy as np
by_time = data.groupby(data.index.time).mean()
hourly_ticks = 4 * 60 * 60 * np.arange(6)
by_time.plot(xticks= hourly_ticks, style=[':', '--', '-'])
plt.ylabel("Traffic according to time")
plt.show()

