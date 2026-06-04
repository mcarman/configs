from sentence_transformers import SentenceTransformer
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np

model = SentenceTransformer('all-MiniLM-L6-v2')
documents = ["Reinforcement learning in robotics", "Computer vision paper", "NLP transformers"]
query = "robotics reinforcement"
query_vec = model.encode([query])
doc_vecs = model.encode(documents)
similarities = cosine_similarity(query_vec, doc_vecs)
best_match = documents[np.argmax(similarities)]
print(f"Best match: {best_match}")
