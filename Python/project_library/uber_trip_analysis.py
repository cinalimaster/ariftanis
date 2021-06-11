# link to download dataset
# https://github.com/amankharwal/Website-data/raw/master/uber-raw-data-sep14.csv.zip

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
data = pd.read_csv("uber.csv")
data["Date/Time"] = data["Date/Time"].map(pd.to_datetime) 
data.head()

# analyse uber trips days and hours
data["Day"] = data["Date/Time"].apply(lambda x: x.day)
data["Weekday"] = data["Date/Time"].apply(lambda x: x.weekday())
data["Hour"] = data["Date/Time"].apply(lambda x: x.hour)
print(data.head())

# check trip density in days of month and plot it
sns.set(rc={'figure.figsize':(12, 10)})
sns.distplot(data["Day"])

# check trip hours in hours of day and plot it
sns.distplot(data["Hour"])

# check trip distribution in week days (mon-thu-wed-thur-...)
sns.distplot(data["Weekday"])

# correlation of hours and weekdays on the Uber trips:

# Correlation of Weekday and Hour

df = data.groupby(["Weekday", "Hour"]).apply(lambda x: len(x))
df = df.unstack()
sns.heatmap(df, annot=False)

# Uber trips according to the regions of the New Your city

data.plot(kind='scatter', x='Lon', y='Lat', alpha=0.4, s=data['Day'], label='Uber Trips',
figsize=(12, 8), cmap=plt.get_cmap('jet'))
plt.title("Uber Trips Analysis")
plt.legend()
plt.show()
