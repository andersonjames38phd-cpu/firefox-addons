#!/usr/bin/env bash
# Firefox Add-ons Scraper - curl examples
# Replace YOUR_TOKEN with an Apify API token (https://console.apify.com/account/integrations).

set -euo pipefail

ACTOR="Turboextract~firefox-addons"
TOKEN="${APIFY_TOKEN:-YOUR_TOKEN}"

# 1. Shopping extensions with 1,000+ users (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [],
    "categories": [
      "shopping"
    ],
    "sort": "users",
    "minUsers": 1000,
    "maxResults": 300
  }'

# 2. AI assistants with a support email (start a run)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [
      "ai assistant"
    ],
    "onlyWithEmail": true
  }'

# 3. Trending privacy add-ons (wait and get the dataset items in one call)
curl -sS -X POST "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items?token=${TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "searchQueries": [],
    "categories": [
      "privacy-security"
    ],
    "sort": "hotness"
  }'
