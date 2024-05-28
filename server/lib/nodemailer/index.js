const nodemailer = require('nodemailer');
require('dotenv').config();

// notification type
const Notification = {
    WELCOME: 'WELCOME',
};

// mail type accordian
const generateEmailBody = async (job, type) => {

    // shortened title
    const shortenedTitle = job.jobName.length > 20 ? `${job.jobName.subString(0,20)}` : job.jobName;

    // subject and title
    let subject = '';
    let body = '';

    // switch case to generate body and sub
    switch (key) {
        case value:
            
            break;
    
        default:
            break;
    }
},