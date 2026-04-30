import os
import datetime

def smart_rename(folder):
    for idx, filename in enumerate(os.listdir(folder)):
        ext = filename.split('.')[-1]
        new_name = f"File_{datetime.date.today()}_{idx}.{ext}"
        os.rename(os.path.join(folder, filename), os.path.join(folder, new_name))
smart_rename("C:/Users/YourUsername/Downloads")
