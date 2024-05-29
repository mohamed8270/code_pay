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

        const jobtitle = $('#titleSection h1').text().trim();
        console.log(jobtitle);

        const jobcompany = extractJobDataSpace($('#titleSection a'));

        const jobplace = extractJobDataSpace($('#jobHighlight a'));

        const jobexper = extractJobDataSpace($('#jobHighlight div.flex .items-center .gap-1 span.text-xs:eq(0)'));

        const jobsalary = extractJobDataSpace($('#jobHighlight div.flex .items-center .gap-1 span.text-xs:eq(1)'));

        const jobposted = $('#jobHighlight div:eq(8) span').text().trim();

        const jobviews = $('#jobHighlight div:eq(9) span').text().trim();

        const jobapplied = $('#jobHighlight div:eq(10) span').text().trim();
        
        const jobdescription = $('.break-all').text().trim();

        const jobtype = extractJobDataSpace($('#jobInfo div:eq(0) a'));

        const jobindustry = $('#jobInfo div:eq(4) a').text().trim();

        const jobfunction = extractJobDataSpace($('#jobInfo div:eq(8) a'));

        const jobrole = extractJobDataSpace($('#jobInfo div:eq(12) a'));

        const jobskillset = extractJobDataComma($('#jobInfo div:eq(16) a'));

        const jobcompanylink = $('#jobCompany p.text-xs').text().trim();

        const jobsource = $('#jobCompany label.text-xs span.text-brand-primary a').attr('href');

        const jobapply = $('div.sticky.bottom-0.border.border-surface-primary-normal.bg-surface-primary-normal.px-4 a[target="_self"]').attr('href');

        const jobpostednumber = Number(jobposted.replace(/\D/g,''));

        const jobviewsnumber = Number(jobviews.replace(/\D/g,''));

        const jobappliednumber = Number(jobapplied.replace(/\D/g,''));
        
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
            jobPostedValue: jobpostednumber || 0,
            jobAppliedValue: jobappliednumber || 0,
            jobViewsValue: jobviewsnumber || 0,
            postedHistory: [],
            appliedHistory: [],
        };

        console.log(data);

        return data;

    } catch (error) {
        throw new Error(`Scraper error ${error.message}`);
    }
};

module.exports = scrapeJobData;

