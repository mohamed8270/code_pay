const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
require('dotenv').config();

//  imports
const {scrapeAndStoreJobData} = require('./lib/actions');
const scrapeJobData = require('./lib/scraper');

// express objects
const app = express();
app.use(cors());
app.use(express.json());
app.use(bodyParser.json());

// ports
const port = process.env.PORT;
const localhost = process.env.LOCAL_HOST;
const hosturl = `${localhost+port}`;

// get job data
app.post('/scrape/jobs', async (req, res) => {
    const joburl = `https://www.foundit.in/job/fflutter-developer-radial-hr-solutions-bengaluru-bangalore-remote-23378163?searchId=eb3850c4-b514-4d9d-9aec-e59277fecd78`
    try {
        const scrapedData = await scrapeJobData(joburl);
        // const scrapedData = await scrapeAndStoreJobData(joburl);
        res.json({message: 'Data scarped successfully!', 'output': scrapedData});
    } catch (error) {
        res.status(500).send({ message: "An error occurred while getting the job details", error: error.message });
    }
});

// listener
app.listen(port, () => {
    console.log(`App running on port ${port}`);
    console.log(`Localhost url is ${hosturl}`);
});
