# NLP banking customer reviews using python

# Load reviews in the form of html files

import glob

html_files = glob.glob(r".\BankBazaarData\*.html")

import codecs

s = " "
html_array = []
for file in html_files:
	f = codecs.open(file, 'r')
	html_array.append(f.read())

html = S.join(html_array)

html.count("ellipsis_text")

Parse them using BeautifulSoup

from bs4 import BeautifulSoup

parsed_html = BeautifulSoup(html,"html.parser")

reviews = parsed_html.find_all('span', attrs = {'class': 

"ellipsis_text", 'itemprop': "description"})

ratings = parsed_html.find_all('span, attrs= {'itemprop': 

"ratingvalue"})

import re

def cleanhtml(raw_html):
	clean = re.compile('<.*=>')
	cleantext = re.sub(clean, '', raw_html)
	return cleantext

rates = []
for i in range(0,len(ratings)):
	rates.append(cleanhtml(ratings[i].text))

revws = []
for i in range(0,len(reviews)):
	revws.append(cleanhtml(reviews[i].text))


# Convert data into a dataframe

import pandas as pd

Reviews = pd.DataFrame({'Reviews': revws, 'Ratings': rates})

Reviews = Reviews.replace({r'\s+$': '', r'^\s+: ''}, regex = 

True).replace(r'\n', ' ', regex = True)

Reviews.drop_duplicates(inplace = True)

Reviews.count()

Reviews.head(5)

Reviews.dtypes

Reviews.['Ratings'] = Reviews['Ratings'].astype(float)

Reviews.dtypes

# Calculate sentiment

def calculate_sentiment(reviews):
	if reviews['Ratings'] < 4.0:
		return 0 # Negative
	else:
		return 1 # Positive

Reviews["Sentiment"] = Reviews.apply(calculate_sentiment, axis=1)

Reviews.to_cvs("BankReviews.csv")

# Save data in the form of csv

# define where is text comments and where is sentiment score

text, y = Reviews.Reviews, Reviews.Sentiment

type(text)

# split data into train and test 70:30

from sklearn.model_selection import train_test_split

text_train, text_test, y_train, y_test = train_test_split(text, 

y, test_size=0.33, random_state=42)

# Explore train and test data

import numpy as np

np.unique(y_train)

np.unique(y_test)

print("Samples per Sentiment (training): {}".format(np.bincount

(y_train)))

print("Samples per Sentiment (testing): {}".format(np.bincount

(y_test)))


# Feature Extraction rescaling the Data with tf-idf

# tfidf(w,d) = tflog([N+1]/[N_w + 1])+1   <- this is the formula
# tf means number of times (frequency) t word in the document. 

divided by total number of words in the document so we create a 

weight for each word

# for detail click on a function and press shift+TAB to see 

function help and parameter definitions


from sklearn.feature_extraction.text import TfidfVectorizer

def tfidf_extractor(corpus, ngram_range(1,)):
	vectorizer = TfidfVectorizer(min_df=1,
					norm='l2',
					smooth_idf=True,
					use_idf=True,
					ngram_range=ngram_range)
	features = vectorizer.fit_transform(corpus)
	return vectorizer, features


# now we comvert our train and test feature data into 

feature_vectors
tfidf_vectorizer, tfidf_train_features = tfidf_extractor

(text_train)
tfidf_test_features = tfidf_vectorizer.transform(text_test)

tfidf_train_features

tfidf_train_features.data

tfidf_test_features

from sklearn import metrics

def get_metrics(true_labels, predicted_labels):
	print('Accuracy:', np.round(metrics.accuracy_score

(true_labels, predicted_labels),2))
	print('Precision:', np.round(metrics.precision_score

(true_labels, predicted_labels, average='weighted'),2))
	print('Recall:', np.round(metrics.recall_score

(true_labels, predicted_labels, average='weighted'),2))
	print('F1 Score:', np.round(metrics.f1_score(true_labels, 

predicted_labels, average='weighted'),2))


def train_predict_evaluate_model(classifier, train_features, 

train_labels, test_features, test_labels):
# build model
classifier.fit(train_features, train_labels)
# predict using model
predictions = classifier.predict(test_features)
# evaluate model prediction performance
get_metrics(true_labels=test_labels, 

predicted_labels=predictions)
return predictions

# Multinomial Naive Bayes with tfidf features

from sklearn.naive_bayes import MultinomialNB

mnb_best = MultinomialNB(alpha = 0.001, fit_prior = True)

mnb_tfidf_predictions = train_predict_evaluate_model

(classifier=nmb_best,
	train_features=tfidf_train_features,
	train_labels=y_train,
	test_features=tfidf_test_features,
	test_labels=y_test)

# Confusion Matrix
cm = metrics.confusion_matrix(y_test, mnb_tfidf_predictions)
pd.DataFrame(cm, index=(0,2), columns=range(0,2))

# Incorrect Predictions

print("*******[0- Negative, 1- Positive]*******")
for document, label, predicted_label in zip(text_test, y_test, 

mnb_tfidf_predictions):
	for i in range(0,2):
		if label == i and predicted_label != i:
			print("Actual Label:", +label)
			print("Predicted Label:", +predicted_label)
			print("Review:", re.sub('\n', ' ', document)
