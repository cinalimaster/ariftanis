# recommends based on the content of the video that the user watched earlier.
# use the concept of cosine similarity in machine learning
# Ted Talks recommendation system contains the transcripts of all the audios and videos of Ted talks uploaded at Ted.com

# import data
import numpy as np
import pandas as pd
data = pd.read_csv("ted_talks.csv")
print(data.head())

"""
transcript                                                url
0  Good morning. How are you?(Laughter)It's been ...  https://www.ted.com/talks/ken_robinson_says_sc...
1  Thank you so much, Chris. And it's truly a gre...  https://www.ted.com/talks/al_gore_on_averting_...
2  (Music: "The Sound of Silence," Simon & Garfun...  https://www.ted.com/talks/david_pogue_says_sim...
3  If you're here today — and I'm very happy that...  https://www.ted.com/talks/majora_carter_s_tale...
4  About 10 years ago, I took on the task to teac...  https://www.ted.com/talks/hans_rosling_shows_t...
"""

# create a new column as a title by separating the title from the URL:

data["title"] = data["url"].map(lambda x:x.split("/")[-1])

# first prepare this dataset and then let’s use cosine similarity to measure the similarities between different Ted talks
from sklearn.feature_extraction import text
ted_talks = data["transcript"].tolist()
bi_tfidf = text.TfidfVectorizer(input=ted_talks, stop_words="english", ngram_range=(1,2))
bi_matrix = bi_tfidf.fit_transform(ted_talks)

uni_tfidf = text.TfidfVectorizer(input=ted_talks, stop_words="english")
uni_matrix = uni_tfidf.fit_transform(ted_talks)

from sklearn.metrics.pairwise import cosine_similarity
bi_sim = cosine_similarity(bi_matrix)
uni_sim = cosine_similarity(uni_matrix)

# create a Python function to recommend ted talks based on their content. So let’s define a Python function and have a look at some recommendations

def recommend_ted_talks(x):
    return ".".join(data["title"].loc[x.argsort()[-5:-1]])
    
data["ted_talks_uni"] = [recommend_ted_talks(x) for x in uni_sim]
data["ted_talks_bi"] = [recommend_ted_talks(x) for x in bi_sim]
print(data['ted_talks_uni'].str.replace("_", " ").str.upper().str.strip().str.split("\n")[1])

"""
['RORY BREMNER S ONE MAN WORLD SUMMIT', '.ALICE BOWS LARKIN WE RE TOO LATE TO PREVENT CLIMATE CHANGE 
HERE S HOW WE ADAPT', '.TED HALSTEAD A CLIMATE SOLUTION WHERE ALL SIDES CAN WIN', '.AL GORE S NEW 
THINKING ON THE CLIMATE CRISIS']
"""

