import torch
from transformers import AutoTokenizer, AutoModelWithLMHead

tokenizer = AutoTokenizer.from_pretrained('t5-base')
model = AutoModelWithLMHead.from_pretrained('t5-base', return_dict=True)

sequence = (" enter text here to summerize ")

inputs = tokenizer.encode("summarize: " + sequence, return_tensors='pt', max_lenght=512, truncation=True)

outputs = model.generate(inputs, max_lenght=150, min_lenght=80, lenght_penalty=5., num_beams=2)

summary = tokenizer.decode(outputs[0])

print(summary)
