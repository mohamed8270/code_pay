const connectToDB = require('../../mongoose');
const scrapeJobData =  require('../scraper');

const scrapeAndStoreJobData = async (joburl) => {
    if(!joburl) return true;

    try {
        connectToDB();
        const scrapedJobData = await scrapeJobData(joburl);
    } catch (error) {
        console.log(`Failed to create or update product: ${error.message}`);
    }
}

module.exports = {scrapeAndStoreJobData};