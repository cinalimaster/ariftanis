# go download yahoo finance find tesla and download dataset name it TSLA.csv

# import necessary library
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from fbprophet import Prophet

data = pd.read_csv("TSLA.csv")
data.head()

#visualize the “Close” column in the dataset which represents close prices of each day

close = data['Close']
ax = close.plot(title='Tesla')
ax.set_xlabel('Date')
ax.set_ylabel('Close')
plt.show()

# reate a new DataFrame with only these two columns Date and Close

data["Date"] = pd.to_datetime(data["Date"], infer_datetime_format=True)
data = data[["Date", "Close"]]

# Facebook prophet model here for predicting the stock prices of Tesla so we need to rename the columns:

data = data.rename(columns={"Date" : "ds", "Close" : "y" })

# predict the stock prices of Tesla:

model = Prophet()
model.fit(data)
predict = model.make_future_dataframe(periods=365)
forcast = model.predict(predict)
forcast[["ds", "yhat", "yhat_lower", "yhat_upper"]].tail()

# graph the model
graph = model.plot(forcast, xlabel="Date", ylabel="Price")

