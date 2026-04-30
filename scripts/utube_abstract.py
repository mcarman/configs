from youtube_transcript_api import YouTubeTranscriptApi
import openai

video_id = "your_video_id"
transcript = YouTubeTranscriptApi.get_transcript(video_id)
transcript_text = ' '.join([t['text'] for t in transcript])
prompt = f"Summarize the following transcript:\n{transcript_text}"
response = openai.ChatCompletion.create(
    model="gpt-4o-mini",
    messages=[{"role": "user", "content": prompt}]
)
print(response.choices[0].message.content)
