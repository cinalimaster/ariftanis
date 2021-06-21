# datafile
# https://query1.finance.yahoo.com/v7/finance/download/AAPL?period1=1587284575&period2=1618820575&interval=1d&events=history&includeAdjustedClose=true

# pip install autots

# install libraries load data
import pandas as pd
import matplotlib.pyplot as plt
data = pd.read_csv("AAPL.csv")

# prepare data as using close values
data = data[["Date", "Close"]]
data["Date"] = pd.to_datetime(data.Date)
data["Close"].plot(figsize=(12, 8), title="Apple Stock Prices", fontsize=20, label="Close Price")
plt.legend()
plt.grid()
plt.show()

# use autots library here
from autots import AutoTS
model = AutoTS(forecast_length=10, frequency='infer', 
               ensemble='simple', drop_data_older_than_periods=200)
model = model.fit(data, date_col='Date', value_col='Close', id_col=None)

#forecast_length=10 here is the future prediction parameter lenght you can change it

# 
prediction = model.predict()
forecast = prediction.forecast
print("Stock Price Prediction of Apple")
print(forecast)

"""
Stock Price Prediction of Apple
                 Close
2021-04-19  132.794042
2021-04-20  132.882870
2021-04-21  132.971698
2021-04-22  133.060526
2021-04-23  133.149354
2021-04-26  133.415838
2021-04-27  133.504666
2021-04-28  133.593494
2021-04-29  133.682322
2021-04-30  133.771150
"""
  
