// Firefox Add-ons Scraper - Node.js example
// npm install apify-client
// APIFY_TOKEN=your_token node node.mjs
import { ApifyClient } from 'apify-client';

const client = new ApifyClient({ token: process.env.APIFY_TOKEN });

// AI assistants with a support email
const run = await client.actor('Turboextract/firefox-addons').call({
    "searchQueries": [
        "ai assistant"
    ],
    "onlyWithEmail": true
});

const { items } = await client.dataset(run.defaultDatasetId).listItems();
for (const item of items) {
    console.log(item.name, item.dailyUsers, item.homepage);
}
