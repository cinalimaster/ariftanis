# data file https://github.com/amankharwal/US-presidents-heights/blob/master/president_heights.csv

data = pd.read_csv("heights.csv")
print(data.head())

height = np.array(data["height(cm)"])
print(height)

# variety of summary statistics:
print("Mean of heights =", height.mean())
print("Standard Deviation of height =", height.std())
print("Minimum height =", height.min())
print("Maximum height =", height.max())

# compute quantiles
print("25th percentile =", np.percentile(height, 25))
print("Median =", np.median(height))
print("75th percentile =", np.percentile(height, 75))

plt.hist(height)
plt.title("Height Distribution of Presidents of USA")
plt.xlabel("height(cm)")
plt.ylabel("Number")
plt.show()
