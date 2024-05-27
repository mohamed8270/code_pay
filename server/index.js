const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
require('dotenv').config();

//  imports
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
    // const location = req.body.location;
    // const jobname = req.body.job;
    const location = 'coimbatore';
    const jobname = 'flutter+developer';
    const url = `https://www.foundit.in/job/flutter-developer-bengaluru-bangalore-26279460?searchId=850bf218-6830-4501-b9b1-08551b6a2b62`
    try {
        const jobData = await scrapeJobData(url);
        res.json({message: 'Data scarped successfully!','output': jobData});
    } catch (error) {
        res.status(400).send({message: `Server ${error.message}`});
    }
});

// listener
app.listen(port, () => {
    console.log(`App running on port ${port}`);
    console.log(`Localhost url is ${hosturl}`);
});
