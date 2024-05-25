const axios = require('axios');
const cheerio = require('cheerio');
require('dotenv').config();

// imports
const {extractJobDataSpace, extractJobDataComma} = require('../utils');

const scrapeJobData = async (url) => {
    if(!url) return;

    const username = process.env.BRIGHT_DATA_USERNAME;
    const password = process.env.BRIGHT_DATA_PASSWORD;
    const port = 22225;
    const session_id = (1000000 * Math.random()) | 0;
    const options = {
        auth: {
            username: `${username}-session-${session_id}`,
            password,
        },
        host: 'brd.superproxy.io',
        port,
        rejectUnauthorized: false,
        headers: {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36"
        }
    }

    try {
        const response = await axios.get(url, options);
        // console.log(response);
        const $ = cheerio.load(response.data);

        const jobtitle = $('.jobTitle h1').text().trim();

        const jobcompany = $('span .under-link').text().trim();

        const jobplace = extractJobDataSpace($('.bodyRow .details a'));

        const jobexper = extractJobDataSpace($('div.bodyRow:eq(1)'));

        const jobposted = $('span.btnHighighlights:eq(0)').text().trim();

        // const jobviews = $('.brightonHotels > span').text().trim();

        const jobapplied = $('span.btnHighighlights:eq(1)').text().trim();
        
        const jobdescription = $('.jobDescription').text().trim();

        const jobtype = $('div.jobTypeCont:eq(0)').text().trim();

        const jobindustry = $('div.jobTypeCont:eq(1)').text().trim();

        const jobfunction = $('div.jobTypeCont:eq(2)').text().trim();

        const jobskillset = extractJobDataComma($('.skillSet'));

        const jobcompanylink = $('div.aboutCompanyName h3 a').attr('href');

        const jobsource = $('div.companySource a').attr('href');

        // const jobapply = $('button#applyNowBtn').closest('a').attr('href');
        
        const data = {
            url,
            jobName: jobtitle,
            jobCompany: jobcompany,
            jobPlace: jobplace,
            jobExperience: jobexper,
            jobPosted: jobposted,
            // jobViews: jobviews,
            jobApplied: jobapplied,
            jobDescription: jobdescription.replace(/^.*\n/, ""),
            jobType: jobtype,
            jobIndustry: jobindustry,
            jobFunction: jobfunction,
            jobSkillsets: jobskillset,
            jobCompanyUrl: jobcompanylink,
            jobSource: jobsource,
            // jobApply: jobapply,
        };

        console.log(data);

        return data;

    } catch (error) {
        throw new Error(`Scraper error ${error.message}`);
    }
};

module.exports = scrapeJobData;

