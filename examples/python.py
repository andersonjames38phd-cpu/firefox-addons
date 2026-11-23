"""Firefox Add-ons Scraper - Python example.

pip install apify-client
export APIFY_TOKEN=your_token
"""
import os

from apify_client import ApifyClient

client = ApifyClient(os.environ["APIFY_TOKEN"])

# Shopping extensions with 1,000+ users
run = client.actor("Turboextract/firefox-addons").call(run_input={
    "searchQueries": [],
    "categories": [
        "shopping"
    ],
    "sort": "users",
    "minUsers": 1000,
    "maxResults": 300
})

# Stream every item
for item in client.dataset(run["defaultDatasetId"]).iterate_items():
    print(item.get("name"), item.get("dailyUsers"), item.get("homepage"))

# Or fetch one page of items
page = client.dataset(run["defaultDatasetId"]).list_items(limit=100)
print(f"{page.total} items in dataset")
