# we use googletrans API new name is google_trans_new
# pip command ; pip install google_trans_new

from google_trans_new import google_translator
import streamlit as st
translator = google_translator()
st.title("Language Translator")
text = st.text_input("Enter a text")
translate = translator.translate(text, lang_tgt='fr') # fr means french
st.write(translate)

# Since we are using the streamlit library here, we need to run this code using the streamlit run file name.py command in your terminal.
