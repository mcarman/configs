import os
import fitz  # PyMuPDF

def classify_and_move(folder):
    for file in os.listdir(folder):
        if file.endswith('.pdf'):
            doc = fitz.open(os.path.join(folder, file))
            text = ""
            for page in doc:
                text += page.get_text()
            if "invoice" in text.lower():
                os.rename(os.path.join(folder, file), os.path.join(folder, "Invoices", file))
            elif "certificate" in text.lower():
                os.rename(os.path.join(folder, file), os.path.join(folder, "Certificates", file))
classify_and_move("C:/Users/Downloads")
