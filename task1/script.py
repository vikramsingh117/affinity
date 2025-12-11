import requests
import json

url = "https://www.olx.in/api/relevance/search?query=car%20cover&offset=0&limit=20"

headers = {
    "User-Agent": "Mozilla/5.0",
    "Accept": "application/json"
}

try:
    response = requests.get(url, headers=headers, timeout=8)
    data = response.json()
    print(data.keys())
except requests.exceptions.Timeout:
    print("Request timed out")
except Exception as e:
    print("Error:", e)
