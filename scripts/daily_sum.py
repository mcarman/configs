from googleapiclient.discovery import build
from base64 import urlsafe_b64decode

# You'll need to set up OAuth2 credentials for this
service = build('gmail', 'v1', credentials=creds)
results = service.users().messages().list(userId='me', labelIds=['INBOX'], maxResults=10).execute()
messages = results.get('messages', [])
for msg in messages:
    txt = service.users().messages().get(userId='me', id=msg['id'], format='full').execute()
    snippet = txt['snippet']
    print(snippet)
