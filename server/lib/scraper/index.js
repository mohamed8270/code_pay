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

        const jobcompany = extractJobDataSpace($('.jdCompanyName span'));

        const jobplace = extractJobDataSpace($('.bodyRow .details a'));

        const jobexper = extractJobDataSpace($('div.bodyRow:eq(5) .details'));

        const jobsalary = extractJobDataSpace($('div.bodyRow:eq(6) .details'));

        const jobposted = $('span.btnHighighlights:eq(0)').text().trim();

        const jobviews = $('.mqfiseo-view').text().trim();

        const jobapplied = $('span.btnHighighlights:eq(1)').text().trim();
        
        const jobdescription = $('.jobDescription').text().trim();

        const jobtype = extractJobDataSpace($('div.jobTypeCont:eq(0)'));

        const jobindustry = $('div.jobTypeCont:eq(1)').text().trim();

        const jobfunction = extractJobDataSpace($('div.jobTypeCont:eq(2)'));

        const jobrole = extractJobDataSpace($('div.jobTypeCont:eq(3)'));

        const jobskillset = extractJobDataComma($('.skillSet'));

        const jobcompanylink = $('div.aboutCompanyName h3 a').attr('href');

        const jobsource = $('div.companySource a').attr('href');

        const jobapply = $('a').attr('href');
        
        const data = {
            url,
            jobName: jobtitle,
            jobCompany: jobcompany || '',
            jobPlace: jobplace || '',
            jobExperience: jobexper || '',
            jobSalary: jobsalary || '',
            jobPosted: jobposted || '',
            jobViews: jobviews || '',
            jobApplied: jobapplied || '',
            jobDescription: jobdescription.replace(/^.*\n/, "") || '',
            jobType: jobtype || '',
            jobIndustry: jobindustry || '',
            jobFunction: jobfunction || '',
            jobRole: jobrole || '',
            jobSkillsets: jobskillset || '',
            jobCompanyUrl: jobcompanylink || '',
            jobSource: jobsource || '',
            jobApply: jobapply || '',
        };

        console.log(data);

        return data;

    } catch (error) {
        throw new Error(`Scraper error ${error.message}`);
    }
};

module.exports = scrapeJobData;

