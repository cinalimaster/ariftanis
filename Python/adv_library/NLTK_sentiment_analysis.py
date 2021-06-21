# import libraries
from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk
nltk.download('vader_lexicon')

# take a user input
user_input = input("Please Rate Our Services >>: ")
sid = SentimentIntensityAnalyzer()
score = sid.polarity_scores(user_input)
print(score)

""" Please Rate Our Services >>: great
{'neg': 0.0, 'neu': 0.0, 'pos': 1.0, 'compound': 0.6249}
"""

"""
the sentiments score looks like a dictionary with keys as ‘neg’, ‘neu’, ‘pos’, ‘compound’. 
The above output says that the sentiment of the user is 100% positive. So we can use an 
if-else statement by passing a condition that if the value of the key(neg) is not 0.0 then 
the sentiment is negative and otherwise it’s positive. So here is the complete Python 
code for real-time sentiment analysis:
"""

user_input = input("Please Rate Our Services >>: ")
sid = SentimentIntensityAnalyzer()
score = sid.polarity_scores(user_input)
if score["neg"] != 0:
      print("Negative")
else:
      print("Positive")
    
"""
Please Rate Our Services >>: not bad
Positive

Please Rate Our Services >>: not good
Negative
"""
