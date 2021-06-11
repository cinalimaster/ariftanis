# will be using the langdetect package in Python
# install it by using the pip command; pip install langdetect
from langdetect import detect
text = input("Enter any text in any language: ")
print(detect(text))

