!pip install Transformers
import torch
from transformers import AutoTokenizer, AutoModelWithLMHead

tokenizer = AutoTokenizer.from_pretrained('t5-base')
model = AutoModelWithLMHead.from_pretrained('t5-base', return_dict=True)


sequence = ( " enter text here each line between "" ")
inputs = tokenizer.encode("summarize: " + sequence, return_tensors='pt', max_length=512, truncation=True)

outputs = model.generate(inputs, max_length=150, min_length=80, length_penalty=5., num_beams=2)

summary = tokenizer.decode(outputs[0])

print(summary)
